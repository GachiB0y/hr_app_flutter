// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lean_production_form_entity.freezed.dart';
part 'lean_production_form_entity.g.dart';

@freezed
class LeanProductionFormEntity with _$LeanProductionFormEntity {
  const factory LeanProductionFormEntity({
    required bool realized,
    @Default(0) @JsonKey(name: 'first_implementer') int firstImplementer,
    @Default(0) @JsonKey(name: 'second_implementer') int secondImplementer,
    @Default(0) @JsonKey(name: 'third_implementer') int thirdImplementer,
    required String issue,
    required String solution,
    required String expenses,
    required String benefit,
    required List<String> paths,
  }) = _LeanProductionFormEntity;

  factory LeanProductionFormEntity.fromJson(Map<String, dynamic> json) =>
      _$LeanProductionFormEntityFromJson(json);
}
