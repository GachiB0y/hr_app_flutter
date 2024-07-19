// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permissions': instance.permissions,
    };

_$PermissionsImpl _$$PermissionsImplFromJson(Map<String, dynamic> json) =>
    _$PermissionsImpl(
      createService: json['create_service'] as bool,
      updateService: json['update_service'] as bool,
      deleteService: json['delete_service'] as bool,
      approveService: json['approve_service'] as bool,
    );

Map<String, dynamic> _$$PermissionsImplToJson(_$PermissionsImpl instance) =>
    <String, dynamic>{
      'create_service': instance.createService,
      'update_service': instance.updateService,
      'delete_service': instance.deleteService,
      'approve_service': instance.approveService,
    };
