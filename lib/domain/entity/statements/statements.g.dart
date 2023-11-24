// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatementEntity _$$_StatementEntityFromJson(Map<String, dynamic> json) =>
    _$_StatementEntity(
      documentType: json['document_type'] as String,
      template: (json['template'] as List<dynamic>)
          .map((e) => TemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatementEntityToJson(_$_StatementEntity instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'template': instance.template,
    };

_$_StatementFieldTypeEntity _$$_StatementFieldTypeEntityFromJson(
        Map<String, dynamic> json) =>
    _$_StatementFieldTypeEntity(
      documentType: json['document_type'] as String,
      name: json['field_body'] as String,
    );

Map<String, dynamic> _$$_StatementFieldTypeEntityToJson(
        _$_StatementFieldTypeEntity instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'field_body': instance.name,
    };

_$_StatementFormInfo _$$_StatementFormInfoFromJson(Map<String, dynamic> json) =>
    _$_StatementFormInfo(
      documentType: json['document_type'] as String,
      template: TemplateFormStatementsEntity.fromJson(
          json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatementFormInfoToJson(
        _$_StatementFormInfo instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'template': instance.template,
    };

_$_TemplateFormStatementsEntity _$$_TemplateFormStatementsEntityFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateFormStatementsEntity(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      patronymic: json['patronymic'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      weekendDays: json['weekend_days'] as String?,
      businessTripPlace: json['business_trip_place'] as String?,
      purposeTrip: json['purpose_trip'] as String?,
      expensesTravelExpenses: json['expenses_travel_expenses'] as String?,
      reason: json['reason'] as String?,
      expensesAilyMoney: json['expenses_aily_money'] as String?,
      expensesLivingPlace: json['expenses_living_place'] as String?,
    );

Map<String, dynamic> _$$_TemplateFormStatementsEntityToJson(
        _$_TemplateFormStatementsEntity instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'patronymic': instance.patronymic,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'weekend_days': instance.weekendDays,
      'business_trip_place': instance.businessTripPlace,
      'purpose_trip': instance.purposeTrip,
      'expenses_travel_expenses': instance.expensesTravelExpenses,
      'reason': instance.reason,
      'expenses_aily_money': instance.expensesAilyMoney,
      'expenses_living_place': instance.expensesLivingPlace,
    };

_$_TemplateField _$$_TemplateFieldFromJson(Map<String, dynamic> json) =>
    _$_TemplateField(
      name: json['field_name'] as String,
      value: json['field_body'] as String,
    );

Map<String, dynamic> _$$_TemplateFieldToJson(_$_TemplateField instance) =>
    <String, dynamic>{
      'field_name': instance.name,
      'field_body': instance.value,
    };
