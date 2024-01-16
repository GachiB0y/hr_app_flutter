import 'dart:async';

import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/features/auth/data/rest_clients/auth_api_client.dart';
import 'package:hr_app_flutter/core/components/database/data_provider/session_data_provider.dart';
import 'package:hr_app_flutter/features/auth/data/rest_clients/auth_datasource.dart';

abstract interface class IAuthRepository {
  Future<bool> isAuth();

  Future<bool> isExistToken({required bool isRefrshToken});
  Future<String?> cheskIsLiveAccessToken();

  Future<void> getCode({required String numberPhone});
  Future<String?> _makeJwtTokens({required String refreshToken});
  Future<String?> getRefeshTokenInStorage();
  Future<String?> getAccessTokenInStorage();

  Future<void> signInWithPhoneAndCode(
      {required String numberPhone, required String code});
  Future<void> logout();
  bool isLiveToken({required String jwtToken});

  /// The stream of [AuthenticationStatus] of the current user.
  Stream<AuthenticationStatus> getAuthStateChanges();
}

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required AuthStatusDataSource authStatusDataSource,
    required IAuthProvider authProvider,
    required SessionDataProvdier sessionDataProvdier,
    required AuthDataSource authDataSource,
  })  : _authProvider = authProvider,
        _sessionDataProvdier = sessionDataProvdier,
        _authStatusDataSource = authStatusDataSource,
        _authDataSource = authDataSource;

  final AuthStatusDataSource _authStatusDataSource;
  final IAuthProvider _authProvider;
  final SessionDataProvdier _sessionDataProvdier;
  final AuthDataSource _authDataSource;

  @override
  Future<void> getCode({required String numberPhone}) async {
    try {
      await _authDataSource.getCodeByPhoneNumber(numberPhone: numberPhone);
    } catch (e) {
      rethrow;
    }
  }

// Проверка на авторизацию пользователя
  @override
  Future<bool> isAuth() async {
    // Проверяем есть ли REFRESH токен в хранилище
    final bool isExist = await isExistToken(isRefrshToken: true);
    if (isExist) {
      //Проверяем живой REFRESH ли токен
      final sessionId = await _sessionDataProvdier.getSessionId();
      final bool isLive =
          _sessionDataProvdier.isLiveToken(jwtToken: sessionId as String);
      if (isLive) {
        return isLive;
      } else {
        await _sessionDataProvdier.deleteSessionId();
        return isLive;
      }
    } else {
      return false;
    }
  }

// Проверка на наличие AccessToken/refresh_token токена в хранилище
  @override
  Future<bool> isExistToken({required bool isRefrshToken}) async {
    if (isRefrshToken) {
      final sessionId = await _sessionDataProvdier.getSessionId();
      final isExistRefrshToken = sessionId != null;
      return isExistRefrshToken;
    } else {
      final accessToken = await _sessionDataProvdier.getAccessToken();
      final isExistAccessToken = accessToken != null;
      return isExistAccessToken;
    }
  }

  @override
  Future<void> signInWithPhoneAndCode(
      {required String numberPhone, required String code}) async {
    await _authDataSource.signInWithPhoneAndCode(
        numberPhone: numberPhone, code: code);
  }

  @override
  Future<void> logout() => _authDataSource.signOut();

  @override
  Future<String?> _makeJwtTokens({required String refreshToken}) async {
    var record =
        await _authProvider.makeNewJwtTokens(refreshToken: refreshToken);
    if (record.accessToken.isNotEmpty && record.refresToken.isNotEmpty) {
      await _sessionDataProvdier.deleteSessionId();
      await _sessionDataProvdier.deleteAccessToken();
      await _sessionDataProvdier.setSessionId(record.refresToken);

      await _sessionDataProvdier.setAccessToken(record.accessToken);
      final accessToken = record.accessToken;
      return accessToken;
    } else {
      return null;
    }
  }

  @override
  bool isLiveToken({required String jwtToken}) {
    bool isLive = _sessionDataProvdier.isLiveToken(jwtToken: jwtToken);
    return isLive;
  }

  @override
  Future<String?> getRefeshTokenInStorage() async {
    final String? sessionId = await _sessionDataProvdier.getSessionId();
    if (sessionId != null) {
      return sessionId;
    } else {
      return null;
    }
  }

  @override
  Future<String?> getAccessTokenInStorage() async {
    final String? accesssToken = await _sessionDataProvdier.getAccessToken();
    if (accesssToken != null) {
      return accesssToken;
    } else {
      return null;
    }
  }

  @override
  Future<String?> cheskIsLiveAccessToken() async {
    String? accessToken = await getAccessTokenInStorage();
    final bool isLive = isLiveToken(jwtToken: accessToken as String);
    if (!isLive) {
      final String? refreshToken = await getRefeshTokenInStorage();
      final newAccecssToken =
          await _makeJwtTokens(refreshToken: refreshToken as String);
      accessToken = newAccecssToken;
    }
    return accessToken;
  }

  @override
  Stream<AuthenticationStatus> getAuthStateChanges() =>
      _authStatusDataSource.getAuthenticationStatusStream();
}
