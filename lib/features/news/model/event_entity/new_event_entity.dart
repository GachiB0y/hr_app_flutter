// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_event_entity.freezed.dart';

part 'new_event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventEntity({
   required int id,
    String? title,
    String? description,
    String? image,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date')  DateTime? endDate,
    @JsonKey(name: 'created_at')  DateTime? createdAt,
    @JsonKey(name: 'updated_at')  DateTime? updatedAt,
    @JsonKey(name: 'is_publish')  bool? isPublish,
    @JsonKey(name: 'is_archived')  bool? isArchived,
     List<Category>? categories,
    List<Map<String, dynamic>>? vote,

     Writer? writer,
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
    @JsonKey(name: 'user_id') required int id,
    @JsonKey(name: 'name_i') required String firstName,
    @JsonKey(name: 'name') required String middleName,
    @JsonKey(name: 'name_o') required String lastName,
  }) = _Writer;

  factory Writer.fromJson(Map<String, dynamic> json) => _$WriterFromJson(json);
}

@freezed
class EventEntityViewModel with _$EventEntityViewModel {
  const factory EventEntityViewModel({
    required List<EventEntity> listEventEntityLoaded,
    required List<EventEntity> filteredListEventEntity,
  }) = _EventEntityViewModel;

  factory EventEntityViewModel.fromJson(Map<String, dynamic> json) =>
      _$EventEntityViewModelFromJson(json);
}
