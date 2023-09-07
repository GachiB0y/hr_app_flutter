// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventEntity _$$_EventEntityFromJson(Map<String, dynamic> json) =>
    _$_EventEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPublish: json['is_publish'] as bool,
      isArchived: json['is_archived'] as bool,
      category_id: (json['category_id'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      write: Writer.fromJson(json['write'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EventEntityToJson(_$_EventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_publish': instance.isPublish,
      'is_archived': instance.isArchived,
      'category_id': instance.category_id.map((e) => e.toJson()).toList(),
      'write': instance.write.toJson(),
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$_Writer _$$_WriterFromJson(Map<String, dynamic> json) => _$_Writer(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$$_WriterToJson(_$_Writer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
    };
