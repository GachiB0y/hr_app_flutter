part of 'schedule_bus_bloc.dart';

@freezed
class ScheduleBusEvent with _$ScheduleBusEvent {
  const factory ScheduleBusEvent.fetch() = ScheduleBusEventFetch;
}
