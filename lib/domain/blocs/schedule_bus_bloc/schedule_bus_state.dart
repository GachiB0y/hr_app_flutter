part of 'schedule_bus_bloc.dart';

@freezed
class ScheduleBusState with _$ScheduleBusState {
  const factory ScheduleBusState.loading() = ScheduleBusStateLoading;
  const factory ScheduleBusState.loaded({
    required ScheduleBus scheduleBusLoaded,
  }) = ScheduleBusStateLoaded;
  const factory ScheduleBusState.error({String? errorText}) =
      ScheduleBusStateError;

  factory ScheduleBusState.fromJson(Map<String, dynamic> json) =>
      _$ScheduleBusStateFromJson(json);
}
