import 'package:freezed_annotation/freezed_annotation.dart';
part 'shedule_bus_entity.freezed.dart';
part 'shedule_bus_entity.g.dart';

@freezed
class SheduleBus with _$SheduleBus {
  const factory SheduleBus({
    required List<City> city,
  }) = _SheduleBus;

  factory SheduleBus.fromJson(Map<String, dynamic> json) =>
      _$SheduleBusFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    required String nameCity,
    required List<Destination> destinations,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Destination with _$Destination {
  const factory Destination({
    @JsonKey(name: 'name_path') required String namePath,
    required String link,
    required int id,
  }) = _Destination;

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}
