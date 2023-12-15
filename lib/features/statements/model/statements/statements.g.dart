// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatementViewModel _$$_StatementViewModelFromJson(
        Map<String, dynamic> json) =>
    _$_StatementViewModel(
      tempalteEntity: json['tempalteEntity'] == null
          ? null
          : StatementTempalteEntity.fromJson(
              json['tempalteEntity'] as Map<String, dynamic>),
      isSmsApprove: json['isSmsApprove'] as bool? ?? false,
      isSigningStatment: json['isSigningStatment'] as bool? ?? false,
    );

Map<String, dynamic> _$$_StatementViewModelToJson(
        _$_StatementViewModel instance) =>
    <String, dynamic>{
      'tempalteEntity': instance.tempalteEntity,
      'isSmsApprove': instance.isSmsApprove,
      'isSigningStatment': instance.isSigningStatment,
    };

_$_StatementTempalteEntity _$$_StatementTempalteEntityFromJson(
        Map<String, dynamic> json) =>
    _$_StatementTempalteEntity(
      documentType: json['document_type'] as String,
      isParticipants: json['select_participants'] as bool?,
      template: (json['template'] as List<dynamic>)
          .map((e) => TemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatementTempalteEntityToJson(
        _$_StatementTempalteEntity instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'select_participants': instance.isParticipants,
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

_$_StatementFormInfoToSubmit _$$_StatementFormInfoToSubmitFromJson(
        Map<String, dynamic> json) =>
    _$_StatementFormInfoToSubmit(
      documentType: json['document_type'] as String,
      participantsTo: json['participantsTo'] as String,
      template: TemplateFormStatementsEntity.fromJson(
          json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatementFormInfoToSubmitToJson(
        _$_StatementFormInfoToSubmit instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'participantsTo': instance.participantsTo,
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
      workDays: json['work_days'] as String?,
      businessTripPlace: json['business_trip_place'] as String?,
      purposeTrip: json['purpose_trip'] as String?,
      expensesTravelExpenses: json['expenses_travel_expenses'] as String?,
      reason: json['reason'] as String?,
      expensesDailyMoney: json['expenses_daily_money'] as String?,
      expensesLivingPlace: json['expenses_living_place'] as String?,
      resultRub: json['result_rub'] as String?,
      resultKop: json['result_kop'] as String?,
      itemExpenditure: json['item_expenditure'] as String?,
    );

Map<String, dynamic> _$$_TemplateFormStatementsEntityToJson(
        _$_TemplateFormStatementsEntity instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'patronymic': instance.patronymic,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'work_days': instance.workDays,
      'business_trip_place': instance.businessTripPlace,
      'purpose_trip': instance.purposeTrip,
      'expenses_travel_expenses': instance.expensesTravelExpenses,
      'reason': instance.reason,
      'expenses_daily_money': instance.expensesDailyMoney,
      'expenses_living_place': instance.expensesLivingPlace,
      'result_rub': instance.resultRub,
      'result_kop': instance.resultKop,
      'item_expenditure': instance.itemExpenditure,
    };

_$_TemplateField _$$_TemplateFieldFromJson(Map<String, dynamic> json) =>
    _$_TemplateField(
      name: json['field_name'] as String,
      body: json['field_body'] as String,
      dataType: json['field_data_type'] as String,
    );

Map<String, dynamic> _$$_TemplateFieldToJson(_$_TemplateField instance) =>
    <String, dynamic>{
      'field_name': instance.name,
      'field_body': instance.body,
      'field_data_type': instance.dataType,
    };
