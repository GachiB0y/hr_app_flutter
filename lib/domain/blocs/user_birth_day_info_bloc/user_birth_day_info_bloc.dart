import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'user_birth_day_info_bloc.freezed.dart';
part 'user_birth_day_info_bloc.g.dart';
part 'user_birth_day_info_event.dart';
part 'user_birth_day_info_state.dart';

class UserBirthDayInfoBloc
    extends Bloc<UserBirthDayInfoEvent, UserBirthDayInfoState> {
  final UserRepository userRepo;
  final AuthRepository authRepository;

  UserBirthDayInfoBloc({
    required this.userRepo,
    required this.authRepository,
  }) : super(const UserBirthDayInfoState.loading()) {
    on<UserBirthDayInfoEvent>((event, emit) async {
      if (event is UserBirthDayInfoEventFetch) {
        await onUserBirthDayInfoEventFetch(emit);
      }
    });
  }

  Future<void> onUserBirthDayInfoEventFetch(
      Emitter<UserBirthDayInfoState> emit) async {
    emit(const UserBirthDayInfoState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      BirthDayInfoEntity birthDayInfoLoaded = await userRepo
          .getBirthDayInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 10));

      emit(
          UserBirthDayInfoState.loaded(birthDayInfoLoaded: birthDayInfoLoaded));
    } on TimeoutException {
      emit(const UserBirthDayInfoState.error());
    } catch (e) {
      emit(const UserBirthDayInfoState.error());
    }
  }
}
