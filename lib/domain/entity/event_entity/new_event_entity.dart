import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_event_entity.freezed.dart';

part 'new_event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventEntity({
    required int id,
    required String title,
    required String description,
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_publish') required bool isPublish,
    @JsonKey(name: 'is_archived') required bool isArchived,
    @JsonKey(name: 'categories') required List<Category> categories,
    required int writer, // ПОЗЖЕ ПЕРЕДЕЛАТЬ НА Writer
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Writer with _$Writer {
  const factory Writer({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'middle_name') required String middleName,
    @JsonKey(name: 'last_name') required String lastName,
  }) = _Writer;

  factory Writer.fromJson(Map<String, dynamic> json) => _$WriterFromJson(json);
}
