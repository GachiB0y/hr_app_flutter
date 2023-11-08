// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatementEntity _$$_StatementEntityFromJson(Map<String, dynamic> json) =>
    _$_StatementEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      templateFields: (json['templateFields'] as List<dynamic>)
          .map((e) => StatementFieldEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatementEntityToJson(_$_StatementEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'templateFields': instance.templateFields,
    };

_$_StatementFieldEntity _$$_StatementFieldEntityFromJson(
        Map<String, dynamic> json) =>
    _$_StatementFieldEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_StatementFieldEntityToJson(
        _$_StatementFieldEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
