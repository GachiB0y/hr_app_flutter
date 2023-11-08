part of 'statements_bloc.dart';

/// {@template statements_state_placeholder}
/// Entity placeholder for StatementsState
/// {@endtemplate}
typedef StatementsEntity = List<StatementEntity>?;

/// {@template statements_state}
/// StatementsState.
/// {@endtemplate}
sealed class StatementsState extends _$StatementsStateBase {
  /// Idling state
  /// {@macro statements_state}
  const factory StatementsState.idle({
    required StatementsEntity data,
    String message,
  }) = StatementsState$Idle;

  /// Processing
  /// {@macro statements_state}
  const factory StatementsState.processing({
    required StatementsEntity data,
    String message,
  }) = StatementsState$Processing;

  /// Successful
  /// {@macro statements_state}
  const factory StatementsState.successful({
    required StatementsEntity data,
    String message,
  }) = StatementsState$Successful;

  /// An error has occurred
  /// {@macro statements_state}
  const factory StatementsState.error({
    required StatementsEntity data,
    String message,
  }) = StatementsState$Error;

  /// {@macro statements_state}
  const StatementsState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class StatementsState$Idle extends StatementsState
    with _$StatementsState {
  /// {@nodoc}
  const StatementsState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class StatementsState$Processing extends StatementsState
    with _$StatementsState {
  /// {@nodoc}
  const StatementsState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class StatementsState$Successful extends StatementsState
    with _$StatementsState {
  /// {@nodoc}
  const StatementsState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class StatementsState$Error extends StatementsState
    with _$StatementsState {
  /// {@nodoc}
  const StatementsState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$StatementsState on StatementsState {}

/// Pattern matching for [StatementsState].
typedef StatementsStateMatch<R, S extends StatementsState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$StatementsStateBase {
  /// {@nodoc}
  const _$StatementsStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final StatementsEntity data;

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

  /// Pattern matching for [StatementsState].
  R map<R>({
    required StatementsStateMatch<R, StatementsState$Idle> idle,
    required StatementsStateMatch<R, StatementsState$Processing> processing,
    required StatementsStateMatch<R, StatementsState$Successful> successful,
    required StatementsStateMatch<R, StatementsState$Error> error,
  }) =>
      switch (this) {
        StatementsState$Idle s => idle(s),
        StatementsState$Processing s => processing(s),
        StatementsState$Successful s => successful(s),
        StatementsState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [StatementsState].
  R maybeMap<R>({
    StatementsStateMatch<R, StatementsState$Idle>? idle,
    StatementsStateMatch<R, StatementsState$Processing>? processing,
    StatementsStateMatch<R, StatementsState$Successful>? successful,
    StatementsStateMatch<R, StatementsState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [StatementsState].
  R? mapOrNull<R>({
    StatementsStateMatch<R, StatementsState$Idle>? idle,
    StatementsStateMatch<R, StatementsState$Processing>? processing,
    StatementsStateMatch<R, StatementsState$Successful>? successful,
    StatementsStateMatch<R, StatementsState$Error>? error,
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
