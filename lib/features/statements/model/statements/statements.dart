// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'statements.freezed.dart';

part 'statements.g.dart';

@freezed
class StatementTempalteEntity with _$StatementTempalteEntity {
  const factory StatementTempalteEntity({
    @JsonKey(name: 'document_type') required final String documentType,
    required List<TemplateField> template,
  }) = _StatementTempalteEntity;

  factory StatementTempalteEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementTempalteEntityFromJson(json);
}

@freezed
class StatementFieldTypeEntity with _$StatementFieldTypeEntity {
  const factory StatementFieldTypeEntity({
    @JsonKey(name: 'document_type') required final String documentType,
    @JsonKey(name: 'field_body') required final String name,
  }) = _StatementFieldTypeEntity;

  factory StatementFieldTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementFieldTypeEntityFromJson(json);
}

@freezed
class StatementFormInfoToSubmit with _$StatementFormInfoToSubmit {
  const factory StatementFormInfoToSubmit({
    @JsonKey(name: 'document_type') required final String documentType,
    @JsonKey(name: 'participants_to') required final String participantsTo,
    required final TemplateFormStatementsEntity template,
  }) = _StatementFormInfoToSubmit;
  factory StatementFormInfoToSubmit.fromJson(Map<String, dynamic> json) =>
      _$StatementFormInfoToSubmitFromJson(json);
}

@freezed
class TemplateFormStatementsEntity with _$TemplateFormStatementsEntity {
  const factory TemplateFormStatementsEntity({
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final String? patronymic,
    @JsonKey(name: 'start_date') final String? startDate,
    @JsonKey(name: 'end_date') final String? endDate,
    @JsonKey(name: 'work_days') final int? workDays,
    @JsonKey(name: 'business_trip_place') final String? businessTripPlace,
    @JsonKey(name: 'purpose_trip') final String? purposeTrip,
    @JsonKey(name: 'expenses_travel_expenses')
    final int? expensesTravelExpenses,
    final String? reason,
    @JsonKey(name: 'expenses_daily_money') final int? expensesDailyMoney,
    @JsonKey(name: 'expenses_living_place') final int? expensesLivingPlace,
    @JsonKey(name: 'result_rub') final int? resultRub,
    @JsonKey(name: 'result_kop') final int? resultKop,
    @JsonKey(name: 'item_expenditure') final String? itemExpenditure,
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
