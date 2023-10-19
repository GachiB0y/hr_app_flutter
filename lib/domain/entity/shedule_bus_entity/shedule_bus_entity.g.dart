// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shedule_bus_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SheduleBus _$$_SheduleBusFromJson(Map<String, dynamic> json) =>
    _$_SheduleBus(
      city: (json['city'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SheduleBusToJson(_$_SheduleBus instance) =>
    <String, dynamic>{
      'city': instance.city,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      nameCity: json['nameCity'] as String,
      destinations: (json['destinations'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'nameCity': instance.nameCity,
      'destinations': instance.destinations,
    };

_$_Destination _$$_DestinationFromJson(Map<String, dynamic> json) =>
    _$_Destination(
      namePath: json['name_path'] as String,
      link: json['link'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_DestinationToJson(_$_Destination instance) =>
    <String, dynamic>{
      'name_path': instance.namePath,
      'link': instance.link,
      'id': instance.id,
    };
