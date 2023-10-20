part of 'service_bloc.dart';

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.fetch({required bool isRow}) = ServiceEventFetch;
}
