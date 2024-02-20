import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/utils/extensions/context_extension.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';

/// Auth controller that handles authentication.
abstract interface class AuthController {
  /// Get code by phone number
  void getCode(
    String phoneNumber,
  );

  /// Signs in the user with the given [phone] and [sms].
  void auth({
    required String phoneNumber,
    required String code,
  });

  /// Signs out the current user.
  void signOut();

  /// Current authentication status.
  bool get authenticated;

  AuthBLoC get authBloc;
}

/// {@template auth_scope}
/// AuthScope widget.
/// {@endtemplate}
class AuthScope extends StatefulWidget {
  /// {@macro auth_scope}
  const AuthScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// Obtain the nearest [AuthController] up its widget tree.
  static AuthController of(BuildContext context, {bool listen = true}) =>
      context.inhOf<_AuthInherited>(listen: listen).authController;

  @override
  State<AuthScope> createState() => _AuthScopeState();
}

/// State for widget AuthScope.
class _AuthScopeState extends State<AuthScope> implements AuthController {
  late final AuthBLoC _authBloc;

  late AuthState _authState;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
    _authBloc = DependenciesScope.of(context).authBloc;

    _authState = _authBloc.state;
  }

  @override
  void didUpdateWidget(AuthScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthBLoC, AuthState>(
        bloc: _authBloc,
        builder: (context, state) {
          _authState = state;
          return _AuthInherited(
            authController: this,
            authState: state,
            child: widget.child,
          );
        },
      );

  @override
  bool get authenticated =>
      _authState.data == AuthenticationStatus.authenticated;

  @override
  AuthBLoC get authBloc => _authBloc;

  @override
  void signOut() {
    _authBloc.add(const AuthEvent.logout());
  }

  @override
  void auth({required String phoneNumber, required String code}) {
    _authBloc.add(AuthEvent.authByCode(phoneNumber: phoneNumber, code: code));
  }

  @override
  void getCode(String phoneNumber) {
    _authBloc.add(AuthEvent.getCode(
      phoneNumber: phoneNumber,
    ));
  }
}

/// Inherited widget that passes the [AuthController] down the widget tree.
class _AuthInherited extends InheritedWidget {
  /// Create _AuthInherited widget
  const _AuthInherited({
    required super.child,
    required this.authController,
    required AuthState authState,
  }) : _authState = authState;

  /// Auth controller
  final AuthController authController;

  final AuthState _authState;

  @override
  bool updateShouldNotify(_AuthInherited oldWidget) =>
      _authState != oldWidget._authState;
}
