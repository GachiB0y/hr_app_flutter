import 'dart:async';

import 'package:hr_app_flutter/core/components/rest_clients/firebase_api/firebase_api.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/features/auth/data/rest_clients/auth_datasource.dart';

abstract interface class IAuthRepository {
  Future<void> getCode({required String numberPhone});

  Future<void> signInWithPhoneAndCode(
      {required String numberPhone, required String code});
  Future<void> logout();

  /// The stream of [AuthenticationStatus] of the current user.
  Stream<AuthenticationStatus> getAuthStateChanges();
}

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required AuthStatusDataSource authStatusDataSource,
    required AuthDataSource authDataSource,
    required IFirebaseApi firebaseApi,
  })  : _authStatusDataSource = authStatusDataSource,
        _authDataSource = authDataSource,
        _firebaseApi = firebaseApi;

  final AuthStatusDataSource _authStatusDataSource;

  final AuthDataSource _authDataSource;

  final IFirebaseApi _firebaseApi;

  @override
  Future<void> getCode({required String numberPhone}) async {
    try {
      await _authDataSource.getCodeByPhoneNumber(numberPhone: numberPhone);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithPhoneAndCode(
      {required String numberPhone, required String code}) async {
    final String? deviceToken = await _firebaseApi.getFCMToken();

    return _authDataSource.signInWithPhoneAndCode(
        numberPhone: numberPhone, code: code, deviceToken: deviceToken);
  }

  @override
  Future<void> logout() => _authDataSource.signOut();

  @override
  Stream<AuthenticationStatus> getAuthStateChanges() =>
      _authStatusDataSource.getAuthenticationStatusStream();
}
