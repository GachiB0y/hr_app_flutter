// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      autoCard: (json['auto_card'] as num).toInt(),
      name: json['name'] as String,
      nameI: json['name_i'] as String,
      nameO: json['name_o'] as String,
      dateBirth: json['date_birth'] as String? ?? null,
      staffPosition: json['staff_position'] as String,
      email: json['email'] as String? ?? null,
      phoneOne: json['phone_1'] as String? ?? null,
      phoneTwo: json['phone_2'] as String? ?? null,
      avatar: json['avatar'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      editTags: json['edit_tags'] as bool? ?? false,
      self: json['self'] as bool,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'staff_position': instance.staffPosition,
      'email': instance.email,
      'phone_1': instance.phoneOne,
      'phone_2': instance.phoneTwo,
      'avatar': instance.avatar,
      'tags': instance.tags,
      'edit_tags': instance.editTags,
      'self': instance.self,
    };

_$TagUserImpl _$$TagUserImplFromJson(Map<String, dynamic> json) =>
    _$TagUserImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TagUserImplToJson(_$TagUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
