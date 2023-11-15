// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventEntity _$$_EventEntityFromJson(Map<String, dynamic> json) =>
    _$_EventEntity(
      id: json['id'] as int,
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

Map<String, dynamic> _$$_EventEntityToJson(_$_EventEntity instance) =>
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

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Writer _$$_WriterFromJson(Map<String, dynamic> json) => _$_Writer(
      id: json['user_id'] as int,
      firstName: json['name_i'] as String,
      middleName: json['name'] as String,
      lastName: json['name_o'] as String,
    );

Map<String, dynamic> _$$_WriterToJson(_$_Writer instance) => <String, dynamic>{
      'user_id': instance.id,
      'name_i': instance.firstName,
      'name': instance.middleName,
      'name_o': instance.lastName,
    };
