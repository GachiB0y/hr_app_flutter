// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParticipantEntity _$$_ParticipantEntityFromJson(Map<String, dynamic> json) =>
    _$_ParticipantEntity(
      documentType: json['document_type'] as String,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      patronymic: json['patronymic'] as String,
      id: json['id'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$$_ParticipantEntityToJson(
        _$_ParticipantEntity instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'patronymic': instance.patronymic,
      'id': instance.id,
      'position': instance.position,
    };
