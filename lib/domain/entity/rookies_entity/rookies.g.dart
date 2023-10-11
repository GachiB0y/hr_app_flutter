// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rookies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rookies _$$_RookiesFromJson(Map<String, dynamic> json) => _$_Rookies(
      count: json['count'] as int,
      rookies: (json['rookies'] as List<dynamic>)
          .map((e) => OneRookiesInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RookiesToJson(_$_Rookies instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rookies': instance.rookies,
    };

_$_OneRookiesInfo _$$_OneRookiesInfoFromJson(Map<String, dynamic> json) =>
    _$_OneRookiesInfo(
      autoCard: json['auto_card'] as int,
      name: json['name'] as String,
      nameI: json['name_i'] as String,
      nameO: json['name_o'] as String,
      dateBirth: json['date_birth'] as String,
      staffPosition: json['staff_position'] as String,
    );

Map<String, dynamic> _$$_OneRookiesInfoToJson(_$_OneRookiesInfo instance) =>
    <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'staff_position': instance.staffPosition,
    };
