import 'package:hr_app_flutter/library/flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class _Keys {
  static const sessionId = 'session-id';
  static const accessToken = 'access-token';
}

abstract class SessionDataProvdier {
  Future<String?> getSessionId();
  Future<void> setSessionId(String value);
  Future<void> deleteSessionId();
  Future<String?> getAccessToken();
  Future<void> setAccessToken(String value);
  Future<void> deleteAccessToken();
  bool isLiveToken({required String jwtToken});
}

class SessionDataProvdierDefault implements SessionDataProvdier {
  final SecureStorage secureStorage;

  const SessionDataProvdierDefault({required this.secureStorage});

  @override
  Future<String?> getSessionId() => secureStorage.read(key: _Keys.sessionId);

  @override
  Future<void> setSessionId(String value) {
    return secureStorage.write(key: _Keys.sessionId, value: value);
  }

  @override
  Future<void> deleteSessionId() {
    return secureStorage.delete(key: _Keys.sessionId);
  }

  @override
  Future<String?> getAccessToken() =>
      secureStorage.read(key: _Keys.accessToken);

  @override
  Future<void> setAccessToken(String value) {
    return secureStorage.write(key: _Keys.accessToken, value: value);
  }

  @override
  Future<void> deleteAccessToken() {
    return secureStorage.delete(key: _Keys.accessToken);
  }

  @override
  bool isLiveToken({required String jwtToken}) {
    bool isExpired = JwtDecoder.isExpired(jwtToken);
    return !isExpired;
  }
}
