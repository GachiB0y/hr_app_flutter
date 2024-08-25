part of 'count_notification_bloc.dart';

/// {@template count_notification_state_placeholder}
/// Entity placeholder for CountNotificationState
/// {@endtemplate}
typedef CountNotificationEntity = int;

/// {@template count_notification_state}
/// CountNotificationState.
/// {@endtemplate}
sealed class CountNotificationState extends _$CountNotificationStateBase {
  /// Idling state
  /// {@macro count_notification_state}
  const factory CountNotificationState.idle({
    required CountNotificationEntity? data,
    String message,
  }) = CountNotificationState$Idle;

  /// Processing
  /// {@macro count_notification_state}
  const factory CountNotificationState.processing({
    required CountNotificationEntity? data,
    String message,
  }) = CountNotificationState$Processing;

  /// Successful
  /// {@macro count_notification_state}
  const factory CountNotificationState.successful({
    required CountNotificationEntity? data,
    String message,
  }) = CountNotificationState$Successful;

  /// An error has occurred
  /// {@macro count_notification_state}
  const factory CountNotificationState.error({
    required CountNotificationEntity? data,
    String message,
  }) = CountNotificationState$Error;

  /// {@macro count_notification_state}
  const CountNotificationState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class CountNotificationState$Idle extends CountNotificationState with _$CountNotificationState {
  /// {@nodoc}
  const CountNotificationState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class CountNotificationState$Processing extends CountNotificationState with _$CountNotificationState {
  /// {@nodoc}
  const CountNotificationState$Processing({required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class CountNotificationState$Successful extends CountNotificationState with _$CountNotificationState {
  /// {@nodoc}
  const CountNotificationState$Successful({required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class CountNotificationState$Error extends CountNotificationState with _$CountNotificationState {
  /// {@nodoc}
  const CountNotificationState$Error({required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$CountNotificationState on CountNotificationState {}

/// Pattern matching for [CountNotificationState].
typedef CountNotificationStateMatch<R, S extends CountNotificationState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$CountNotificationStateBase {
  /// {@nodoc}
  const _$CountNotificationStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final CountNotificationEntity? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [CountNotificationState].
  R map<R>({
    required CountNotificationStateMatch<R, CountNotificationState$Idle> idle,
    required CountNotificationStateMatch<R, CountNotificationState$Processing> processing,
    required CountNotificationStateMatch<R, CountNotificationState$Successful> successful,
    required CountNotificationStateMatch<R, CountNotificationState$Error> error,
  }) =>
      switch (this) {
        CountNotificationState$Idle s => idle(s),
        CountNotificationState$Processing s => processing(s),
        CountNotificationState$Successful s => successful(s),
        CountNotificationState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CountNotificationState].
  R maybeMap<R>({
    CountNotificationStateMatch<R, CountNotificationState$Idle>? idle,
    CountNotificationStateMatch<R, CountNotificationState$Processing>? processing,
    CountNotificationStateMatch<R, CountNotificationState$Successful>? successful,
    CountNotificationStateMatch<R, CountNotificationState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [CountNotificationState].
  R? mapOrNull<R>({
    CountNotificationStateMatch<R, CountNotificationState$Idle>? idle,
    CountNotificationStateMatch<R, CountNotificationState$Processing>? processing,
    CountNotificationStateMatch<R, CountNotificationState$Successful>? successful,
    CountNotificationStateMatch<R, CountNotificationState$Error>? error,
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
