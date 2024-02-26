part of 'schedule_bus_bloc.dart';

// @freezed
// class ScheduleBusState with _$ScheduleBusState {
//   const factory ScheduleBusState.loading() = ScheduleBusStateLoading;
//   const factory ScheduleBusState.loaded({
//     required ScheduleBus scheduleBusLoaded,
//   }) = ScheduleBusStateLoaded;
//   const factory ScheduleBusState.error({String? errorText}) =
//       ScheduleBusStateError;

//   factory ScheduleBusState.fromJson(Map<String, dynamic> json) =>
//       _$ScheduleBusStateFromJson(json);
// }

/// {@template schedule_bus_state_placeholder}
/// Entity placeholder for ScheduleBusState
/// {@endtemplate}
typedef ScheduleBusEntity = ScheduleBus;

/// {@template schedule_bus_state}
/// ScheduleBusState.
/// {@endtemplate}
sealed class ScheduleBusState extends _$ScheduleBusStateBase {
  /// Idling state
  /// {@macro schedule_bus_state}
  const factory ScheduleBusState.idle({
    required ScheduleBusEntity? data,
    String message,
  }) = ScheduleBusState$Idle;

  /// Processing
  /// {@macro schedule_bus_state}
  const factory ScheduleBusState.processing({
    required ScheduleBusEntity? data,
    String message,
  }) = ScheduleBusState$Processing;

  /// Successful
  /// {@macro schedule_bus_state}
  const factory ScheduleBusState.successful({
    required ScheduleBusEntity? data,
    String message,
  }) = ScheduleBusState$Successful;

  /// An error has occurred
  /// {@macro schedule_bus_state}
  const factory ScheduleBusState.error({
    required ScheduleBusEntity? data,
    String message,
  }) = ScheduleBusState$Error;

  /// {@macro schedule_bus_state}
  const ScheduleBusState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class ScheduleBusState$Idle extends ScheduleBusState
    with _$ScheduleBusState {
  /// {@nodoc}
  const ScheduleBusState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class ScheduleBusState$Processing extends ScheduleBusState
    with _$ScheduleBusState {
  /// {@nodoc}
  const ScheduleBusState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class ScheduleBusState$Successful extends ScheduleBusState
    with _$ScheduleBusState {
  /// {@nodoc}
  const ScheduleBusState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class ScheduleBusState$Error extends ScheduleBusState
    with _$ScheduleBusState {
  /// {@nodoc}
  const ScheduleBusState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$ScheduleBusState on ScheduleBusState {}

/// Pattern matching for [ScheduleBusState].
typedef ScheduleBusStateMatch<R, S extends ScheduleBusState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$ScheduleBusStateBase {
  /// {@nodoc}
  const _$ScheduleBusStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final ScheduleBusEntity? data;

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

  /// Pattern matching for [ScheduleBusState].
  R map<R>({
    required ScheduleBusStateMatch<R, ScheduleBusState$Idle> idle,
    required ScheduleBusStateMatch<R, ScheduleBusState$Processing> processing,
    required ScheduleBusStateMatch<R, ScheduleBusState$Successful> successful,
    required ScheduleBusStateMatch<R, ScheduleBusState$Error> error,
  }) =>
      switch (this) {
        ScheduleBusState$Idle s => idle(s),
        ScheduleBusState$Processing s => processing(s),
        ScheduleBusState$Successful s => successful(s),
        ScheduleBusState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [ScheduleBusState].
  R maybeMap<R>({
    ScheduleBusStateMatch<R, ScheduleBusState$Idle>? idle,
    ScheduleBusStateMatch<R, ScheduleBusState$Processing>? processing,
    ScheduleBusStateMatch<R, ScheduleBusState$Successful>? successful,
    ScheduleBusStateMatch<R, ScheduleBusState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [ScheduleBusState].
  R? mapOrNull<R>({
    ScheduleBusStateMatch<R, ScheduleBusState$Idle>? idle,
    ScheduleBusStateMatch<R, ScheduleBusState$Processing>? processing,
    ScheduleBusStateMatch<R, ScheduleBusState$Successful>? successful,
    ScheduleBusStateMatch<R, ScheduleBusState$Error>? error,
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
