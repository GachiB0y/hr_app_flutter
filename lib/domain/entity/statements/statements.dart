// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'statements.freezed.dart';

part 'statements.g.dart';

@freezed
class StatementEntity with _$StatementEntity {
  const factory StatementEntity({
    @JsonKey(name: 'document_type') required final String documentType,
    required List<TemplateField> template,
  }) = _StatementEntity;

  factory StatementEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementEntityFromJson(json);
}

@freezed
class StatementFielTypedEntity with _$StatementFielTypedEntity {
  const factory StatementFielTypedEntity({
    @JsonKey(name: 'document_type') required final String documentType,
    @JsonKey(name: 'field_body') required final String name,
  }) = _StatementFielTypedEntity;

  factory StatementFielTypedEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementFielTypedEntityFromJson(json);
}

@freezed
class StatementFormInfo with _$StatementFormInfo {
  const factory StatementFormInfo({
    @JsonKey(name: 'document_type') required final String documentType,
    required final TemplateFormStatementsEntity template,
  }) = _StatementFormInfo;
  factory StatementFormInfo.fromJson(Map<String, dynamic> json) =>
      _$StatementFormInfoFromJson(json);
}

@freezed
class TemplateFormStatementsEntity with _$TemplateFormStatementsEntity {
  const factory TemplateFormStatementsEntity({
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final String? patronymic,
    @JsonKey(name: 'start_date') final String? startDate,
    @JsonKey(name: 'end_date') final String? endDate,
    @JsonKey(name: 'weekend_days') final String? weekendDays,
    @JsonKey(name: 'business_trip_place') final String? businessTripPlace,
    @JsonKey(name: 'purpose_trip') final String? purposeTrip,
    @JsonKey(name: 'expenses_travel_expenses')
    final String? expensesTravelExpenses,
    @JsonKey(name: 'expenses_aily_money') final String? expensesAilyMoney,
    @JsonKey(name: 'expenses_living_place') final String? expensesLivingPlace,
  }) = _TemplateFormStatementsEntity;
  factory TemplateFormStatementsEntity.fromJson(Map<String, dynamic> json) =>
      _$TemplateFormStatementsEntityFromJson(json);
}

@freezed
class TemplateField with _$TemplateField {
  const factory TemplateField({
    @JsonKey(name: 'field_name') required final String name,
    @JsonKey(name: 'field_body') required final String value,
  }) = _TemplateField;

  factory TemplateField.fromJson(Map<String, dynamic> json) =>
      _$TemplateFieldFromJson(json);
}
