part of "auth_bloc.dart";

enum AuthenticationStatus {
  /// The initial state of the authentication status
  initial,

  /// The user is authenticated
  authenticated,

  /// The user is unauthenticated
  unauthenticated;
}

/// {@template auth_state_placeholder}
/// Entity placeholder for AuthState
/// {@endtemplate}
typedef AuthEntity = AuthenticationStatus;

/// {@template auth_state}
/// AuthState.
/// {@endtemplate}
sealed class AuthState extends _$AuthStateBase {
  /// Idling state
  /// {@macro auth_state}
  const factory AuthState.idle({
    required AuthEntity? data,
    String message,
  }) = AuthState$Idle;

  /// Processing
  /// {@macro auth_state}
  const factory AuthState.processing({
    required AuthEntity? data,
    String message,
  }) = AuthState$Processing;

  /// Successful
  /// {@macro auth_state}
  const factory AuthState.successful({
    required AuthEntity? data,
    String message,
  }) = AuthState$Successful;

  /// An error has occurred
  /// {@macro auth_state}
  const factory AuthState.error({
    required AuthEntity? data,
    String message,
  }) = AuthState$Error;

  /// {@macro auth_state}
  const AuthState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class AuthState$Idle extends AuthState with _$AuthState {
  /// {@nodoc}
  const AuthState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class AuthState$Processing extends AuthState with _$AuthState {
  /// {@nodoc}
  const AuthState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class AuthState$Successful extends AuthState with _$AuthState {
  /// {@nodoc}
  const AuthState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class AuthState$Error extends AuthState with _$AuthState {
  /// {@nodoc}
  const AuthState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$AuthState on AuthState {}

/// Pattern matching for [AuthState].
typedef AuthStateMatch<R, S extends AuthState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$AuthStateBase {
  /// {@nodoc}
  const _$AuthStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final AuthEntity? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [AuthState].
  R map<R>({
    required AuthStateMatch<R, AuthState$Idle> idle,
    required AuthStateMatch<R, AuthState$Processing> processing,
    required AuthStateMatch<R, AuthState$Successful> successful,
    required AuthStateMatch<R, AuthState$Error> error,
  }) =>
      switch (this) {
        AuthState$Idle s => idle(s),
        AuthState$Processing s => processing(s),
        AuthState$Successful s => successful(s),
        AuthState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [AuthState].
  R maybeMap<R>({
    AuthStateMatch<R, AuthState$Idle>? idle,
    AuthStateMatch<R, AuthState$Processing>? processing,
    AuthStateMatch<R, AuthState$Successful>? successful,
    AuthStateMatch<R, AuthState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [AuthState].
  R? mapOrNull<R>({
    AuthStateMatch<R, AuthState$Idle>? idle,
    AuthStateMatch<R, AuthState$Processing>? processing,
    AuthStateMatch<R, AuthState$Successful>? successful,
    AuthStateMatch<R, AuthState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
