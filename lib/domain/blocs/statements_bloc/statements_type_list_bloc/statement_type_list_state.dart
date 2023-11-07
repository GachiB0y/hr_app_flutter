part of 'statement_type_list_bloc.dart';

/// {@template statement_type_list_state_placeholder}
/// Entity placeholder for StatementTypeListState
/// {@endtemplate}
typedef StatementTypeListEntity = List<StatementFieldEntity>;

/// {@template statement_type_list_state}
/// StatementTypeListState.
/// {@endtemplate}
sealed class StatementTypeListState extends _$StatementTypeListStateBase {
  /// Idling state
  /// {@macro statement_type_list_state}
  const factory StatementTypeListState.idle({
    required StatementTypeListEntity? data,
    String message,
  }) = StatementTypeListState$Idle;

  /// Processing
  /// {@macro statement_type_list_state}
  const factory StatementTypeListState.processing({
    required StatementTypeListEntity? data,
    String message,
  }) = StatementTypeListState$Processing;

  /// Successful
  /// {@macro statement_type_list_state}
  const factory StatementTypeListState.successful({
    required StatementTypeListEntity? data,
    String message,
  }) = StatementTypeListState$Successful;

  /// An error has occurred
  /// {@macro statement_type_list_state}
  const factory StatementTypeListState.error({
    required StatementTypeListEntity? data,
    String message,
  }) = StatementTypeListState$Error;

  /// {@macro statement_type_list_state}
  const StatementTypeListState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class StatementTypeListState$Idle extends StatementTypeListState
    with _$StatementTypeListState {
  /// {@nodoc}
  const StatementTypeListState$Idle(
      {required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class StatementTypeListState$Processing extends StatementTypeListState
    with _$StatementTypeListState {
  /// {@nodoc}
  const StatementTypeListState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class StatementTypeListState$Successful extends StatementTypeListState
    with _$StatementTypeListState {
  /// {@nodoc}
  const StatementTypeListState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class StatementTypeListState$Error extends StatementTypeListState
    with _$StatementTypeListState {
  /// {@nodoc}
  const StatementTypeListState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$StatementTypeListState on StatementTypeListState {}

/// Pattern matching for [StatementTypeListState].
typedef StatementTypeListStateMatch<R, S extends StatementTypeListState> = R
    Function(S state);

/// {@nodoc}
@immutable
abstract base class _$StatementTypeListStateBase {
  /// {@nodoc}
  const _$StatementTypeListStateBase(
      {required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final StatementTypeListEntity? data;

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

  /// Pattern matching for [StatementTypeListState].
  R map<R>({
    required StatementTypeListStateMatch<R, StatementTypeListState$Idle> idle,
    required StatementTypeListStateMatch<R, StatementTypeListState$Processing>
        processing,
    required StatementTypeListStateMatch<R, StatementTypeListState$Successful>
        successful,
    required StatementTypeListStateMatch<R, StatementTypeListState$Error> error,
  }) =>
      switch (this) {
        StatementTypeListState$Idle s => idle(s),
        StatementTypeListState$Processing s => processing(s),
        StatementTypeListState$Successful s => successful(s),
        StatementTypeListState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [StatementTypeListState].
  R maybeMap<R>({
    StatementTypeListStateMatch<R, StatementTypeListState$Idle>? idle,
    StatementTypeListStateMatch<R, StatementTypeListState$Processing>?
        processing,
    StatementTypeListStateMatch<R, StatementTypeListState$Successful>?
        successful,
    StatementTypeListStateMatch<R, StatementTypeListState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [StatementTypeListState].
  R? mapOrNull<R>({
    StatementTypeListStateMatch<R, StatementTypeListState$Idle>? idle,
    StatementTypeListStateMatch<R, StatementTypeListState$Processing>?
        processing,
    StatementTypeListStateMatch<R, StatementTypeListState$Successful>?
        successful,
    StatementTypeListStateMatch<R, StatementTypeListState$Error>? error,
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
