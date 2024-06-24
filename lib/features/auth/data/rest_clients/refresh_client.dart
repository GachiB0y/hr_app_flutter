import 'package:dio/dio.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/components/rest_clients/src/oauth/refresh_client.dart';

/// Refresh client implementation
final class RefreshClientImpl implements RefreshClient {
  /// [Dio] instance for making network requests.
  final Dio client;

  /// Creates an instance of RefreshClientImpl.
  RefreshClientImpl({required this.client});

  @override
  Future<TokenPair> refreshToken(String refreshToken) async {
    try {
      final response = await client.post<Map<String, Object?>>(
        '/auth/switch_token',
        queryParameters: {'token': refreshToken},
      );
      if (response.data
          case {
            'access_token': final String accessToken,
            'refresh_token': final String refreshToken
          }) {
        return (
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      }
      throw const RevokeTokenException();
    } catch (e) {
      throw const RevokeTokenException();
    }
  }
}
