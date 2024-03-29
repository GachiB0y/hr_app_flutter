import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';

/// The client that refreshes the OAuth token using the refresh token.
///
/// This client is used by the [OAuthInterceptor] to refresh the OAuth token.
abstract interface class RefreshClient {
  /// Refresh the OAuth token.
  ///
  /// This method is called by the [OAuthInterceptor]
  /// when the request fails with a 401.
  Future<TokenPair> refreshToken(String refreshToken);
}
