// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'schedule_bus_entity.freezed.dart';
part 'schedule_bus_entity.g.dart';

@freezed
class ScheduleBus with _$ScheduleBus {
  const factory ScheduleBus({
    required List<City> cities,
    required List<Destination> destinations,
  }) = _ScheduleBus;

  factory ScheduleBus.fromJson(Map<String, dynamic> json) =>
      _$ScheduleBusFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    required int id,
    required String name,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Destination with _$Destination {
  const factory Destination({
    @JsonKey(name: 'name_path') required String namePath,
    required String link,
    int? id,
  }) = _Destination;

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}
