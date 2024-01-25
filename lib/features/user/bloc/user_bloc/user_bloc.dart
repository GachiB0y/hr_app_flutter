// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/user/user_info.dart';
import '../../model/user_view_model/user_view_model.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

/// Business Logic Component UserBLoC
class UserBloc extends Bloc<UserEvent, UserState>
    implements EventSink<UserEvent> {
  UserBloc({
    required final IUserRepository userRepo,
    // required final IAuthRepository authRepository,
    final UserState? initialState,
  })  : _userRepo = userRepo,
        // _authRepository = authRepository,
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
        gethUserByUserId: (event) => _onUserEventGetUserByUserId(event, emit),
        saveTagsToSend: (event) async =>
            await _onUserEvenSaveTagsToSend(emit, event),
        addTag: (event) => _onUserEventAddTag(emit, event),
        deleteTag: (event) => _onUserEventDeleteTag(emit, event),
        sendAvatarWithProfile: (event) async =>
            await _onUserEventSendAvatarWithProfile(emit, event),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;

  /// Fetch event handler
  Future<void> _fetch(UserEventFetch event, Emitter<UserState> emit) async {
    try {
      emit(UserState.processing(data: state.data));

      UserInfo userLoaded =
          await _userRepo.getUserInfo().timeout(const Duration(seconds: 10));

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
  Future<void> _onUserEventGetUserByUserId(
    UserEventGethUserByUserId event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.processing(data: state.data));

      UserInfo currentProfileUser = await _userRepo
          .getUserInfoById(userId: event.userId)
          .timeout(const Duration(seconds: 10));

      emit(UserState.successful(
          data: state.data?.copyWith(currentProfileUser: currentProfileUser)));
    } on TimeoutException {
      emit(UserState.error(
          data: state.data?.copyWith(currentProfileUser: null),
          message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the UsersBLoC: $err', stackTrace);
      emit(UserState.error(
          data: state.data?.copyWith(currentProfileUser: null)));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }

  /// Save tags to send
  Future<void> _onUserEvenSaveTagsToSend(
      Emitter<UserState> emit, UserEventSaveTagsToSend event) async {
    try {
      emit(UserState.processing(data: state.data));

      bool isSendTags = await _userRepo
          .saveTagsToSend(tags: event.tags, userId: event.userId)
          .timeout(const Duration(seconds: 10));

      if (isSendTags) {
        UserInfo currentProfileUser = await _userRepo
            .getUserInfoById(userId: event.userId.toString())
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
      //l.e('An error occurred in the UserBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }

  /// Add tag
  Future<void> _onUserEventAddTag(
      Emitter<UserState> emit, UserEventAddTag event) async {
    final UserInfo? copyProfile = state.data?.currentProfileUser?.copyWith();
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
  Future<void> _onUserEventDeleteTag(
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
  _onUserEventSendAvatarWithProfile(
      Emitter<UserState> emit, UserEventSendAvatarWithProfile event) async {
    try {
      emit(UserState.processing(data: state.data));

      bool isSendAvatar = await _userRepo
          .sendAvatarWithProfile(imageFile: event.imageFile)
          .timeout(const Duration(seconds: 10));
      if (isSendAvatar) {
        UserInfo currentProfileUser = await _userRepo
            .getUserInfoById(userId: event.userId.toString())
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
      //l.e('An error occurred in the UserBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }
}
