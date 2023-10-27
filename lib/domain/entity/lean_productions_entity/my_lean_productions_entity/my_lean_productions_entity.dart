import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_lean_productions_entity.freezed.dart';
part 'my_lean_productions_entity.g.dart';

@freezed
class MyLeanProductionsEntity with _$MyLeanProductionsEntity {
  const factory MyLeanProductionsEntity({
    required DateTime date,
    required String number,
    required String status,
    required String issue,
    required String solution,
    required String expenses,
    required String benefit,
    required List<FileElement> files,
  }) = _MyLeanProductionsEntity;

  factory MyLeanProductionsEntity.fromJson(Map<String, dynamic> json) =>
      _$MyLeanProductionsEntityFromJson(json);
}

@freezed
class FileElement with _$FileElement {
  const factory FileElement({
    @JsonKey(name: 'name') required String fileName,
    required String url,
  }) = _FileElement;

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);
}
