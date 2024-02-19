import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/utils/preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Auth data source
abstract interface class AuthDataSource {
  /// Get SMS code by phone number.
  Future<void> getCodeByPhoneNumber({required String numberPhone});

  /// Sign In with phone and code.
  Future<void> signInWithPhoneAndCode(
      {required String numberPhone, required String code, String? deviceToken});

  /// Sign out the current user.
  Future<void> signOut();
}

/// AuthDataSourceImpl provides authentication data services.
final class AuthDataSourceImpl
    with PreferencesDao
    implements AuthDataSource, TokenStorage {
  /// [Dio] instance for making network requests.
  final Dio client;

  /// SharedPreferences instance for local storage access.
  @override
  final SharedPreferences sharedPreferences;

  /// Creates an instance of AuthDataSourceImpl.
  AuthDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  late final _accessToken = stringEntry('access_token');
  late final _refreshToken = stringEntry('refresh_token');
  final _controller = StreamController<TokenPair?>.broadcast();

  @override
  Future<void> getCodeByPhoneNumber({
    required String numberPhone,
  }) async {
    final response = await client.post<Map<String, Object?>>(
      '/auth/',
      data: jsonEncode({
        'phone': numberPhone,
      }),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Ошибка получения кода');
    }
  }

  @override
  Future<void> signInWithPhoneAndCode(
      {required String numberPhone,
      required String code,
      String? deviceToken}) async {
    final response = await client.post<Map<String, Object?>>(
      '/auth/verify_sms',
      queryParameters: {
        'phone': numberPhone,
        'code': code,
        'device_token': deviceToken
      },
    );
    if (response.statusCode == 401) {
      throw const UnauthorizedException(
        message: 'Incorrect SMS code.',
      );
    }
    await _handleAuthResponse(response.data);
  }

  @override
  Future<void> signOut() => clearTokenPair();

  @override
  Future<void> clearTokenPair() async {
    await _accessToken.remove();
    await _refreshToken.remove();
    _controller.add(null);
  }

  @override
  Future<TokenPair?> loadTokenPair() async {
    final accessToken = _accessToken.read();
    final refreshToken = _refreshToken.read();
    if (accessToken == null || refreshToken == null) return null;
    return (accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) async {
    await _accessToken.set(tokenPair.accessToken);
    await _refreshToken.set(tokenPair.refreshToken);
    _controller.add(tokenPair);
  }

  @override
  Stream<TokenPair?> getTokenPairStream() => _controller.stream;

  /// Handles the authentication response.
  Future<void> _handleAuthResponse(Map<String, Object?>? response) async {
    if (response
        case {
          'access_token': final String accessToken,
          'refresh_token': final String refreshToken,
        }) {
      await saveTokenPair(
        (accessToken: accessToken, refreshToken: refreshToken),
      );
      return;
    }

    throw FormatException('Invalid response format. $response');
  }
}
