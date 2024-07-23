// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rookies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rookies _$RookiesFromJson(Map<String, dynamic> json) {
  return _Rookies.fromJson(json);
}

/// @nodoc
mixin _$Rookies {
  int get count => throw _privateConstructorUsedError;
  List<OneRookiesInfo> get rookies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RookiesCopyWith<Rookies> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RookiesCopyWith<$Res> {
  factory $RookiesCopyWith(Rookies value, $Res Function(Rookies) then) =
      _$RookiesCopyWithImpl<$Res, Rookies>;
  @useResult
  $Res call({int count, List<OneRookiesInfo> rookies});
}

/// @nodoc
class _$RookiesCopyWithImpl<$Res, $Val extends Rookies>
    implements $RookiesCopyWith<$Res> {
  _$RookiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? rookies = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      rookies: null == rookies
          ? _value.rookies
          : rookies // ignore: cast_nullable_to_non_nullable
              as List<OneRookiesInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RookiesImplCopyWith<$Res> implements $RookiesCopyWith<$Res> {
  factory _$$RookiesImplCopyWith(
          _$RookiesImpl value, $Res Function(_$RookiesImpl) then) =
      __$$RookiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<OneRookiesInfo> rookies});
}

/// @nodoc
class __$$RookiesImplCopyWithImpl<$Res>
    extends _$RookiesCopyWithImpl<$Res, _$RookiesImpl>
    implements _$$RookiesImplCopyWith<$Res> {
  __$$RookiesImplCopyWithImpl(
      _$RookiesImpl _value, $Res Function(_$RookiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? rookies = null,
  }) {
    return _then(_$RookiesImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      rookies: null == rookies
          ? _value._rookies
          : rookies // ignore: cast_nullable_to_non_nullable
              as List<OneRookiesInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RookiesImpl implements _Rookies {
  const _$RookiesImpl(
      {required this.count, required final List<OneRookiesInfo> rookies})
      : _rookies = rookies;

  factory _$RookiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RookiesImplFromJson(json);

  @override
  final int count;
  final List<OneRookiesInfo> _rookies;
  @override
  List<OneRookiesInfo> get rookies {
    if (_rookies is EqualUnmodifiableListView) return _rookies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rookies);
  }

  @override
  String toString() {
    return 'Rookies(count: $count, rookies: $rookies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RookiesImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._rookies, _rookies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_rookies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RookiesImplCopyWith<_$RookiesImpl> get copyWith =>
      __$$RookiesImplCopyWithImpl<_$RookiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RookiesImplToJson(
      this,
    );
  }
}

abstract class _Rookies implements Rookies {
  const factory _Rookies(
      {required final int count,
      required final List<OneRookiesInfo> rookies}) = _$RookiesImpl;

  factory _Rookies.fromJson(Map<String, dynamic> json) = _$RookiesImpl.fromJson;

  @override
  int get count;
  @override
  List<OneRookiesInfo> get rookies;
  @override
  @JsonKey(ignore: true)
  _$$RookiesImplCopyWith<_$RookiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OneRookiesInfo _$OneRookiesInfoFromJson(Map<String, dynamic> json) {
  return _OneRookiesInfo.fromJson(json);
}

/// @nodoc
mixin _$OneRookiesInfo {
  @JsonKey(name: 'auto_card')
  int get autoCard => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_i')
  String get nameI => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_o')
  String get nameO => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_birth')
  String get dateBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String get joinDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_position')
  String get staffPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OneRookiesInfoCopyWith<OneRookiesInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneRookiesInfoCopyWith<$Res> {
  factory $OneRookiesInfoCopyWith(
          OneRookiesInfo value, $Res Function(OneRookiesInfo) then) =
      _$OneRookiesInfoCopyWithImpl<$Res, OneRookiesInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String dateBirth,
      @JsonKey(name: 'join_date') String joinDate,
      @JsonKey(name: 'staff_position') String staffPosition});
}

/// @nodoc
class _$OneRookiesInfoCopyWithImpl<$Res, $Val extends OneRookiesInfo>
    implements $OneRookiesInfoCopyWith<$Res> {
  _$OneRookiesInfoCopyWithImpl(this._value, this._then);

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
    Object? joinDate = null,
    Object? staffPosition = null,
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
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      staffPosition: null == staffPosition
          ? _value.staffPosition
          : staffPosition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneRookiesInfoImplCopyWith<$Res>
    implements $OneRookiesInfoCopyWith<$Res> {
  factory _$$OneRookiesInfoImplCopyWith(_$OneRookiesInfoImpl value,
          $Res Function(_$OneRookiesInfoImpl) then) =
      __$$OneRookiesInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String dateBirth,
      @JsonKey(name: 'join_date') String joinDate,
      @JsonKey(name: 'staff_position') String staffPosition});
}

/// @nodoc
class __$$OneRookiesInfoImplCopyWithImpl<$Res>
    extends _$OneRookiesInfoCopyWithImpl<$Res, _$OneRookiesInfoImpl>
    implements _$$OneRookiesInfoImplCopyWith<$Res> {
  __$$OneRookiesInfoImplCopyWithImpl(
      _$OneRookiesInfoImpl _value, $Res Function(_$OneRookiesInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoCard = null,
    Object? name = null,
    Object? nameI = null,
    Object? nameO = null,
    Object? dateBirth = null,
    Object? joinDate = null,
    Object? staffPosition = null,
  }) {
    return _then(_$OneRookiesInfoImpl(
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
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      staffPosition: null == staffPosition
          ? _value.staffPosition
          : staffPosition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OneRookiesInfoImpl implements _OneRookiesInfo {
  const _$OneRookiesInfoImpl(
      {@JsonKey(name: 'auto_card') required this.autoCard,
      required this.name,
      @JsonKey(name: 'name_i') required this.nameI,
      @JsonKey(name: 'name_o') required this.nameO,
      @JsonKey(name: 'date_birth') required this.dateBirth,
      @JsonKey(name: 'join_date') required this.joinDate,
      @JsonKey(name: 'staff_position') required this.staffPosition});

  factory _$OneRookiesInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneRookiesInfoImplFromJson(json);

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
  @JsonKey(name: 'join_date')
  final String joinDate;
  @override
  @JsonKey(name: 'staff_position')
  final String staffPosition;

  @override
  String toString() {
    return 'OneRookiesInfo(autoCard: $autoCard, name: $name, nameI: $nameI, nameO: $nameO, dateBirth: $dateBirth, joinDate: $joinDate, staffPosition: $staffPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneRookiesInfoImpl &&
            (identical(other.autoCard, autoCard) ||
                other.autoCard == autoCard) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameI, nameI) || other.nameI == nameI) &&
            (identical(other.nameO, nameO) || other.nameO == nameO) &&
            (identical(other.dateBirth, dateBirth) ||
                other.dateBirth == dateBirth) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.staffPosition, staffPosition) ||
                other.staffPosition == staffPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, autoCard, name, nameI, nameO,
      dateBirth, joinDate, staffPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneRookiesInfoImplCopyWith<_$OneRookiesInfoImpl> get copyWith =>
      __$$OneRookiesInfoImplCopyWithImpl<_$OneRookiesInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OneRookiesInfoImplToJson(
      this,
    );
  }
}

abstract class _OneRookiesInfo implements OneRookiesInfo {
  const factory _OneRookiesInfo(
      {@JsonKey(name: 'auto_card') required final int autoCard,
      required final String name,
      @JsonKey(name: 'name_i') required final String nameI,
      @JsonKey(name: 'name_o') required final String nameO,
      @JsonKey(name: 'date_birth') required final String dateBirth,
      @JsonKey(name: 'join_date') required final String joinDate,
      @JsonKey(name: 'staff_position')
      required final String staffPosition}) = _$OneRookiesInfoImpl;

  factory _OneRookiesInfo.fromJson(Map<String, dynamic> json) =
      _$OneRookiesInfoImpl.fromJson;

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
  @JsonKey(name: 'join_date')
  String get joinDate;
  @override
  @JsonKey(name: 'staff_position')
  String get staffPosition;
  @override
  @JsonKey(ignore: true)
  _$$OneRookiesInfoImplCopyWith<_$OneRookiesInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
