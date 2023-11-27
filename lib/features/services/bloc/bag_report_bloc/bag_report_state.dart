part of 'bag_report_bloc.dart';

/// {@template bag_report_state_placeholder}
/// Entity placeholder for BagReportState
/// {@endtemplate}
typedef BagReportEntityDef = BagReportEntity;

/// {@template bag_report_state}
/// BagReportState.
/// {@endtemplate}
sealed class BagReportState extends _$BagReportStateBase {
  /// Idling state
  /// {@macro bag_report_state}
  const factory BagReportState.idle({
    required BagReportEntityDef? data,
    String message,
  }) = BagReportState$Idle;

  /// Processing
  /// {@macro bag_report_state}
  const factory BagReportState.processing({
    required BagReportEntityDef? data,
    String message,
  }) = BagReportState$Processing;

  /// Successful
  /// {@macro bag_report_state}
  const factory BagReportState.successful({
    required BagReportEntityDef? data,
    String message,
  }) = BagReportState$Successful;

  /// An error has occurred
  /// {@macro bag_report_state}
  const factory BagReportState.error({
    required BagReportEntityDef? data,
    String message,
  }) = BagReportState$Error;

  /// {@macro bag_report_state}
  const BagReportState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class BagReportState$Idle extends BagReportState with _$BagReportState {
  /// {@nodoc}
  const BagReportState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class BagReportState$Processing extends BagReportState
    with _$BagReportState {
  /// {@nodoc}
  const BagReportState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class BagReportState$Successful extends BagReportState
    with _$BagReportState {
  /// {@nodoc}
  const BagReportState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class BagReportState$Error extends BagReportState with _$BagReportState {
  /// {@nodoc}
  const BagReportState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$BagReportState on BagReportState {}

/// Pattern matching for [BagReportState].
typedef BagReportStateMatch<R, S extends BagReportState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$BagReportStateBase {
  /// {@nodoc}
  const _$BagReportStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final BagReportEntityDef? data;

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

  /// Pattern matching for [BagReportState].
  R map<R>({
    required BagReportStateMatch<R, BagReportState$Idle> idle,
    required BagReportStateMatch<R, BagReportState$Processing> processing,
    required BagReportStateMatch<R, BagReportState$Successful> successful,
    required BagReportStateMatch<R, BagReportState$Error> error,
  }) =>
      switch (this) {
        BagReportState$Idle s => idle(s),
        BagReportState$Processing s => processing(s),
        BagReportState$Successful s => successful(s),
        BagReportState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [BagReportState].
  R maybeMap<R>({
    BagReportStateMatch<R, BagReportState$Idle>? idle,
    BagReportStateMatch<R, BagReportState$Processing>? processing,
    BagReportStateMatch<R, BagReportState$Successful>? successful,
    BagReportStateMatch<R, BagReportState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [BagReportState].
  R? mapOrNull<R>({
    BagReportStateMatch<R, BagReportState$Idle>? idle,
    BagReportStateMatch<R, BagReportState$Processing>? processing,
    BagReportStateMatch<R, BagReportState$Successful>? successful,
    BagReportStateMatch<R, BagReportState$Error>? error,
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
