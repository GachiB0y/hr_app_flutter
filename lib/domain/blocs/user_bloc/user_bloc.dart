import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_bloc.g.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  final AuthRepository authRepository;

  UserBloc({
    required this.userRepo,
    required this.authRepository,
  }) : super(const UserState.loading()) {
    on<UserEvent>((event, emit) async {
      if (event is UserEventFetch) {
        await onUserEventFetch(emit);
      }
    });
  }

  Future<void> onUserEventFetch(Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      User userLoaded = await userRepo
          .getUserInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 5));

      emit(UserState.loaded(userLoaded: userLoaded));
    } on TimeoutException {
      emit(const UserState.error());
    } catch (e) {
      emit(const UserState.error());
    }
  }
}
