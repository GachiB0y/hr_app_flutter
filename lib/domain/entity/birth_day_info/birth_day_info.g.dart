// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_day_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BirthDayInfoEntity _$$_BirthDayInfoEntityFromJson(
        Map<String, dynamic> json) =>
    _$_BirthDayInfoEntity(
      count: json['count'] as int,
      birthdays: (json['birthdays'] as List<dynamic>)
          .map((e) => OneBirthDayInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BirthDayInfoEntityToJson(
        _$_BirthDayInfoEntity instance) =>
    <String, dynamic>{
      'count': instance.count,
      'birthdays': instance.birthdays,
    };

_$_OneBirthDayInfo _$$_OneBirthDayInfoFromJson(Map<String, dynamic> json) =>
    _$_OneBirthDayInfo(
      autoCard: json['auto_card'] as int,
      name: json['name'] as String,
      nameI: json['name_i'] as String,
      nameO: json['name_o'] as String,
      dateBirth: json['date_birth'] as String,
      staffPosition: json['staff_position'] as String?,
    );

Map<String, dynamic> _$$_OneBirthDayInfoToJson(_$_OneBirthDayInfo instance) =>
    <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'staff_position': instance.staffPosition,
    };
