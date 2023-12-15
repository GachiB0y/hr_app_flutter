// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/user/user.dart';

part 'other_users_bloc.freezed.dart';
part 'other_users_event.dart';
part 'other_users_state.dart';

/// Business Logic Component OtherUsersBLoC
class OtherUsersBloc extends Bloc<OtherUsersEvent, OtherUsersState>
    implements EventSink<OtherUsersEvent> {
  OtherUsersBloc({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final OtherUsersState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
        super(
          initialState ??
              const OtherUsersState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<OtherUsersEvent>(
      (event, emit) => event.map<Future<void>>(
        gethUsersByPhoneNumber: (event) async =>
            await _onOtherUsersEventGetUsersByPhoneNumber(emit, event),
        clearList: (event) => _onOtherUsersEventClearList(emit),
        findUsers: (event) async =>
            await _onOtherUsersEventFindUsers(emit, event),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;
  final IAuthRepository _authRepository;

  /// Get users by phone number
  Future<void> _onOtherUsersEventGetUsersByPhoneNumber(
    Emitter<OtherUsersState> emit,
    OtherUsersEventGethUsersByPhoneNumber event,
  ) async {
    try {
      emit(OtherUsersState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await _userRepo
          .getUserByPhoneNumber(
              accessToken: accessToken as String,
              phoneNumber: event.phoneNumber)
          .timeout(const Duration(seconds: 10));

      emit(OtherUsersState.successful(data: listUsersLoaded));
    } on TimeoutException {
      emit(OtherUsersState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(const OtherUsersState.error(data: null));
      rethrow;
    } finally {
      emit(OtherUsersState.idle(data: state.data));
    }
  }

  /// Clear list users
  Future<void> _onOtherUsersEventClearList(
      Emitter<OtherUsersState> emit) async {
    emit(const OtherUsersState.idle(data: []));
  }

  /// Find users
  Future<void> _onOtherUsersEventFindUsers(
      Emitter<OtherUsersState> emit, OtherUsersEventFindUsers event) async {
    try {
      emit(OtherUsersState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await _userRepo
          .findUser(
              accessToken: accessToken as String, findText: event.findText)
          .timeout(const Duration(seconds: 10));

      emit(OtherUsersState.successful(data: listUsersLoaded));
    } on TimeoutException {
      emit(const OtherUsersState.error(
          data: null, message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(const OtherUsersState.error(data: null));
      rethrow;
    } finally {
      emit(OtherUsersState.idle(data: state.data));
    }
  }
}
