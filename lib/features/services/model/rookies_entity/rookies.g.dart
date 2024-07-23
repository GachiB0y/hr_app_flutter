// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rookies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RookiesImpl _$$RookiesImplFromJson(Map<String, dynamic> json) =>
    _$RookiesImpl(
      count: (json['count'] as num).toInt(),
      rookies: (json['rookies'] as List<dynamic>)
          .map((e) => OneRookiesInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RookiesImplToJson(_$RookiesImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rookies': instance.rookies,
    };

_$OneRookiesInfoImpl _$$OneRookiesInfoImplFromJson(Map<String, dynamic> json) =>
    _$OneRookiesInfoImpl(
      autoCard: (json['auto_card'] as num).toInt(),
      name: json['name'] as String,
      nameI: json['name_i'] as String,
      nameO: json['name_o'] as String,
      dateBirth: json['date_birth'] as String,
      joinDate: json['join_date'] as String,
      staffPosition: json['staff_position'] as String,
    );

Map<String, dynamic> _$$OneRookiesInfoImplToJson(
        _$OneRookiesInfoImpl instance) =>
    <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'join_date': instance.joinDate,
      'staff_position': instance.staffPosition,
    };
