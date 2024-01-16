import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:octopus/octopus.dart';

/// A router guard that checks if the user is authenticated.
class AuthenticationGuard extends OctopusGuard {
  AuthenticationGuard({
    required FutureOr<AuthenticationStatus> Function() getAuthStatus,
    required Set<String> routes,
    required OctopusState signinNavigation,
    required OctopusState homeNavigation,
    OctopusState? lastNavigation,
    super.refresh,
  })  : _getAuthStatus = getAuthStatus,
        _routes = routes,
        _lastNavigation = lastNavigation ?? homeNavigation,
        _signinNavigation = signinNavigation {
    // Get the last navigation from the platform default route.
    if (lastNavigation == null) {
      try {
        final platformDefault =
            WidgetsBinding.instance.platformDispatcher.defaultRouteName;
        final state = OctopusState.fromLocation(platformDefault);
        if (state.isNotEmpty) {
          _lastNavigation = state;
        }
      } on Object {/* ignore */}
    }
  }

  /// Get the current user.
  final FutureOr<AuthenticationStatus> Function() _getAuthStatus;

  /// Routes names that stand for the authentication routes.
  final Set<String> _routes;

  /// The navigation to use when the user is not authenticated.
  final OctopusState _signinNavigation;

  /// The navigation to use when the user is authenticated.
  OctopusState _lastNavigation;

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) async {
    final AuthenticationStatus statusAuth =
        await _getAuthStatus(); // Get the current user.
    // context['user'] = user; // Save the user in the context.
    final isAuthNav =
        state.children.any((child) => _routes.contains(child.name));
    if (isAuthNav) {
      // New state is an authentication navigation.
      if (statusAuth == AuthenticationStatus.authenticated) {
        // User authenticated.
        // Remove any navigation that is an authentication navigation.
        state.removeWhere((child) => _routes.contains(child.name));
        // Restore the last navigation when the user is authenticated
        // if the state contains only the authentication routes.
        return state.isEmpty ? _lastNavigation : state;
      } else {
        // User not authenticated.
        // Remove any navigation that is not an authentication navigation.
        state.removeWhere((child) => !_routes.contains(child.name));
        // Add the signin navigation if the state is empty.
        // Or return the state if it contains the signin navigation.
        return state.isEmpty ? _signinNavigation : state;
      }
    } else {
      // New state is not an authentication navigation.
      if (statusAuth == AuthenticationStatus.authenticated) {
        // User authenticated.
        // Save the current navigation as the last navigation.
        _lastNavigation = state;
        return super.call(history, state, context);
      } else {
        // User not authenticated.
        // Replace the current navigation with the signin navigation.
        return _signinNavigation;
      }
    }
  }
}
