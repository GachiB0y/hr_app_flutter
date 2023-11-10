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

StatementFormInfo _$StatementFormInfoFromJson(Map<String, dynamic> json) {
  return _StatementFormInfo.fromJson(json);
}

/// @nodoc
mixin _$StatementFormInfo {
  String get templateId => throw _privateConstructorUsedError;
  ParticipantsFrom get participantsFrom => throw _privateConstructorUsedError;
  String get participantsTo => throw _privateConstructorUsedError;
  List<TemplateField> get templateFields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFormInfoCopyWith<StatementFormInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFormInfoCopyWith<$Res> {
  factory $StatementFormInfoCopyWith(
          StatementFormInfo value, $Res Function(StatementFormInfo) then) =
      _$StatementFormInfoCopyWithImpl<$Res, StatementFormInfo>;
  @useResult
  $Res call(
      {String templateId,
      ParticipantsFrom participantsFrom,
      String participantsTo,
      List<TemplateField> templateFields});

  $ParticipantsFromCopyWith<$Res> get participantsFrom;
}

/// @nodoc
class _$StatementFormInfoCopyWithImpl<$Res, $Val extends StatementFormInfo>
    implements $StatementFormInfoCopyWith<$Res> {
  _$StatementFormInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? participantsFrom = null,
    Object? participantsTo = null,
    Object? templateFields = null,
  }) {
    return _then(_value.copyWith(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      participantsFrom: null == participantsFrom
          ? _value.participantsFrom
          : participantsFrom // ignore: cast_nullable_to_non_nullable
              as ParticipantsFrom,
      participantsTo: null == participantsTo
          ? _value.participantsTo
          : participantsTo // ignore: cast_nullable_to_non_nullable
              as String,
      templateFields: null == templateFields
          ? _value.templateFields
          : templateFields // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParticipantsFromCopyWith<$Res> get participantsFrom {
    return $ParticipantsFromCopyWith<$Res>(_value.participantsFrom, (value) {
      return _then(_value.copyWith(participantsFrom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StatementFormInfoCopyWith<$Res>
    implements $StatementFormInfoCopyWith<$Res> {
  factory _$$_StatementFormInfoCopyWith(_$_StatementFormInfo value,
          $Res Function(_$_StatementFormInfo) then) =
      __$$_StatementFormInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String templateId,
      ParticipantsFrom participantsFrom,
      String participantsTo,
      List<TemplateField> templateFields});

  @override
  $ParticipantsFromCopyWith<$Res> get participantsFrom;
}

/// @nodoc
class __$$_StatementFormInfoCopyWithImpl<$Res>
    extends _$StatementFormInfoCopyWithImpl<$Res, _$_StatementFormInfo>
    implements _$$_StatementFormInfoCopyWith<$Res> {
  __$$_StatementFormInfoCopyWithImpl(
      _$_StatementFormInfo _value, $Res Function(_$_StatementFormInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? participantsFrom = null,
    Object? participantsTo = null,
    Object? templateFields = null,
  }) {
    return _then(_$_StatementFormInfo(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      participantsFrom: null == participantsFrom
          ? _value.participantsFrom
          : participantsFrom // ignore: cast_nullable_to_non_nullable
              as ParticipantsFrom,
      participantsTo: null == participantsTo
          ? _value.participantsTo
          : participantsTo // ignore: cast_nullable_to_non_nullable
              as String,
      templateFields: null == templateFields
          ? _value._templateFields
          : templateFields // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementFormInfo implements _StatementFormInfo {
  const _$_StatementFormInfo(
      {required this.templateId,
      required this.participantsFrom,
      required this.participantsTo,
      required final List<TemplateField> templateFields})
      : _templateFields = templateFields;

  factory _$_StatementFormInfo.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFormInfoFromJson(json);

  @override
  final String templateId;
  @override
  final ParticipantsFrom participantsFrom;
  @override
  final String participantsTo;
  final List<TemplateField> _templateFields;
  @override
  List<TemplateField> get templateFields {
    if (_templateFields is EqualUnmodifiableListView) return _templateFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templateFields);
  }

  @override
  String toString() {
    return 'StatementFormInfo(templateId: $templateId, participantsFrom: $participantsFrom, participantsTo: $participantsTo, templateFields: $templateFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFormInfo &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.participantsFrom, participantsFrom) ||
                other.participantsFrom == participantsFrom) &&
            (identical(other.participantsTo, participantsTo) ||
                other.participantsTo == participantsTo) &&
            const DeepCollectionEquality()
                .equals(other._templateFields, _templateFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, templateId, participantsFrom,
      participantsTo, const DeepCollectionEquality().hash(_templateFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementFormInfoCopyWith<_$_StatementFormInfo> get copyWith =>
      __$$_StatementFormInfoCopyWithImpl<_$_StatementFormInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFormInfoToJson(
      this,
    );
  }
}

abstract class _StatementFormInfo implements StatementFormInfo {
  const factory _StatementFormInfo(
          {required final String templateId,
          required final ParticipantsFrom participantsFrom,
          required final String participantsTo,
          required final List<TemplateField> templateFields}) =
      _$_StatementFormInfo;

  factory _StatementFormInfo.fromJson(Map<String, dynamic> json) =
      _$_StatementFormInfo.fromJson;

  @override
  String get templateId;
  @override
  ParticipantsFrom get participantsFrom;
  @override
  String get participantsTo;
  @override
  List<TemplateField> get templateFields;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFormInfoCopyWith<_$_StatementFormInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantsFrom _$ParticipantsFromFromJson(Map<String, dynamic> json) {
  return _ParticipantsFrom.fromJson(json);
}

/// @nodoc
mixin _$ParticipantsFrom {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get patronymic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantsFromCopyWith<ParticipantsFrom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantsFromCopyWith<$Res> {
  factory $ParticipantsFromCopyWith(
          ParticipantsFrom value, $Res Function(ParticipantsFrom) then) =
      _$ParticipantsFromCopyWithImpl<$Res, ParticipantsFrom>;
  @useResult
  $Res call({String firstName, String lastName, String patronymic});
}

/// @nodoc
class _$ParticipantsFromCopyWithImpl<$Res, $Val extends ParticipantsFrom>
    implements $ParticipantsFromCopyWith<$Res> {
  _$ParticipantsFromCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? patronymic = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParticipantsFromCopyWith<$Res>
    implements $ParticipantsFromCopyWith<$Res> {
  factory _$$_ParticipantsFromCopyWith(
          _$_ParticipantsFrom value, $Res Function(_$_ParticipantsFrom) then) =
      __$$_ParticipantsFromCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String patronymic});
}

/// @nodoc
class __$$_ParticipantsFromCopyWithImpl<$Res>
    extends _$ParticipantsFromCopyWithImpl<$Res, _$_ParticipantsFrom>
    implements _$$_ParticipantsFromCopyWith<$Res> {
  __$$_ParticipantsFromCopyWithImpl(
      _$_ParticipantsFrom _value, $Res Function(_$_ParticipantsFrom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? patronymic = null,
  }) {
    return _then(_$_ParticipantsFrom(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipantsFrom implements _ParticipantsFrom {
  const _$_ParticipantsFrom(
      {required this.firstName,
      required this.lastName,
      required this.patronymic});

  factory _$_ParticipantsFrom.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipantsFromFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String patronymic;

  @override
  String toString() {
    return 'ParticipantsFrom(firstName: $firstName, lastName: $lastName, patronymic: $patronymic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParticipantsFrom &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, patronymic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParticipantsFromCopyWith<_$_ParticipantsFrom> get copyWith =>
      __$$_ParticipantsFromCopyWithImpl<_$_ParticipantsFrom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipantsFromToJson(
      this,
    );
  }
}

abstract class _ParticipantsFrom implements ParticipantsFrom {
  const factory _ParticipantsFrom(
      {required final String firstName,
      required final String lastName,
      required final String patronymic}) = _$_ParticipantsFrom;

  factory _ParticipantsFrom.fromJson(Map<String, dynamic> json) =
      _$_ParticipantsFrom.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get patronymic;
  @override
  @JsonKey(ignore: true)
  _$$_ParticipantsFromCopyWith<_$_ParticipantsFrom> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateField _$TemplateFieldFromJson(Map<String, dynamic> json) {
  return _TemplateField.fromJson(json);
}

/// @nodoc
mixin _$TemplateField {
  String get id => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateFieldCopyWith<TemplateField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateFieldCopyWith<$Res> {
  factory $TemplateFieldCopyWith(
          TemplateField value, $Res Function(TemplateField) then) =
      _$TemplateFieldCopyWithImpl<$Res, TemplateField>;
  @useResult
  $Res call({String id, String value});
}

/// @nodoc
class _$TemplateFieldCopyWithImpl<$Res, $Val extends TemplateField>
    implements $TemplateFieldCopyWith<$Res> {
  _$TemplateFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateFieldCopyWith<$Res>
    implements $TemplateFieldCopyWith<$Res> {
  factory _$$_TemplateFieldCopyWith(
          _$_TemplateField value, $Res Function(_$_TemplateField) then) =
      __$$_TemplateFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String value});
}

/// @nodoc
class __$$_TemplateFieldCopyWithImpl<$Res>
    extends _$TemplateFieldCopyWithImpl<$Res, _$_TemplateField>
    implements _$$_TemplateFieldCopyWith<$Res> {
  __$$_TemplateFieldCopyWithImpl(
      _$_TemplateField _value, $Res Function(_$_TemplateField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
  }) {
    return _then(_$_TemplateField(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateField implements _TemplateField {
  const _$_TemplateField({required this.id, required this.value});

  factory _$_TemplateField.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateFieldFromJson(json);

  @override
  final String id;
  @override
  final String value;

  @override
  String toString() {
    return 'TemplateField(id: $id, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateField &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateFieldCopyWith<_$_TemplateField> get copyWith =>
      __$$_TemplateFieldCopyWithImpl<_$_TemplateField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateFieldToJson(
      this,
    );
  }
}

abstract class _TemplateField implements TemplateField {
  const factory _TemplateField(
      {required final String id,
      required final String value}) = _$_TemplateField;

  factory _TemplateField.fromJson(Map<String, dynamic> json) =
      _$_TemplateField.fromJson;

  @override
  String get id;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateFieldCopyWith<_$_TemplateField> get copyWith =>
      throw _privateConstructorUsedError;
}
