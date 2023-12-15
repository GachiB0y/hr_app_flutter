part of 'other_users_bloc.dart';

// @freezed
// class OtherUserState with _$OtherUserState {
//   const factory OtherUserState.loading(
//       {List<User>? listUsersLoaded,
//       User? currentProfileUser}) = OtherUserStateLoading;
//   const factory OtherUserState.loaded(
//       {required List<User> listUsersLoaded,
//       required User? currentProfileUser}) = OtherUserStateLoaded;
//   const factory OtherUserState.error({
//     String? errorText,
//   }) = OtherUserStateError;

//   factory OtherUserState.fromJson(Map<String, dynamic> json) =>
//       _$OtherUserStateFromJson(json);
// }

/// {@template other_users_state_placeholder}
/// Entity placeholder for OtherUsersState
/// {@endtemplate}
typedef OtherUsersEntity = List<User>;

/// {@template other_users_state}
/// OtherUsersState.
/// {@endtemplate}
sealed class OtherUsersState extends _$OtherUsersStateBase {
  /// Idling state
  /// {@macro other_users_state}
  const factory OtherUsersState.idle({
    required OtherUsersEntity? data,
    String message,
  }) = OtherUsersState$Idle;

  /// Processing
  /// {@macro other_users_state}
  const factory OtherUsersState.processing({
    required OtherUsersEntity? data,
    String message,
  }) = OtherUsersState$Processing;

  /// Successful
  /// {@macro other_users_state}
  const factory OtherUsersState.successful({
    required OtherUsersEntity? data,
    String message,
  }) = OtherUsersState$Successful;

  /// An error has occurred
  /// {@macro other_users_state}
  const factory OtherUsersState.error({
    required OtherUsersEntity? data,
    String message,
  }) = OtherUsersState$Error;

  /// {@macro other_users_state}
  const OtherUsersState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class OtherUsersState$Idle extends OtherUsersState
    with _$OtherUsersState {
  /// {@nodoc}
  const OtherUsersState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class OtherUsersState$Processing extends OtherUsersState
    with _$OtherUsersState {
  /// {@nodoc}
  const OtherUsersState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class OtherUsersState$Successful extends OtherUsersState
    with _$OtherUsersState {
  /// {@nodoc}
  const OtherUsersState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class OtherUsersState$Error extends OtherUsersState
    with _$OtherUsersState {
  /// {@nodoc}
  const OtherUsersState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$OtherUsersState on OtherUsersState {}

/// Pattern matching for [OtherUsersState].
typedef OtherUsersStateMatch<R, S extends OtherUsersState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$OtherUsersStateBase {
  /// {@nodoc}
  const _$OtherUsersStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final OtherUsersEntity? data;

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

  /// Pattern matching for [OtherUsersState].
  R map<R>({
    required OtherUsersStateMatch<R, OtherUsersState$Idle> idle,
    required OtherUsersStateMatch<R, OtherUsersState$Processing> processing,
    required OtherUsersStateMatch<R, OtherUsersState$Successful> successful,
    required OtherUsersStateMatch<R, OtherUsersState$Error> error,
  }) =>
      switch (this) {
        OtherUsersState$Idle s => idle(s),
        OtherUsersState$Processing s => processing(s),
        OtherUsersState$Successful s => successful(s),
        OtherUsersState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [OtherUsersState].
  R maybeMap<R>({
    OtherUsersStateMatch<R, OtherUsersState$Idle>? idle,
    OtherUsersStateMatch<R, OtherUsersState$Processing>? processing,
    OtherUsersStateMatch<R, OtherUsersState$Successful>? successful,
    OtherUsersStateMatch<R, OtherUsersState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [OtherUsersState].
  R? mapOrNull<R>({
    OtherUsersStateMatch<R, OtherUsersState$Idle>? idle,
    OtherUsersStateMatch<R, OtherUsersState$Processing>? processing,
    OtherUsersStateMatch<R, OtherUsersState$Successful>? successful,
    OtherUsersStateMatch<R, OtherUsersState$Error>? error,
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
