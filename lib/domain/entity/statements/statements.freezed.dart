// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatementEntity _$StatementEntityFromJson(Map<String, dynamic> json) {
  return _StatementEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<StatementFieldEntity> get templateFields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementEntityCopyWith<StatementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementEntityCopyWith<$Res> {
  factory $StatementEntityCopyWith(
          StatementEntity value, $Res Function(StatementEntity) then) =
      _$StatementEntityCopyWithImpl<$Res, StatementEntity>;
  @useResult
  $Res call(
      {String id, String name, List<StatementFieldEntity> templateFields});
}

/// @nodoc
class _$StatementEntityCopyWithImpl<$Res, $Val extends StatementEntity>
    implements $StatementEntityCopyWith<$Res> {
  _$StatementEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? templateFields = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      templateFields: null == templateFields
          ? _value.templateFields
          : templateFields // ignore: cast_nullable_to_non_nullable
              as List<StatementFieldEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatementEntityCopyWith<$Res>
    implements $StatementEntityCopyWith<$Res> {
  factory _$$_StatementEntityCopyWith(
          _$_StatementEntity value, $Res Function(_$_StatementEntity) then) =
      __$$_StatementEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, List<StatementFieldEntity> templateFields});
}

/// @nodoc
class __$$_StatementEntityCopyWithImpl<$Res>
    extends _$StatementEntityCopyWithImpl<$Res, _$_StatementEntity>
    implements _$$_StatementEntityCopyWith<$Res> {
  __$$_StatementEntityCopyWithImpl(
      _$_StatementEntity _value, $Res Function(_$_StatementEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? templateFields = null,
  }) {
    return _then(_$_StatementEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      templateFields: null == templateFields
          ? _value._templateFields
          : templateFields // ignore: cast_nullable_to_non_nullable
              as List<StatementFieldEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementEntity implements _StatementEntity {
  const _$_StatementEntity(
      {required this.id,
      required this.name,
      required final List<StatementFieldEntity> templateFields})
      : _templateFields = templateFields;

  factory _$_StatementEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<StatementFieldEntity> _templateFields;
  @override
  List<StatementFieldEntity> get templateFields {
    if (_templateFields is EqualUnmodifiableListView) return _templateFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templateFields);
  }

  @override
  String toString() {
    return 'StatementEntity(id: $id, name: $name, templateFields: $templateFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._templateFields, _templateFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_templateFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementEntityCopyWith<_$_StatementEntity> get copyWith =>
      __$$_StatementEntityCopyWithImpl<_$_StatementEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementEntityToJson(
      this,
    );
  }
}

abstract class _StatementEntity implements StatementEntity {
  const factory _StatementEntity(
          {required final String id,
          required final String name,
          required final List<StatementFieldEntity> templateFields}) =
      _$_StatementEntity;

  factory _StatementEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementEntity.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<StatementFieldEntity> get templateFields;
  @override
  @JsonKey(ignore: true)
  _$$_StatementEntityCopyWith<_$_StatementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

StatementFieldEntity _$StatementFieldEntityFromJson(Map<String, dynamic> json) {
  return _StatementFieldEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementFieldEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFieldEntityCopyWith<StatementFieldEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFieldEntityCopyWith<$Res> {
  factory $StatementFieldEntityCopyWith(StatementFieldEntity value,
          $Res Function(StatementFieldEntity) then) =
      _$StatementFieldEntityCopyWithImpl<$Res, StatementFieldEntity>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$StatementFieldEntityCopyWithImpl<$Res,
        $Val extends StatementFieldEntity>
    implements $StatementFieldEntityCopyWith<$Res> {
  _$StatementFieldEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatementFieldEntityCopyWith<$Res>
    implements $StatementFieldEntityCopyWith<$Res> {
  factory _$$_StatementFieldEntityCopyWith(_$_StatementFieldEntity value,
          $Res Function(_$_StatementFieldEntity) then) =
      __$$_StatementFieldEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_StatementFieldEntityCopyWithImpl<$Res>
    extends _$StatementFieldEntityCopyWithImpl<$Res, _$_StatementFieldEntity>
    implements _$$_StatementFieldEntityCopyWith<$Res> {
  __$$_StatementFieldEntityCopyWithImpl(_$_StatementFieldEntity _value,
      $Res Function(_$_StatementFieldEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_StatementFieldEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementFieldEntity implements _StatementFieldEntity {
  const _$_StatementFieldEntity({required this.id, required this.name});

  factory _$_StatementFieldEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFieldEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'StatementFieldEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFieldEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementFieldEntityCopyWith<_$_StatementFieldEntity> get copyWith =>
      __$$_StatementFieldEntityCopyWithImpl<_$_StatementFieldEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFieldEntityToJson(
      this,
    );
  }
}

abstract class _StatementFieldEntity implements StatementFieldEntity {
  const factory _StatementFieldEntity(
      {required final String id,
      required final String name}) = _$_StatementFieldEntity;

  factory _StatementFieldEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementFieldEntity.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFieldEntityCopyWith<_$_StatementFieldEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
