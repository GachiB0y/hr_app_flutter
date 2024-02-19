import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/src/oauth/oauth_interceptor.dart';
import 'package:hr_app_flutter/core/utils/mixin/set_state_mixin.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class LoggedListenable extends ChangeNotifier implements Listenable {
  final Stream<AuthState> _stateChanges;
  StreamSubscription<AuthState>? _subscription;

  LoggedListenable(this._stateChanges) {
    _subscription = _stateChanges.listen((final event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Business Logic Component AuthBLoC
class AuthBLoC extends Bloc<AuthEvent, AuthState>
    with SetStateMixin
    implements EventSink<AuthEvent> {
  AuthBLoC({
    required final IAuthRepository authRepository,
    final AuthState? initialState,
  })  : _authRepository = authRepository,
        super(
          initialState ??
              const AuthState.idle(
                data: AuthenticationStatus.initial,
                message: 'Initial idle state',
              ),
        ) {
    _authStateSubscription = _authRepository
        .getAuthStateChanges()
        .map((status) => AuthState.idle(data: status))
        .where((newState) => newState != state)
        .listen(setState);

    on<AuthEvent>(
      (event, emit) => event.map<Future<void>>(
        getCode: (event) => _getCode(event, emit),
        authByCode: (event) => _authByCode(event, emit),
        logout: (event) => _logout(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IAuthRepository _authRepository;
  StreamSubscription<AuthState>? _authStateSubscription;

  @override
  Future<void> close() async {
    await _authStateSubscription?.cancel();
    await super.close();
  }

  /// Get Code by phone number
  Future<void> _getCode(GetCodeAuthEvent event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.getCode(numberPhone: event.phoneNumber);
    } catch (e) {
      emit(AuthState.error(
          data: state.data, message: 'Неудалось получить код!'));
    }
  }

  /// Auth user by SMS code
  Future<void> _authByCode(
      AuthByCodeAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthState.processing(data: state.data));

      await _authRepository.signInWithPhoneAndCode(
          numberPhone: event.phoneNumber, code: event.code);
      emit(
          const AuthState.successful(data: AuthenticationStatus.authenticated));
    } on TimeoutException {
      emit(const AuthState.error(
          data: AuthenticationStatus.unauthenticated,
          message: 'Ошибка ожидания ответа от сервера!'));
      rethrow;
      // ignore: unused_catch_stack
    } on Object catch (error, stackTrace) {
      emit(const AuthState.error(
          data: AuthenticationStatus.unauthenticated,
          message: 'Not found error'));
      rethrow;
    } finally {
      emit(AuthState.idle(data: state.data));
    }

    final errorMessage =
        await _login(phoneNumber: event.phoneNumber, code: event.code);
    if (errorMessage == null) {
      emit(const AuthState.idle(data: AuthenticationStatus.authenticated));
    } else {
      emit(AuthState.error(data: state.data, message: errorMessage));
    }
  }

  /// Login user by SMS code and phone number
  Future<String?> _login(
      {required String phoneNumber, required String code}) async {
    try {
      await _authRepository.signInWithPhoneAndCode(
          numberPhone: phoneNumber, code: code);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  /// Logout user
  Future<void> _logout(LogoutAuthEvent event, Emitter<AuthState> emit) async {
    try {
      // emit(const AuthState.processing(
      //     data: AuthenticationStatus.unauthenticated));

      await _authRepository.logout();
      emit(const AuthState.idle(data: AuthenticationStatus.unauthenticated));
    } catch (e) {
      emit(AuthState.idle(
        data: state.data,
      ));
    }
  }
}
