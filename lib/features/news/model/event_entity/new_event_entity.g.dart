// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPublish: json['is_publish'] as bool,
      isArchived: json['is_archived'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      writer: Writer.fromJson(json['writer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_publish': instance.isPublish,
      'is_archived': instance.isArchived,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'writer': instance.writer.toJson(),
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$WriterImpl _$$WriterImplFromJson(Map<String, dynamic> json) => _$WriterImpl(
      id: (json['user_id'] as num).toInt(),
      firstName: json['name_i'] as String,
      middleName: json['name'] as String,
      lastName: json['name_o'] as String,
    );

Map<String, dynamic> _$$WriterImplToJson(_$WriterImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'name_i': instance.firstName,
      'name': instance.middleName,
      'name_o': instance.lastName,
    };

_$EventEntityViewModelImpl _$$EventEntityViewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventEntityViewModelImpl(
      listEventEntityLoaded: (json['listEventEntityLoaded'] as List<dynamic>)
          .map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      filteredListEventEntity:
          (json['filteredListEventEntity'] as List<dynamic>)
              .map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$EventEntityViewModelImplToJson(
        _$EventEntityViewModelImpl instance) =>
    <String, dynamic>{
      'listEventEntityLoaded': instance.listEventEntityLoaded,
      'filteredListEventEntity': instance.filteredListEventEntity,
    };
