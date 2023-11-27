// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_bus_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleBus _$$_ScheduleBusFromJson(Map<String, dynamic> json) =>
    _$_ScheduleBus(
      result: (json['result'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleBusToJson(_$_ScheduleBus instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      country: json['country'] as String,
      destinations: (json['destinations'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'country': instance.country,
      'destinations': instance.destinations,
    };

_$_Destination _$$_DestinationFromJson(Map<String, dynamic> json) =>
    _$_Destination(
      namePath: json['name_path'] as String,
      link: json['link'] as String,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_DestinationToJson(_$_Destination instance) =>
    <String, dynamic>{
      'name_path': instance.namePath,
      'link': instance.link,
      'id': instance.id,
    };
