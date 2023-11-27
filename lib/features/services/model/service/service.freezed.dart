// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Permissions get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call({int id, String name, Permissions permissions});

  $PermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permissions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionsCopyWith<$Res> get permissions {
    return $PermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$_ServiceCopyWith(
          _$_Service value, $Res Function(_$_Service) then) =
      __$$_ServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Permissions permissions});

  @override
  $PermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$_ServiceCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$_Service>
    implements _$$_ServiceCopyWith<$Res> {
  __$$_ServiceCopyWithImpl(_$_Service _value, $Res Function(_$_Service) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permissions = null,
  }) {
    return _then(_$_Service(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Service implements _Service {
  const _$_Service(
      {required this.id, required this.name, required this.permissions});

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final Permissions permissions;

  @override
  String toString() {
    return 'Service(id: $id, name: $name, permissions: $permissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Service &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, permissions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      __$$_ServiceCopyWithImpl<_$_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final int id,
      required final String name,
      required final Permissions permissions}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  Permissions get permissions;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      throw _privateConstructorUsedError;
}

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return _Permissions.fromJson(json);
}

/// @nodoc
mixin _$Permissions {
  @JsonKey(name: 'create_service')
  bool get createService => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_service')
  bool get updateService => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_service')
  bool get deleteService => throw _privateConstructorUsedError;
  @JsonKey(name: 'approve_service')
  bool get approveService => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionsCopyWith<Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsCopyWith<$Res> {
  factory $PermissionsCopyWith(
          Permissions value, $Res Function(Permissions) then) =
      _$PermissionsCopyWithImpl<$Res, Permissions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'create_service') bool createService,
      @JsonKey(name: 'update_service') bool updateService,
      @JsonKey(name: 'delete_service') bool deleteService,
      @JsonKey(name: 'approve_service') bool approveService});
}

/// @nodoc
class _$PermissionsCopyWithImpl<$Res, $Val extends Permissions>
    implements $PermissionsCopyWith<$Res> {
  _$PermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createService = null,
    Object? updateService = null,
    Object? deleteService = null,
    Object? approveService = null,
  }) {
    return _then(_value.copyWith(
      createService: null == createService
          ? _value.createService
          : createService // ignore: cast_nullable_to_non_nullable
              as bool,
      updateService: null == updateService
          ? _value.updateService
          : updateService // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteService: null == deleteService
          ? _value.deleteService
          : deleteService // ignore: cast_nullable_to_non_nullable
              as bool,
      approveService: null == approveService
          ? _value.approveService
          : approveService // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionsCopyWith<$Res>
    implements $PermissionsCopyWith<$Res> {
  factory _$$_PermissionsCopyWith(
          _$_Permissions value, $Res Function(_$_Permissions) then) =
      __$$_PermissionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'create_service') bool createService,
      @JsonKey(name: 'update_service') bool updateService,
      @JsonKey(name: 'delete_service') bool deleteService,
      @JsonKey(name: 'approve_service') bool approveService});
}

/// @nodoc
class __$$_PermissionsCopyWithImpl<$Res>
    extends _$PermissionsCopyWithImpl<$Res, _$_Permissions>
    implements _$$_PermissionsCopyWith<$Res> {
  __$$_PermissionsCopyWithImpl(
      _$_Permissions _value, $Res Function(_$_Permissions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createService = null,
    Object? updateService = null,
    Object? deleteService = null,
    Object? approveService = null,
  }) {
    return _then(_$_Permissions(
      createService: null == createService
          ? _value.createService
          : createService // ignore: cast_nullable_to_non_nullable
              as bool,
      updateService: null == updateService
          ? _value.updateService
          : updateService // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteService: null == deleteService
          ? _value.deleteService
          : deleteService // ignore: cast_nullable_to_non_nullable
              as bool,
      approveService: null == approveService
          ? _value.approveService
          : approveService // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Permissions implements _Permissions {
  const _$_Permissions(
      {@JsonKey(name: 'create_service') required this.createService,
      @JsonKey(name: 'update_service') required this.updateService,
      @JsonKey(name: 'delete_service') required this.deleteService,
      @JsonKey(name: 'approve_service') required this.approveService});

  factory _$_Permissions.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionsFromJson(json);

  @override
  @JsonKey(name: 'create_service')
  final bool createService;
  @override
  @JsonKey(name: 'update_service')
  final bool updateService;
  @override
  @JsonKey(name: 'delete_service')
  final bool deleteService;
  @override
  @JsonKey(name: 'approve_service')
  final bool approveService;

  @override
  String toString() {
    return 'Permissions(createService: $createService, updateService: $updateService, deleteService: $deleteService, approveService: $approveService)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Permissions &&
            (identical(other.createService, createService) ||
                other.createService == createService) &&
            (identical(other.updateService, updateService) ||
                other.updateService == updateService) &&
            (identical(other.deleteService, deleteService) ||
                other.deleteService == deleteService) &&
            (identical(other.approveService, approveService) ||
                other.approveService == approveService));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createService, updateService, deleteService, approveService);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      __$$_PermissionsCopyWithImpl<_$_Permissions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionsToJson(
      this,
    );
  }
}

abstract class _Permissions implements Permissions {
  const factory _Permissions(
      {@JsonKey(name: 'create_service') required final bool createService,
      @JsonKey(name: 'update_service') required final bool updateService,
      @JsonKey(name: 'delete_service') required final bool deleteService,
      @JsonKey(name: 'approve_service')
      required final bool approveService}) = _$_Permissions;

  factory _Permissions.fromJson(Map<String, dynamic> json) =
      _$_Permissions.fromJson;

  @override
  @JsonKey(name: 'create_service')
  bool get createService;
  @override
  @JsonKey(name: 'update_service')
  bool get updateService;
  @override
  @JsonKey(name: 'delete_service')
  bool get deleteService;
  @override
  @JsonKey(name: 'approve_service')
  bool get approveService;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}
