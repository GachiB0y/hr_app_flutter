// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_day_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BirthDayInfoEntityImpl _$$BirthDayInfoEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BirthDayInfoEntityImpl(
      count: (json['count'] as num).toInt(),
      birthdays: (json['birthdays'] as List<dynamic>)
          .map((e) => OneBirthDayInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BirthDayInfoEntityImplToJson(
        _$BirthDayInfoEntityImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'birthdays': instance.birthdays,
    };

_$OneBirthDayInfoImpl _$$OneBirthDayInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$OneBirthDayInfoImpl(
      autoCard: (json['auto_card'] as num).toInt(),
      name: json['name'] as String,
      nameI: json['name_i'] as String,
      nameO: json['name_o'] as String,
      dateBirth: json['date_birth'] as String,
      staffPosition: json['staff_position'] as String?,
    );

Map<String, dynamic> _$$OneBirthDayInfoImplToJson(
        _$OneBirthDayInfoImpl instance) =>
    <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'staff_position': instance.staffPosition,
    };
