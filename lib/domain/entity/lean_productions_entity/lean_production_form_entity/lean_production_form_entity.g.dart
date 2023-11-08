// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lean_production_form_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeanProductionFormEntity _$$_LeanProductionFormEntityFromJson(
        Map<String, dynamic> json) =>
    _$_LeanProductionFormEntity(
      realized: json['realized'] as bool,
      firstImplementer: json['first_implementer'] as int? ?? 0,
      secondImplementer: json['second_implementer'] as int? ?? 0,
      thirdImplementer: json['third_implementer'] as int? ?? 0,
      issue: json['issue'] as String,
      solution: json['solution'] as String,
      expenses: json['expenses'] as String,
      benefit: json['benefit'] as String,
      paths: (json['paths'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LeanProductionFormEntityToJson(
        _$_LeanProductionFormEntity instance) =>
    <String, dynamic>{
      'realized': instance.realized,
      'first_implementer': instance.firstImplementer,
      'second_implementer': instance.secondImplementer,
      'third_implementer': instance.thirdImplementer,
      'issue': instance.issue,
      'solution': instance.solution,
      'expenses': instance.expenses,
      'benefit': instance.benefit,
      'paths': instance.paths,
    };
