import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

abstract class AuthViewCubitState {}

class AuthViewCubitFormFillInProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitFormFillInProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitErrorState extends AuthViewCubitState {
  final String? errorMessage;

  AuthViewCubitErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitErrorState &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}

class AuthViewCubitAuthProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitAuthProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitSuccesAuthState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitSuccesAuthState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthRepository authRepository;
  AuthViewCubit({required this.authRepository})
      : super(AuthViewCubitFormFillInProgressState()) {}

  bool _isValid({required String phoneNumber}) => phoneNumber.length == 11;

  Future<void> auth({required String phoneNumber, required String code}) async {
    emit(AuthViewCubitAuthProgressState());
    if (!_isValid(phoneNumber: phoneNumber)) {
      final newState = AuthViewCubitErrorState('Заполните логин или пароль');
      emit(newState);
      return;
    }

    final errorMessage = await _login(phoneNumber: phoneNumber, code: code);
    if (errorMessage == null) {
      emit(AuthViewCubitSuccesAuthState());
    } else {
      emit(AuthViewCubitErrorState(errorMessage));
    }
  }

  Future<String?> _login(
      {required String phoneNumber, required String code}) async {
    try {
      await authRepository.login(numberPhone: phoneNumber, code: code);
    } catch (e) {
      return 'Неудалось авторизироваться!';
    }
    return null;
  }

  Future<String?> getCode({required String phoneNumber}) async {
    final String code = await authRepository.getCode(numberPhone: phoneNumber);
    if (code.isEmpty) {
      emit(AuthViewCubitErrorState('Неудалось получить код!'));
      return null;
    }
    return code;
  }
}
