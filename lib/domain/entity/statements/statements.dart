import 'package:freezed_annotation/freezed_annotation.dart';

part 'statements.freezed.dart';

part 'statements.g.dart';

@freezed
class StatementEntity with _$StatementEntity {
  const factory StatementEntity({
    required final String id,
    required final String name,
    required List<StatementFieldEntity> templateFields,
  }) = _StatementEntity;

  factory StatementEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementEntityFromJson(json);
}

@freezed
class StatementFieldEntity with _$StatementFieldEntity {
  const factory StatementFieldEntity({
    required final String id,
    required final String name,
  }) = _StatementFieldEntity;

  factory StatementFieldEntity.fromJson(Map<String, dynamic> json) =>
      _$StatementFieldEntityFromJson(json);
}

@freezed
class StatementFormInfo with _$StatementFormInfo {
  const factory StatementFormInfo({
    required final String templateId,
    required final ParticipantsFrom participantsFrom,
    required final String participantsTo,
    required final List<TemplateField> templateFields,
  }) = _StatementFormInfo;
  factory StatementFormInfo.fromJson(Map<String, dynamic> json) =>
      _$StatementFormInfoFromJson(json);
}

@freezed
class ParticipantsFrom with _$ParticipantsFrom {
  const factory ParticipantsFrom({
    required final String firstName,
    required final String lastName,
    required final String patronymic,
  }) = _ParticipantsFrom;
  factory ParticipantsFrom.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsFromFromJson(json);
}

@freezed
class TemplateField with _$TemplateField {
  const factory TemplateField({
    required final String id,
    required final String value,
  }) = _TemplateField;

  factory TemplateField.fromJson(Map<String, dynamic> json) =>
      _$TemplateFieldFromJson(json);
}
