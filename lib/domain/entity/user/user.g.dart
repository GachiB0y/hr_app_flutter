// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      autoCard: json['auto_card'] as int,
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
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
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
    };

_$_TagUser _$$_TagUserFromJson(Map<String, dynamic> json) => _$_TagUser(
      id: json['id'] as int? ?? null,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_TagUserToJson(_$_TagUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
