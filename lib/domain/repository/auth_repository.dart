import 'package:hr_app_flutter/domain/api_client/auth_api_client.dart';
import 'package:hr_app_flutter/domain/data_provider/session_data_provider.dart';

abstract interface class IAuthRepository {
  Future<bool> isAuth();

  Future<bool> isExistToken({required bool isRefrshToken});
  Future<String?> cheskIsLiveAccessToken();

  Future<bool> getCode({required String numberPhone});
  Future<String?> makeJwtTokens({required String refreshToken});
  Future<String?> getRefeshTokenInStorage();
  Future<String?> getAccessTokenInStorage();

  Future<void> login({required String numberPhone, required String code});
  Future<void> logout();
  bool isLiveToken({required String jwtToken});
}

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required IAuthProvider authProvider,
    required SessionDataProvdier sessionDataProvdier,
  })  : _authProvider = authProvider,
        _sessionDataProvdier = sessionDataProvdier;

  final IAuthProvider _authProvider;
  final SessionDataProvdier _sessionDataProvdier;

  @override
  Future<bool> getCode({required String numberPhone}) async {
    try {
      final bool isCode =
          await _authProvider.getCodeByPhoneNumber(numberPhone: numberPhone);
      return isCode;
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
      return isExist;
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
  Future<void> login(
      {required String numberPhone, required String code}) async {
    var record =
        await _authProvider.makeToken(numberPhone: numberPhone, code: code);

    await _sessionDataProvdier.setSessionId(record.refresToken);
    await _sessionDataProvdier.setAccessToken(record.accessToken);
  }

  @override
  Future<void> logout() async {
    await _sessionDataProvdier.deleteSessionId();
    await _sessionDataProvdier.deleteAccessToken();
  }

  @override
  Future<String?> makeJwtTokens({required String refreshToken}) async {
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
          await makeJwtTokens(refreshToken: refreshToken as String);
      accessToken = newAccecssToken;
    }
    return accessToken;
  }
}
