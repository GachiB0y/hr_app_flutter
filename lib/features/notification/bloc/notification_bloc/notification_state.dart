part of 'notification_bloc.dart';

/// {@template notification_state_placeholder}
/// Entity placeholder for NotificationState
/// {@endtemplate}
typedef NotificationEntityType = List<NotificationEntity>;

/// {@template notification_state}
/// NotificationState.
/// {@endtemplate}
sealed class NotificationState extends _$NotificationStateBase {

  /// {@macro notification_state}
  const NotificationState({required super.data, required super.message});
  /// Idling state
  /// {@macro notification_state}
  const factory NotificationState.idle({
    required NotificationEntityType? data,
    String message,
  }) = NotificationState$Idle;

  /// Processing
  /// {@macro notification_state}
  const factory NotificationState.processing({
    required NotificationEntityType? data,
    String message,
  }) = NotificationState$Processing;

  /// Successful
  /// {@macro notification_state}
  const factory NotificationState.successful({
    required NotificationEntityType? data,
    String message,
  }) = NotificationState$Successful;

  /// An error has occurred
  /// {@macro notification_state}
  const factory NotificationState.error({
    required NotificationEntityType? data,
    String message,
  }) = NotificationState$Error;
}

/// Idling state
/// {@nodoc}
final class NotificationState$Idle extends NotificationState with _$NotificationState {
  /// {@nodoc}
  const NotificationState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class NotificationState$Processing extends NotificationState with _$NotificationState {
  /// {@nodoc}
  const NotificationState$Processing({required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class NotificationState$Successful extends NotificationState with _$NotificationState {
  /// {@nodoc}
  const NotificationState$Successful({required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class NotificationState$Error extends NotificationState with _$NotificationState {
  /// {@nodoc}
  const NotificationState$Error({required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$NotificationState on NotificationState {}

/// Pattern matching for [NotificationState].
typedef NotificationStateMatch<R, S extends NotificationState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$NotificationStateBase {
  /// {@nodoc}
  const _$NotificationStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final NotificationEntityType? data;

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

  /// Pattern matching for [NotificationState].
  R map<R>({
    required NotificationStateMatch<R, NotificationState$Idle> idle,
    required NotificationStateMatch<R, NotificationState$Processing> processing,
    required NotificationStateMatch<R, NotificationState$Successful> successful,
    required NotificationStateMatch<R, NotificationState$Error> error,
  }) =>
      switch (this) {
        final NotificationState$Idle s => idle(s),
        final NotificationState$Processing s => processing(s),
        final NotificationState$Successful s => successful(s),
        final NotificationState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [NotificationState].
  R maybeMap<R>({
    required R Function() orElse, NotificationStateMatch<R, NotificationState$Idle>? idle,
    NotificationStateMatch<R, NotificationState$Processing>? processing,
    NotificationStateMatch<R, NotificationState$Successful>? successful,
    NotificationStateMatch<R, NotificationState$Error>? error,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [NotificationState].
  R? mapOrNull<R>({
    NotificationStateMatch<R, NotificationState$Idle>? idle,
    NotificationStateMatch<R, NotificationState$Processing>? processing,
    NotificationStateMatch<R, NotificationState$Successful>? successful,
    NotificationStateMatch<R, NotificationState$Error>? error,
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
