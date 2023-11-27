// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required int id,
    required String name,
    required Permissions permissions,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Permissions with _$Permissions {
  const factory Permissions({
    @JsonKey(name: 'create_service') required bool createService,
    @JsonKey(name: 'update_service') required bool updateService,
    @JsonKey(name: 'delete_service') required bool deleteService,
    @JsonKey(name: 'approve_service') required bool approveService,
  }) = _Permissions;

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}
