import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// Business Logic Component AuthBLoC
class AuthBLoC extends Bloc<AuthEvent, AuthState>
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
    _checkAuthInit();
    on<AuthEvent>(
      (event, emit) => event.map<Future<void>>(
        getCode: (event) => _getCode(event, emit),
        authByCode: (event) => _authByCode(event, emit),
        checkAuth: (event) => _checkAuth(event, emit),
        logout: (event) => _logout(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IAuthRepository _authRepository;

  /// Get Code by phone number
  Future<bool> _getCode(GetCodeAuthEvent event, Emitter<AuthState> emit) async {
    try {
      final bool isCode =
          await _authRepository.getCode(numberPhone: event.phoneNumber);
      return isCode;
    } catch (e) {
      emit(AuthState.error(
          data: state.data, message: 'Неудалось получить код!'));
      return false;
    }
  }

  // Check is Auth user
  Future<void> _checkAuth(
      CheckAuthAuthEvent event, Emitter<AuthState> emit) async {
    final isAuth = await _authRepository.isAuth();
    isAuth
        ? emit(const AuthState.idle(data: AuthenticationStatus.authenticated))
        : emit(
            const AuthState.idle(data: AuthenticationStatus.unauthenticated));
  }

  // Check is Auth user, when BLoC init
  Future<void> _checkAuthInit() async {
    final isAuth = await _authRepository.isAuth();
    isAuth
        ? emit(const AuthState.idle(data: AuthenticationStatus.authenticated))
        : emit(
            const AuthState.idle(data: AuthenticationStatus.unauthenticated));
  }

  /// Check is valid phone number
  bool _isValid({required String phoneNumber}) => phoneNumber.length == 11;

  /// Auth user by SMS code
  Future<bool> _authByCode(
      AuthByCodeAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthState.processing(data: state.data));

    if (!_isValid(phoneNumber: event.phoneNumber)) {
      emit(AuthState.error(
          data: state.data, message: 'Заполните номер телефона!'));
      return false;
    }

    final errorMessage =
        await _login(phoneNumber: event.phoneNumber, code: event.code);
    if (errorMessage == null) {
      emit(const AuthState.idle(data: AuthenticationStatus.authenticated));
      return true;
    } else {
      emit(AuthState.error(data: state.data, message: errorMessage));
      return false;
    }
  }

  /// Login user by SMS code and phone number
  Future<String?> _login(
      {required String phoneNumber, required String code}) async {
    try {
      await _authRepository.login(numberPhone: phoneNumber, code: code);
    } catch (e) {
      return 'Неудалось авторизироваться!';
    }
    return null;
  }

  /// Logout user
  Future<void> _logout(LogoutAuthEvent event, Emitter<AuthState> emit) async {
    try {
      // emit(const AuthState.idle(data: AuthenticationStatus.unauthenticated));

      await _authRepository.logout();
      emit(const AuthState.idle(data: AuthenticationStatus.unauthenticated));
    } catch (e) {
      emit(AuthState.idle(
        data: state.data,
      ));
    }
  }

  // /// Fetch event handler
  // Future<void> _fetch(FetchAuthEvent event, Emitter<AuthState> emit) async {
  //   try {
  //     emit(AuthState.processing(data: state.data));
  //     final newData = await _repository.fetch(event.id);
  //     emit(AuthState.successful(data: newData));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the AuthBLoC: $err', stackTrace);
  //     emit(AuthState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(AuthState.idle(data: state.data));
  //   }
  // }
}
