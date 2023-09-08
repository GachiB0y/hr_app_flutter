import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'other_users_bloc.freezed.dart';
part 'other_users_bloc.g.dart';
part 'other_users_event.dart';
part 'other_users_state.dart';

class OtherUsersBloc extends Bloc<OtherUsersEvent, OtherUserState> {
  final UserRepository userRepo;
  final AuthRepository authRepository;

  OtherUsersBloc({
    required this.userRepo,
    required this.authRepository,
  }) : super(const OtherUserState.loading()) {
    on<OtherUsersEvent>((event, emit) async {
      if (event is OtherUsersEventFetch) {
        await onOtherUsersEventFetch(emit, event);
      }
    });
  }

  Future<void> onOtherUsersEventFetch(
      Emitter<OtherUserState> emit, OtherUsersEventFetch event) async {
    emit(const OtherUserState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await userRepo
          .getUserByPhoneNumber(
              userToken: accessToken as String, phoneNumber: event.phoneNumber)
          .timeout(const Duration(seconds: 5));

      emit(OtherUserState.loaded(listUsersLoaded: listUsersLoaded));
    } on TimeoutException {
      emit(const OtherUserState.error());
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }
}
