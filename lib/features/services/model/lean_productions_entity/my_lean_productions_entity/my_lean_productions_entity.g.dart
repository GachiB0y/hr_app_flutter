// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_lean_productions_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyLeanProductionsEntityImpl _$$MyLeanProductionsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MyLeanProductionsEntityImpl(
      date: DateTime.parse(json['date'] as String),
      number: json['number'] as String,
      status: json['status'] as String,
      issue: json['issue'] as String,
      solution: json['solution'] as String,
      expenses: json['expenses'] as String,
      benefit: json['benefit'] as String,
      implementers: (json['implementers'] as List<dynamic>)
          .map((e) =>
              ImplementsForLeanProdInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>)
          .map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyLeanProductionsEntityImplToJson(
        _$MyLeanProductionsEntityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'number': instance.number,
      'status': instance.status,
      'issue': instance.issue,
      'solution': instance.solution,
      'expenses': instance.expenses,
      'benefit': instance.benefit,
      'implementers': instance.implementers,
      'files': instance.files,
    };

_$FileElementImpl _$$FileElementImplFromJson(Map<String, dynamic> json) =>
    _$FileElementImpl(
      fileName: json['name'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$FileElementImplToJson(_$FileElementImpl instance) =>
    <String, dynamic>{
      'name': instance.fileName,
      'url': instance.url,
    };

_$ImplementsForLeanProdInfoImpl _$$ImplementsForLeanProdInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ImplementsForLeanProdInfoImpl(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$ImplementsForLeanProdInfoImplToJson(
        _$ImplementsForLeanProdInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
