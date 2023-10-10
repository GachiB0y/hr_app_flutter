// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as int,
      name: json['name'] as String,
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permissions': instance.permissions,
    };

_$_Permissions _$$_PermissionsFromJson(Map<String, dynamic> json) =>
    _$_Permissions(
      createService: json['create_service'] as bool,
      updateService: json['update_service'] as bool,
      deleteService: json['delete_service'] as bool,
      approveService: json['approve_service'] as bool,
    );

Map<String, dynamic> _$$_PermissionsToJson(_$_Permissions instance) =>
    <String, dynamic>{
      'create_service': instance.createService,
      'update_service': instance.updateService,
      'delete_service': instance.deleteService,
      'approve_service': instance.approveService,
    };
