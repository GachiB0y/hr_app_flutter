part of 'schedule_bus_bloc.dart';

// @freezed
// class ScheduleBusEvent with _$ScheduleBusEvent {
//   const factory ScheduleBusEvent.fetch() = ScheduleBusEventFetch;
// }

@freezed
class ScheduleBusEvent with _$ScheduleBusEvent {
  const ScheduleBusEvent._();

  /// Fetch Cities
  const factory ScheduleBusEvent.fetchCitites() = FetchCititesScheduleBusEvent;

  /// Fetch Destinations
  const factory ScheduleBusEvent.fetchDestinations(
      {required int? cityId,
      required String? timeOfDay,
      required String? routeForJob,
      @Default(false) bool isAll}) = FetchDestinationsScheduleBusEvent;
}
