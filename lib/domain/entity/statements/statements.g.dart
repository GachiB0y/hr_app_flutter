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

_$_StatementFormInfo _$$_StatementFormInfoFromJson(Map<String, dynamic> json) =>
    _$_StatementFormInfo(
      templateId: json['templateId'] as String,
      participantsFrom: ParticipantsFrom.fromJson(
          json['participantsFrom'] as Map<String, dynamic>),
      participantsTo: json['participantsTo'] as String,
      templateFields: (json['templateFields'] as List<dynamic>)
          .map((e) => TemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatementFormInfoToJson(
        _$_StatementFormInfo instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'participantsFrom': instance.participantsFrom,
      'participantsTo': instance.participantsTo,
      'templateFields': instance.templateFields,
    };

_$_ParticipantsFrom _$$_ParticipantsFromFromJson(Map<String, dynamic> json) =>
    _$_ParticipantsFrom(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      patronymic: json['patronymic'] as String,
    );

Map<String, dynamic> _$$_ParticipantsFromToJson(_$_ParticipantsFrom instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'patronymic': instance.patronymic,
    };

_$_TemplateField _$$_TemplateFieldFromJson(Map<String, dynamic> json) =>
    _$_TemplateField(
      id: json['id'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_TemplateFieldToJson(_$_TemplateField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
