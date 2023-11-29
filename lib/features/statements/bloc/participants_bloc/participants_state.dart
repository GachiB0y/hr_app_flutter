part of "participants_bloc.dart";

/// {@template participants_state_placeholder}
/// Entity placeholder for ParticipantsState
/// {@endtemplate}
typedef ParticipantsEntity = List<ParticipantEntity>?;

/// {@template participants_state}
/// ParticipantsState.
/// {@endtemplate}
sealed class ParticipantsState extends _$ParticipantsStateBase {
  /// Idling state
  /// {@macro participants_state}
  const factory ParticipantsState.idle({
    required ParticipantsEntity? data,
    String message,
  }) = ParticipantsState$Idle;

  /// Processing
  /// {@macro participants_state}
  const factory ParticipantsState.processing({
    required ParticipantsEntity? data,
    String message,
  }) = ParticipantsState$Processing;

  /// Successful
  /// {@macro participants_state}
  const factory ParticipantsState.successful({
    required ParticipantsEntity? data,
    String message,
  }) = ParticipantsState$Successful;

  /// An error has occurred
  /// {@macro participants_state}
  const factory ParticipantsState.error({
    required ParticipantsEntity? data,
    String message,
  }) = ParticipantsState$Error;

  /// {@macro participants_state}
  const ParticipantsState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class ParticipantsState$Idle extends ParticipantsState
    with _$ParticipantsState {
  /// {@nodoc}
  const ParticipantsState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class ParticipantsState$Processing extends ParticipantsState
    with _$ParticipantsState {
  /// {@nodoc}
  const ParticipantsState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class ParticipantsState$Successful extends ParticipantsState
    with _$ParticipantsState {
  /// {@nodoc}
  const ParticipantsState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class ParticipantsState$Error extends ParticipantsState
    with _$ParticipantsState {
  /// {@nodoc}
  const ParticipantsState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$ParticipantsState on ParticipantsState {}

/// Pattern matching for [ParticipantsState].
typedef ParticipantsStateMatch<R, S extends ParticipantsState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$ParticipantsStateBase {
  /// {@nodoc}
  const _$ParticipantsStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final ParticipantsEntity? data;

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

  /// Pattern matching for [ParticipantsState].
  R map<R>({
    required ParticipantsStateMatch<R, ParticipantsState$Idle> idle,
    required ParticipantsStateMatch<R, ParticipantsState$Processing> processing,
    required ParticipantsStateMatch<R, ParticipantsState$Successful> successful,
    required ParticipantsStateMatch<R, ParticipantsState$Error> error,
  }) =>
      switch (this) {
        ParticipantsState$Idle s => idle(s),
        ParticipantsState$Processing s => processing(s),
        ParticipantsState$Successful s => successful(s),
        ParticipantsState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [ParticipantsState].
  R maybeMap<R>({
    ParticipantsStateMatch<R, ParticipantsState$Idle>? idle,
    ParticipantsStateMatch<R, ParticipantsState$Processing>? processing,
    ParticipantsStateMatch<R, ParticipantsState$Successful>? successful,
    ParticipantsStateMatch<R, ParticipantsState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [ParticipantsState].
  R? mapOrNull<R>({
    ParticipantsStateMatch<R, ParticipantsState$Idle>? idle,
    ParticipantsStateMatch<R, ParticipantsState$Processing>? processing,
    ParticipantsStateMatch<R, ParticipantsState$Successful>? successful,
    ParticipantsStateMatch<R, ParticipantsState$Error>? error,
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
