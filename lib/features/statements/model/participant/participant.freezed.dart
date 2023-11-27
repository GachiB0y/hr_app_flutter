// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParticipantEntity _$ParticipantEntityFromJson(Map<String, dynamic> json) {
  return _ParticipantEntity.fromJson(json);
}

/// @nodoc
mixin _$ParticipantEntity {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  String get patronymic => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantEntityCopyWith<ParticipantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantEntityCopyWith<$Res> {
  factory $ParticipantEntityCopyWith(
          ParticipantEntity value, $Res Function(ParticipantEntity) then) =
      _$ParticipantEntityCopyWithImpl<$Res, ParticipantEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'first_name') String firstName,
      String patronymic,
      String id,
      String position});
}

/// @nodoc
class _$ParticipantEntityCopyWithImpl<$Res, $Val extends ParticipantEntity>
    implements $ParticipantEntityCopyWith<$Res> {
  _$ParticipantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? patronymic = null,
    Object? id = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParticipantEntityCopyWith<$Res>
    implements $ParticipantEntityCopyWith<$Res> {
  factory _$$_ParticipantEntityCopyWith(_$_ParticipantEntity value,
          $Res Function(_$_ParticipantEntity) then) =
      __$$_ParticipantEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'first_name') String firstName,
      String patronymic,
      String id,
      String position});
}

/// @nodoc
class __$$_ParticipantEntityCopyWithImpl<$Res>
    extends _$ParticipantEntityCopyWithImpl<$Res, _$_ParticipantEntity>
    implements _$$_ParticipantEntityCopyWith<$Res> {
  __$$_ParticipantEntityCopyWithImpl(
      _$_ParticipantEntity _value, $Res Function(_$_ParticipantEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? patronymic = null,
    Object? id = null,
    Object? position = null,
  }) {
    return _then(_$_ParticipantEntity(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipantEntity implements _ParticipantEntity {
  const _$_ParticipantEntity(
      {@JsonKey(name: 'document_type') required this.documentType,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'first_name') required this.firstName,
      required this.patronymic,
      required this.id,
      required this.position});

  factory _$_ParticipantEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipantEntityFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final String patronymic;
  @override
  final String id;
  @override
  final String position;

  @override
  String toString() {
    return 'ParticipantEntity(documentType: $documentType, lastName: $lastName, firstName: $firstName, patronymic: $patronymic, id: $id, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParticipantEntity &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, documentType, lastName, firstName, patronymic, id, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParticipantEntityCopyWith<_$_ParticipantEntity> get copyWith =>
      __$$_ParticipantEntityCopyWithImpl<_$_ParticipantEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipantEntityToJson(
      this,
    );
  }
}

abstract class _ParticipantEntity implements ParticipantEntity {
  const factory _ParticipantEntity(
      {@JsonKey(name: 'document_type') required final String documentType,
      @JsonKey(name: 'last_name') required final String lastName,
      @JsonKey(name: 'first_name') required final String firstName,
      required final String patronymic,
      required final String id,
      required final String position}) = _$_ParticipantEntity;

  factory _ParticipantEntity.fromJson(Map<String, dynamic> json) =
      _$_ParticipantEntity.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  String get patronymic;
  @override
  String get id;
  @override
  String get position;
  @override
  @JsonKey(ignore: true)
  _$$_ParticipantEntityCopyWith<_$_ParticipantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
