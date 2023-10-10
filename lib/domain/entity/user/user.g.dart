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
      dateBirth: json['date_birth'] as String,
      staffPosition: json['staff_position'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'auto_card': instance.autoCard,
      'name': instance.name,
      'name_i': instance.nameI,
      'name_o': instance.nameO,
      'date_birth': instance.dateBirth,
      'staff_position': instance.staffPosition,
      'email': instance.email,
    };
