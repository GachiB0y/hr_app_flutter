import 'dart:async';
import 'dart:io' as io;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
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
    on<OtherUsersEvent>(
      (event, emit) => event.map<Future<void>>(
        gethUsersByPhoneNumber: (event) async =>
            await _onOtherUsersEventGethUsersByPhoneNumber(emit, event),
        clearList: (event) => _onOtherUsersEventClearList(emit),
        gethUsersByUserId: (event) async =>
            await _onOtherUsersEventGethUsersByUserId(emit, event.userId),
        findUsers: (event) async =>
            await _onOtherUsersEventFindUsers(emit, event),
        saveTagsToSend: (event) async =>
            await _onOtherUsersEvenSaveTagsToSend(emit, event),
        addTag: (event) => _onOtherUsersEventAddTag(emit, event),
        deleteTag: (event) => _onOtherUsersEventDeleteTag(emit, event),
        sendAvatarWithProfile: (event) async =>
            await _onOtherUsersEventSendAvatarWithProfile(emit, event),
      ),
    );
  }

  Future<void> _onOtherUsersEventClearList(Emitter<OtherUserState> emit) async {
    emit(const OtherUserState.loaded(
        listUsersLoaded: [], currentProfileUser: null));
  }

  Future<void> _onOtherUsersEventGethUsersByPhoneNumber(
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

  Future<void> _onOtherUsersEventGethUsersByUserId(
      Emitter<OtherUserState> emit, String userID) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      User currentUserProfile = await userRepo
          .getUserInfoById(userToken: accessToken as String, userID: userID)
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

  Future<void> _onOtherUsersEventFindUsers(
      Emitter<OtherUserState> emit, OtherUsersEventFindUsers event) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await userRepo
          .findUser(userToken: accessToken as String, findText: event.findText)
          .timeout(const Duration(seconds: 10));

      final newState = OtherUserStateLoaded(
          listUsersLoaded: listUsersLoaded, currentProfileUser: null);

      emit(newState);
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }

  Future<void> _onOtherUsersEvenSaveTagsToSend(
      Emitter<OtherUserState> emit, OtherUsersEventSaveTagsToSend event) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final oldState = (state as OtherUserStateLoaded);
      emit(OtherUserState.loading(
          listUsersLoaded: oldState.listUsersLoaded,
          currentProfileUser: oldState.currentProfileUser));
      bool isSendTags = await userRepo
          .saveTagsToSend(
              userToken: accessToken as String,
              tags: event.tags,
              userId: event.userId)
          .timeout(const Duration(seconds: 10));
      if (isSendTags) {
        User currentUserProfile = await userRepo
            .getUserInfoById(
                userToken: accessToken, userID: event.userId.toString())
            .timeout(const Duration(seconds: 10));
        final copyListUsersLoaded =
            (state as OtherUserStateLoading).copyWith().listUsersLoaded;
        final newState = OtherUserStateLoaded(
            currentProfileUser: currentUserProfile,
            listUsersLoaded: copyListUsersLoaded!);
        emit(newState);
      }
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } on ApiClientExceptionType {
      emit(const OtherUserState.error(
          errorText:
              'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }

  Future<void> _onOtherUsersEventAddTag(
      Emitter<OtherUserState> emit, OtherUsersEventAddTag event) async {
    final copyProfile =
        (state as OtherUserStateLoaded).currentProfileUser?.copyWith();
    if (copyProfile != null) {
      final newListTags = [...copyProfile.tags];
      newListTags.add(event.tag);
      final newProfile = (state as OtherUserStateLoaded)
          .currentProfileUser
          ?.copyWith(tags: newListTags);

      final newState = (state as OtherUserStateLoaded)
          .copyWith(currentProfileUser: newProfile);
      emit(newState);
    } else {
      emit(const OtherUserState.error(errorText: 'Ошибка добавления тэга'));
    }
  }

  Future<void> _onOtherUsersEventDeleteTag(
      Emitter<OtherUserState> emit, OtherUsersEventDeleteTag event) async {
    final copyProfile =
        (state as OtherUserStateLoaded).currentProfileUser?.copyWith();
    if (copyProfile != null) {
      final newListTags = [...copyProfile.tags];
      newListTags.remove(event.tag);
      final newProfile = (state as OtherUserStateLoaded)
          .currentProfileUser
          ?.copyWith(tags: newListTags);

      final newState = (state as OtherUserStateLoaded)
          .copyWith(currentProfileUser: newProfile);
      emit(newState);
    } else {
      emit(const OtherUserState.error(errorText: 'Ошибка удаления тэга'));
    }
  }

  _onOtherUsersEventSendAvatarWithProfile(Emitter<OtherUserState> emit,
      OtherUsersEventSendAvatarWithProfile event) async {
    String? accessToken = await authRepository.cheskIsLiveAccessToken();
    try {
      final oldState = (state as OtherUserStateLoaded);
      emit(OtherUserState.loading(
          listUsersLoaded: oldState.listUsersLoaded,
          currentProfileUser: oldState.currentProfileUser));
      bool isSendAvatar = await userRepo
          .sendAvatarWithProfile(
              userToken: accessToken as String, imageFile: event.imageFile)
          .timeout(const Duration(seconds: 10));
      if (isSendAvatar) {
        User currentUserProfile = await userRepo
            .getUserInfoById(
                userToken: accessToken, userID: event.userId.toString())
            .timeout(const Duration(seconds: 10));
        final copyListUsersLoaded =
            (state as OtherUserStateLoading).copyWith().listUsersLoaded;
        final newState = OtherUserStateLoaded(
            currentProfileUser: currentUserProfile,
            listUsersLoaded: copyListUsersLoaded!);
        emit(newState);
      }
    } on TimeoutException {
      emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
    } on ApiClientExceptionType {
      emit(const OtherUserState.error(
          errorText:
              'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
    } catch (e) {
      emit(const OtherUserState.error());
    }
  }
}
