// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/user/user.dart';
import '../../model/user_view_model/user_view_model.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

/// Business Logic Component UserBLoC
class UserBloc extends Bloc<UserEvent, UserState>
    implements EventSink<UserEvent> {
  UserBloc({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final UserState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
        super(
          initialState ??
              const UserState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<UserEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
        gethUserByUserId: (event) =>
            _onOtherUsersEventGetUserByUserId(event, emit),
        saveTagsToSend: (event) async =>
            await _onOtherUsersEvenSaveTagsToSend(emit, event),
        addTag: (event) => _onOtherUsersEventAddTag(emit, event),
        deleteTag: (event) => _onOtherUsersEventDeleteTag(emit, event),
        sendAvatarWithProfile: (event) async =>
            await _onOtherUsersEventSendAvatarWithProfile(emit, event),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(UserEventFetch event, Emitter<UserState> emit) async {
    try {
      emit(UserState.processing(data: state.data));

      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      User userLoaded = await _userRepo
          .getUserInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 10));

      final UserProfileViewModel newData =
          UserProfileViewModel(authUser: userLoaded, currentProfileUser: null);
      emit(UserState.successful(data: newData));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the UserBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }

  /// Get user by user id
  Future<void> _onOtherUsersEventGetUserByUserId(
    UserEventGethUserByUserId event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      User currentProfileUser = await _userRepo
          .getUserInfoById(
              userToken: accessToken as String, userID: event.userId)
          .timeout(const Duration(seconds: 10));

      emit(UserState.successful(
          data: state.data?.copyWith(currentProfileUser: currentProfileUser)));
    } on TimeoutException {
      emit(UserState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }

  /// Save tags to send
  Future<void> _onOtherUsersEvenSaveTagsToSend(
      Emitter<UserState> emit, UserEventSaveTagsToSend event) async {
    try {
      emit(UserState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      bool isSendTags = await _userRepo
          .saveTagsToSend(
              userToken: accessToken as String,
              tags: event.tags,
              userId: event.userId)
          .timeout(const Duration(seconds: 10));

      if (isSendTags) {
        User currentProfileUser = await _userRepo
            .getUserInfoById(
                userToken: accessToken, userID: event.userId.toString())
            .timeout(const Duration(seconds: 10));
        emit(UserState.successful(
            data:
                state.data?.copyWith(currentProfileUser: currentProfileUser)));
      } else {
        emit(UserState.error(
            data: state.data,
            message:
                'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
      }
    } on TimeoutException {
      emit(UserState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on ApiClientExceptionType {
      emit(UserState.error(
          data: state.data,
          message:
              'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }

  /// Add tag
  Future<void> _onOtherUsersEventAddTag(
      Emitter<UserState> emit, UserEventAddTag event) async {
    final User? copyProfile = state.data?.currentProfileUser?.copyWith();
    if (copyProfile != null) {
      final newListTags = [...copyProfile.tags];
      newListTags.add(event.tag);
      final newProfile =
          state.data?.currentProfileUser?.copyWith(tags: newListTags);
      emit(UserState.idle(
          data: state.data?.copyWith(currentProfileUser: newProfile)));
    } else {
      emit(UserState.error(
          data: state.data, message: 'Ошибка добавления тэга.'));
    }
  }

  /// Delete tag
  Future<void> _onOtherUsersEventDeleteTag(
      Emitter<UserState> emit, UserEventDeleteTag event) async {
    final copyProfile = state.data?.currentProfileUser?.copyWith();
    if (copyProfile != null) {
      final newListTags = [...copyProfile.tags];
      newListTags.remove(event.tag);
      final newProfile =
          state.data?.currentProfileUser?.copyWith(tags: newListTags);
      emit(UserState.idle(
          data: state.data?.copyWith(currentProfileUser: newProfile)));
    } else {
      emit(UserState.error(data: state.data, message: 'Ошибка удаления тэга.'));
    }
  }

  /// Send avatar
  _onOtherUsersEventSendAvatarWithProfile(
      Emitter<UserState> emit, UserEventSendAvatarWithProfile event) async {
    try {
      emit(UserState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      bool isSendAvatar = await _userRepo
          .sendAvatarWithProfile(
              userToken: accessToken as String, imageFile: event.imageFile)
          .timeout(const Duration(seconds: 10));
      if (isSendAvatar) {
        User currentProfileUser = await _userRepo
            .getUserInfoById(
                userToken: accessToken, userID: event.userId.toString())
            .timeout(const Duration(seconds: 10));
        emit(UserState.successful(
            data:
                state.data?.copyWith(currentProfileUser: currentProfileUser)));
      } else {
        emit(UserState.error(
            data: state.data,
            message:
                'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
      }
    } on TimeoutException {
      emit(UserState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on ApiClientExceptionType {
      emit(UserState.error(
          data: state.data,
          message:
              'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }
}
