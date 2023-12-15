// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParticipantEntity _$$_ParticipantEntityFromJson(Map<String, dynamic> json) =>
    _$_ParticipantEntity(
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      patronymic: json['patronymic'] as String,
      id: json['id'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$$_ParticipantEntityToJson(
        _$_ParticipantEntity instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'patronymic': instance.patronymic,
      'id': instance.id,
      'position': instance.position,
    };
