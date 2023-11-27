part of 'event_entity_bloc.dart';

// @freezed
// class EventEntityState with _$EventEntityState {
//   const factory EventEntityState.loading() = EventEntityStateLoading;
//   const factory EventEntityState.loaded({
//     required List<EventEntity> listEventEntityLoaded,
//     required List<EventEntity> filteredListEventEntity,
//   }) = EventEntityStateLoaded;
//   const factory EventEntityState.error() = EventEntityStateError;

//   factory EventEntityState.fromJson(Map<String, dynamic> json) =>
//       _$EventEntityStateFromJson(json);
// }

/// {@template event_entity_state_placeholder}
/// Entity placeholder for EventEntityState
/// {@endtemplate}
typedef EventEntityEntity = EventEntityViewModel?;

/// {@template event_entity_state}
/// EventEntityState.
/// {@endtemplate}
sealed class EventEntityState extends _$EventEntityStateBase {
  /// Idling state
  /// {@macro event_entity_state}
  const factory EventEntityState.idle({
    required EventEntityEntity? data,
    String message,
  }) = EventEntityState$Idle;

  /// Processing
  /// {@macro event_entity_state}
  const factory EventEntityState.processing({
    required EventEntityEntity? data,
    String message,
  }) = EventEntityState$Processing;

  /// Successful
  /// {@macro event_entity_state}
  const factory EventEntityState.successful({
    required EventEntityEntity? data,
    String message,
  }) = EventEntityState$Successful;

  /// An error has occurred
  /// {@macro event_entity_state}
  const factory EventEntityState.error({
    required EventEntityEntity? data,
    String message,
  }) = EventEntityState$Error;

  /// {@macro event_entity_state}
  const EventEntityState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class EventEntityState$Idle extends EventEntityState
    with _$EventEntityState {
  /// {@nodoc}
  const EventEntityState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class EventEntityState$Processing extends EventEntityState
    with _$EventEntityState {
  /// {@nodoc}
  const EventEntityState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class EventEntityState$Successful extends EventEntityState
    with _$EventEntityState {
  /// {@nodoc}
  const EventEntityState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class EventEntityState$Error extends EventEntityState
    with _$EventEntityState {
  /// {@nodoc}
  const EventEntityState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$EventEntityState on EventEntityState {}

/// Pattern matching for [EventEntityState].
typedef EventEntityStateMatch<R, S extends EventEntityState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$EventEntityStateBase {
  /// {@nodoc}
  const _$EventEntityStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final EventEntityEntity? data;

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

  /// Pattern matching for [EventEntityState].
  R map<R>({
    required EventEntityStateMatch<R, EventEntityState$Idle> idle,
    required EventEntityStateMatch<R, EventEntityState$Processing> processing,
    required EventEntityStateMatch<R, EventEntityState$Successful> successful,
    required EventEntityStateMatch<R, EventEntityState$Error> error,
  }) =>
      switch (this) {
        EventEntityState$Idle s => idle(s),
        EventEntityState$Processing s => processing(s),
        EventEntityState$Successful s => successful(s),
        EventEntityState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [EventEntityState].
  R maybeMap<R>({
    EventEntityStateMatch<R, EventEntityState$Idle>? idle,
    EventEntityStateMatch<R, EventEntityState$Processing>? processing,
    EventEntityStateMatch<R, EventEntityState$Successful>? successful,
    EventEntityStateMatch<R, EventEntityState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [EventEntityState].
  R? mapOrNull<R>({
    EventEntityStateMatch<R, EventEntityState$Idle>? idle,
    EventEntityStateMatch<R, EventEntityState$Processing>? processing,
    EventEntityStateMatch<R, EventEntityState$Successful>? successful,
    EventEntityStateMatch<R, EventEntityState$Error>? error,
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
