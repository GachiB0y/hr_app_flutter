// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatementViewModelImpl _$$StatementViewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatementViewModelImpl(
      tempalteEntity: json['tempalteEntity'] == null
          ? null
          : StatementTempalteEntity.fromJson(
              json['tempalteEntity'] as Map<String, dynamic>),
      isSmsApprove: json['isSmsApprove'] as bool? ?? false,
      isSigningStatment: json['isSigningStatment'] as bool? ?? false,
    );

Map<String, dynamic> _$$StatementViewModelImplToJson(
        _$StatementViewModelImpl instance) =>
    <String, dynamic>{
      'tempalteEntity': instance.tempalteEntity,
      'isSmsApprove': instance.isSmsApprove,
      'isSigningStatment': instance.isSigningStatment,
    };

_$StatementTempalteEntityImpl _$$StatementTempalteEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StatementTempalteEntityImpl(
      documentType: json['document_type'] as String,
      isParticipants: json['select_participants'] as bool?,
      template: (json['template'] as List<dynamic>)
          .map((e) => TemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatementTempalteEntityImplToJson(
        _$StatementTempalteEntityImpl instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'select_participants': instance.isParticipants,
      'template': instance.template,
    };

_$StatementFieldTypeEntityImpl _$$StatementFieldTypeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StatementFieldTypeEntityImpl(
      documentType: json['document_type'] as String,
      name: json['field_body'] as String,
    );

Map<String, dynamic> _$$StatementFieldTypeEntityImplToJson(
        _$StatementFieldTypeEntityImpl instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'field_body': instance.name,
    };

_$StatementFormInfoToSubmitImpl _$$StatementFormInfoToSubmitImplFromJson(
        Map<String, dynamic> json) =>
    _$StatementFormInfoToSubmitImpl(
      documentType: json['document_type'] as String,
      participantsTo: json['participantsTo'] as String,
      template: TemplateFormStatementsEntity.fromJson(
          json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatementFormInfoToSubmitImplToJson(
        _$StatementFormInfoToSubmitImpl instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'participantsTo': instance.participantsTo,
      'template': instance.template,
    };

_$TemplateFormStatementsEntityImpl _$$TemplateFormStatementsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateFormStatementsEntityImpl(
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

Map<String, dynamic> _$$TemplateFormStatementsEntityImplToJson(
        _$TemplateFormStatementsEntityImpl instance) =>
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

_$TemplateFieldImpl _$$TemplateFieldImplFromJson(Map<String, dynamic> json) =>
    _$TemplateFieldImpl(
      name: json['field_name'] as String,
      body: json['field_body'] as String,
      dataType: json['field_data_type'] as String,
    );

Map<String, dynamic> _$$TemplateFieldImplToJson(_$TemplateFieldImpl instance) =>
    <String, dynamic>{
      'field_name': instance.name,
      'field_body': instance.body,
      'field_data_type': instance.dataType,
    };
