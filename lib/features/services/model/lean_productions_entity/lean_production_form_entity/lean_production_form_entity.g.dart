// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lean_production_form_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeanProductionFormEntityImpl _$$LeanProductionFormEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LeanProductionFormEntityImpl(
      realized: json['realized'] as bool,
      firstImplementer: (json['first_implementer'] as num?)?.toInt() ?? 0,
      secondImplementer: (json['second_implementer'] as num?)?.toInt() ?? 0,
      thirdImplementer: (json['third_implementer'] as num?)?.toInt() ?? 0,
      issue: json['issue'] as String,
      solution: json['solution'] as String,
      expenses: json['expenses'] as String,
      benefit: json['benefit'] as String,
      paths:
          (json['paths'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$LeanProductionFormEntityImplToJson(
        _$LeanProductionFormEntityImpl instance) =>
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
