part of 'event_entity_bloc.dart';

@freezed
class EventEntityState with _$EventEntityState {
  const factory EventEntityState.loading() = EventEntityStateLoading;
  const factory EventEntityState.loaded({
    required List<EventEntity> listEventEntityLoaded,
    required List<EventEntity> filteredListEventEntity,
  }) = EventEntityStateLoaded;
  const factory EventEntityState.error() = EventEntityStateError;

  factory EventEntityState.fromJson(Map<String, dynamic> json) =>
      _$EventEntityStateFromJson(json);
}
