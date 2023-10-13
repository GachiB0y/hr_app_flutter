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
  }) : super(const OtherUserState.loaded(
            listUsersLoaded: [], currentProfileUser: null)) {
    on<OtherUsersEvent>((event, emit) async {
      if (event is OtherUsersEventGethUsersByPhoneNumber) {
        await onOtherUsersEventGethUsersByPhoneNumber(emit, event);
      } else if (event is OtherUsersEventClearList) {
        onOtherUsersEventClearList(emit);
      } else if (event is OtherUsersEventGethUsersByUserId) {
        await onOtherUsersEventGethUsersByUserId(emit, event);
      } else if (event is OtherUsersEventFindUsers) {
        await onOtherUsersEventFindUsers(emit, event);
      }
    });
  }

  void onOtherUsersEventClearList(Emitter<OtherUserState> emit) {
    emit(const OtherUserState.loaded(
        listUsersLoaded: [], currentProfileUser: null));
  }

  Future<void> onOtherUsersEventGethUsersByPhoneNumber(
      Emitter<OtherUserState> emit,
      OtherUsersEventGethUsersByPhoneNumber event) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await userRepo
          .getUserByPhoneNumber(
              userToken: accessToken as String, phoneNumber: event.phoneNumber)
          .timeout(const Duration(seconds: 10));

      final newState = (state as OtherUserStateLoaded)
          .copyWith(listUsersLoaded: listUsersLoaded);

      emit(newState);
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }

  Future<void> onOtherUsersEventGethUsersByUserId(Emitter<OtherUserState> emit,
      OtherUsersEventGethUsersByUserId event) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      User currentUserProfile = await userRepo
          .getUserInfoById(
              userToken: accessToken as String, userID: event.userId)
          .timeout(const Duration(seconds: 10));
      final newState = (state as OtherUserStateLoaded)
          .copyWith(currentProfileUser: currentUserProfile);

      emit(newState);
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }

  Future<void> onOtherUsersEventFindUsers(
      Emitter<OtherUserState> emit, OtherUsersEventFindUsers event) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await userRepo
          .findUser(userToken: accessToken as String, findText: event.findText)
          .timeout(const Duration(seconds: 10));

      final newState = (state as OtherUserStateLoaded)
          .copyWith(listUsersLoaded: listUsersLoaded);

      emit(newState);
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }
}
