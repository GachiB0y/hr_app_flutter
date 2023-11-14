part of 'event_entity_bloc.dart';

@freezed
class EventEntityEvent with _$EventEntityEvent {
  const factory EventEntityEvent.fetch() = EventEntityEventFetch;
  const factory EventEntityEvent.createNewEventEntity({
    required String title,
    required String description,
    required String startDate,
    required String? endDate,
    required File imageFile,
    required List<String> categories,
  }) = EventEntityEventCreateNewEventEntity;
  const factory EventEntityEvent.filterNews({
    required int idTab,
    required List<EventEntity> listEventEntityLoaded,
  }) = EventEntityEventFilterNews;
}
