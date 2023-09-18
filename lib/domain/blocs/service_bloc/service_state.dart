part of 'service_bloc.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.loading() = ServiceStateLoading;
  const factory ServiceState.loaded({required List<Service> servicesLoaded}) =
      ServiceStateLoaded;
  const factory ServiceState.error() = ServiceStateError;

  factory ServiceState.fromJson(Map<String, dynamic> json) =>
      _$ServiceStateFromJson(json);
}
