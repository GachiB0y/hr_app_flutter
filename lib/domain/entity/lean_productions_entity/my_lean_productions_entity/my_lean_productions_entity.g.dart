// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_lean_productions_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyLeanProductionsEntity _$$_MyLeanProductionsEntityFromJson(
        Map<String, dynamic> json) =>
    _$_MyLeanProductionsEntity(
      date: DateTime.parse(json['date'] as String),
      number: json['number'] as String,
      status: json['status'] as String,
      issue: json['issue'] as String,
      solution: json['solution'] as String,
      expenses: json['expenses'] as String,
      benefit: json['benefit'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MyLeanProductionsEntityToJson(
        _$_MyLeanProductionsEntity instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'number': instance.number,
      'status': instance.status,
      'issue': instance.issue,
      'solution': instance.solution,
      'expenses': instance.expenses,
      'benefit': instance.benefit,
      'files': instance.files,
    };

_$_FileElement _$$_FileElementFromJson(Map<String, dynamic> json) =>
    _$_FileElement(
      fileName: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_FileElementToJson(_$_FileElement instance) =>
    <String, dynamic>{
      'name': instance.fileName,
      'url': instance.url,
    };
