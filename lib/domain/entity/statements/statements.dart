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
