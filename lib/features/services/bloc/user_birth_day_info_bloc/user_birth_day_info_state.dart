part of 'user_birth_day_info_bloc.dart';

// @freezed
// class UserBirthDayInfoState with _$UserBirthDayInfoState {
//   const factory UserBirthDayInfoState.loading() = UserBirthDayInfoStateLoading;
//   const factory UserBirthDayInfoState.loaded(
//           {required BirthDayInfoEntity birthDayInfoLoaded}) =
//       UserBirthDayInfoStateLoaded;
//   const factory UserBirthDayInfoState.error() = UserBirthDayInfoStateError;

//   factory UserBirthDayInfoState.fromJson(Map<String, dynamic> json) =>
//       _$UserBirthDayInfoStateFromJson(json);
// }

/// {@template user_birth_day_info_state_placeholder}
/// Entity placeholder for UserBirthDayInfoState
/// {@endtemplate}
typedef UserBirthDayInfoEntity = BirthDayInfoEntity;

/// {@template user_birth_day_info_state}
/// UserBirthDayInfoState.
/// {@endtemplate}
sealed class UserBirthDayInfoState extends _$UserBirthDayInfoStateBase {
  /// Idling state
  /// {@macro user_birth_day_info_state}
  const factory UserBirthDayInfoState.idle({
    required UserBirthDayInfoEntity? data,
    String message,
  }) = UserBirthDayInfoState$Idle;

  /// Processing
  /// {@macro user_birth_day_info_state}
  const factory UserBirthDayInfoState.processing({
    required UserBirthDayInfoEntity? data,
    String message,
  }) = UserBirthDayInfoState$Processing;

  /// Successful
  /// {@macro user_birth_day_info_state}
  const factory UserBirthDayInfoState.successful({
    required UserBirthDayInfoEntity? data,
    String message,
  }) = UserBirthDayInfoState$Successful;

  /// An error has occurred
  /// {@macro user_birth_day_info_state}
  const factory UserBirthDayInfoState.error({
    required UserBirthDayInfoEntity? data,
    String message,
  }) = UserBirthDayInfoState$Error;

  /// {@macro user_birth_day_info_state}
  const UserBirthDayInfoState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class UserBirthDayInfoState$Idle extends UserBirthDayInfoState
    with _$UserBirthDayInfoState {
  /// {@nodoc}
  const UserBirthDayInfoState$Idle(
      {required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class UserBirthDayInfoState$Processing extends UserBirthDayInfoState
    with _$UserBirthDayInfoState {
  /// {@nodoc}
  const UserBirthDayInfoState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class UserBirthDayInfoState$Successful extends UserBirthDayInfoState
    with _$UserBirthDayInfoState {
  /// {@nodoc}
  const UserBirthDayInfoState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class UserBirthDayInfoState$Error extends UserBirthDayInfoState
    with _$UserBirthDayInfoState {
  /// {@nodoc}
  const UserBirthDayInfoState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$UserBirthDayInfoState on UserBirthDayInfoState {}

/// Pattern matching for [UserBirthDayInfoState].
typedef UserBirthDayInfoStateMatch<R, S extends UserBirthDayInfoState> = R
    Function(S state);

/// {@nodoc}
@immutable
abstract base class _$UserBirthDayInfoStateBase {
  /// {@nodoc}
  const _$UserBirthDayInfoStateBase(
      {required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final UserBirthDayInfoEntity? data;

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

  /// Pattern matching for [UserBirthDayInfoState].
  R map<R>({
    required UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Idle> idle,
    required UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Processing>
        processing,
    required UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Successful>
        successful,
    required UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Error> error,
  }) =>
      switch (this) {
        UserBirthDayInfoState$Idle s => idle(s),
        UserBirthDayInfoState$Processing s => processing(s),
        UserBirthDayInfoState$Successful s => successful(s),
        UserBirthDayInfoState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [UserBirthDayInfoState].
  R maybeMap<R>({
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Idle>? idle,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Processing>? processing,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Successful>? successful,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [UserBirthDayInfoState].
  R? mapOrNull<R>({
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Idle>? idle,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Processing>? processing,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Successful>? successful,
    UserBirthDayInfoStateMatch<R, UserBirthDayInfoState$Error>? error,
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
