part of 'event_entity_bloc.dart';

@freezed
class EventEntityEvent with _$EventEntityEvent {
  const factory EventEntityEvent.fetch() = EventEntityEventFetch;
}
