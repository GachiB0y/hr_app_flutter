// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birth_day_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BirthDayInfoEntity _$BirthDayInfoEntityFromJson(Map<String, dynamic> json) {
  return _BirthDayInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$BirthDayInfoEntity {
  int get count => throw _privateConstructorUsedError;
  List<OneBirthDayInfo> get birthdays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BirthDayInfoEntityCopyWith<BirthDayInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthDayInfoEntityCopyWith<$Res> {
  factory $BirthDayInfoEntityCopyWith(
          BirthDayInfoEntity value, $Res Function(BirthDayInfoEntity) then) =
      _$BirthDayInfoEntityCopyWithImpl<$Res, BirthDayInfoEntity>;
  @useResult
  $Res call({int count, List<OneBirthDayInfo> birthdays});
}

/// @nodoc
class _$BirthDayInfoEntityCopyWithImpl<$Res, $Val extends BirthDayInfoEntity>
    implements $BirthDayInfoEntityCopyWith<$Res> {
  _$BirthDayInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? birthdays = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      birthdays: null == birthdays
          ? _value.birthdays
          : birthdays // ignore: cast_nullable_to_non_nullable
              as List<OneBirthDayInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BirthDayInfoEntityCopyWith<$Res>
    implements $BirthDayInfoEntityCopyWith<$Res> {
  factory _$$_BirthDayInfoEntityCopyWith(_$_BirthDayInfoEntity value,
          $Res Function(_$_BirthDayInfoEntity) then) =
      __$$_BirthDayInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<OneBirthDayInfo> birthdays});
}

/// @nodoc
class __$$_BirthDayInfoEntityCopyWithImpl<$Res>
    extends _$BirthDayInfoEntityCopyWithImpl<$Res, _$_BirthDayInfoEntity>
    implements _$$_BirthDayInfoEntityCopyWith<$Res> {
  __$$_BirthDayInfoEntityCopyWithImpl(
      _$_BirthDayInfoEntity _value, $Res Function(_$_BirthDayInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? birthdays = null,
  }) {
    return _then(_$_BirthDayInfoEntity(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      birthdays: null == birthdays
          ? _value._birthdays
          : birthdays // ignore: cast_nullable_to_non_nullable
              as List<OneBirthDayInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BirthDayInfoEntity implements _BirthDayInfoEntity {
  const _$_BirthDayInfoEntity(
      {required this.count, required final List<OneBirthDayInfo> birthdays})
      : _birthdays = birthdays;

  factory _$_BirthDayInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_BirthDayInfoEntityFromJson(json);

  @override
  final int count;
  final List<OneBirthDayInfo> _birthdays;
  @override
  List<OneBirthDayInfo> get birthdays {
    if (_birthdays is EqualUnmodifiableListView) return _birthdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_birthdays);
  }

  @override
  String toString() {
    return 'BirthDayInfoEntity(count: $count, birthdays: $birthdays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BirthDayInfoEntity &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._birthdays, _birthdays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_birthdays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BirthDayInfoEntityCopyWith<_$_BirthDayInfoEntity> get copyWith =>
      __$$_BirthDayInfoEntityCopyWithImpl<_$_BirthDayInfoEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BirthDayInfoEntityToJson(
      this,
    );
  }
}

abstract class _BirthDayInfoEntity implements BirthDayInfoEntity {
  const factory _BirthDayInfoEntity(
      {required final int count,
      required final List<OneBirthDayInfo> birthdays}) = _$_BirthDayInfoEntity;

  factory _BirthDayInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_BirthDayInfoEntity.fromJson;

  @override
  int get count;
  @override
  List<OneBirthDayInfo> get birthdays;
  @override
  @JsonKey(ignore: true)
  _$$_BirthDayInfoEntityCopyWith<_$_BirthDayInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

OneBirthDayInfo _$OneBirthDayInfoFromJson(Map<String, dynamic> json) {
  return _OneBirthDayInfo.fromJson(json);
}

/// @nodoc
mixin _$OneBirthDayInfo {
  @JsonKey(name: 'auto_card')
  int get autoCard => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_i')
  String get nameI => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_o')
  String get nameO => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_birth')
  String get dateBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OneBirthDayInfoCopyWith<OneBirthDayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneBirthDayInfoCopyWith<$Res> {
  factory $OneBirthDayInfoCopyWith(
          OneBirthDayInfo value, $Res Function(OneBirthDayInfo) then) =
      _$OneBirthDayInfoCopyWithImpl<$Res, OneBirthDayInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String dateBirth});
}

/// @nodoc
class _$OneBirthDayInfoCopyWithImpl<$Res, $Val extends OneBirthDayInfo>
    implements $OneBirthDayInfoCopyWith<$Res> {
  _$OneBirthDayInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoCard = null,
    Object? name = null,
    Object? nameI = null,
    Object? nameO = null,
    Object? dateBirth = null,
  }) {
    return _then(_value.copyWith(
      autoCard: null == autoCard
          ? _value.autoCard
          : autoCard // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameI: null == nameI
          ? _value.nameI
          : nameI // ignore: cast_nullable_to_non_nullable
              as String,
      nameO: null == nameO
          ? _value.nameO
          : nameO // ignore: cast_nullable_to_non_nullable
              as String,
      dateBirth: null == dateBirth
          ? _value.dateBirth
          : dateBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OneBirthDayInfoCopyWith<$Res>
    implements $OneBirthDayInfoCopyWith<$Res> {
  factory _$$_OneBirthDayInfoCopyWith(
          _$_OneBirthDayInfo value, $Res Function(_$_OneBirthDayInfo) then) =
      __$$_OneBirthDayInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String dateBirth});
}

/// @nodoc
class __$$_OneBirthDayInfoCopyWithImpl<$Res>
    extends _$OneBirthDayInfoCopyWithImpl<$Res, _$_OneBirthDayInfo>
    implements _$$_OneBirthDayInfoCopyWith<$Res> {
  __$$_OneBirthDayInfoCopyWithImpl(
      _$_OneBirthDayInfo _value, $Res Function(_$_OneBirthDayInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoCard = null,
    Object? name = null,
    Object? nameI = null,
    Object? nameO = null,
    Object? dateBirth = null,
  }) {
    return _then(_$_OneBirthDayInfo(
      autoCard: null == autoCard
          ? _value.autoCard
          : autoCard // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameI: null == nameI
          ? _value.nameI
          : nameI // ignore: cast_nullable_to_non_nullable
              as String,
      nameO: null == nameO
          ? _value.nameO
          : nameO // ignore: cast_nullable_to_non_nullable
              as String,
      dateBirth: null == dateBirth
          ? _value.dateBirth
          : dateBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OneBirthDayInfo implements _OneBirthDayInfo {
  const _$_OneBirthDayInfo(
      {@JsonKey(name: 'auto_card') required this.autoCard,
      required this.name,
      @JsonKey(name: 'name_i') required this.nameI,
      @JsonKey(name: 'name_o') required this.nameO,
      @JsonKey(name: 'date_birth') required this.dateBirth});

  factory _$_OneBirthDayInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OneBirthDayInfoFromJson(json);

  @override
  @JsonKey(name: 'auto_card')
  final int autoCard;
  @override
  final String name;
  @override
  @JsonKey(name: 'name_i')
  final String nameI;
  @override
  @JsonKey(name: 'name_o')
  final String nameO;
  @override
  @JsonKey(name: 'date_birth')
  final String dateBirth;

  @override
  String toString() {
    return 'OneBirthDayInfo(autoCard: $autoCard, name: $name, nameI: $nameI, nameO: $nameO, dateBirth: $dateBirth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OneBirthDayInfo &&
            (identical(other.autoCard, autoCard) ||
                other.autoCard == autoCard) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameI, nameI) || other.nameI == nameI) &&
            (identical(other.nameO, nameO) || other.nameO == nameO) &&
            (identical(other.dateBirth, dateBirth) ||
                other.dateBirth == dateBirth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, autoCard, name, nameI, nameO, dateBirth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OneBirthDayInfoCopyWith<_$_OneBirthDayInfo> get copyWith =>
      __$$_OneBirthDayInfoCopyWithImpl<_$_OneBirthDayInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OneBirthDayInfoToJson(
      this,
    );
  }
}

abstract class _OneBirthDayInfo implements OneBirthDayInfo {
  const factory _OneBirthDayInfo(
          {@JsonKey(name: 'auto_card') required final int autoCard,
          required final String name,
          @JsonKey(name: 'name_i') required final String nameI,
          @JsonKey(name: 'name_o') required final String nameO,
          @JsonKey(name: 'date_birth') required final String dateBirth}) =
      _$_OneBirthDayInfo;

  factory _OneBirthDayInfo.fromJson(Map<String, dynamic> json) =
      _$_OneBirthDayInfo.fromJson;

  @override
  @JsonKey(name: 'auto_card')
  int get autoCard;
  @override
  String get name;
  @override
  @JsonKey(name: 'name_i')
  String get nameI;
  @override
  @JsonKey(name: 'name_o')
  String get nameO;
  @override
  @JsonKey(name: 'date_birth')
  String get dateBirth;
  @override
  @JsonKey(ignore: true)
  _$$_OneBirthDayInfoCopyWith<_$_OneBirthDayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
