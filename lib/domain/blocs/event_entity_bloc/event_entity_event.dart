part of 'event_entity_bloc.dart';

@freezed
class EventEntityEvent with _$EventEntityEvent {
  const factory EventEntityEvent.fetch() = EventEntityEventFetch;
  const factory EventEntityEvent.filterNews(
          {required int idTab,
          required List<EventEntity> listEventEntityLoaded}) =
      EventEntityEventFilterNews;
}
