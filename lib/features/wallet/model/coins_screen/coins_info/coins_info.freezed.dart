// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coins_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinsInfo _$CoinsInfoFromJson(Map<String, dynamic> json) {
  return _CoinsInfo.fromJson(json);
}

/// @nodoc
mixin _$CoinsInfo {
  int get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinsInfoCopyWith<CoinsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinsInfoCopyWith<$Res> {
  factory $CoinsInfoCopyWith(CoinsInfo value, $Res Function(CoinsInfo) then) =
      _$CoinsInfoCopyWithImpl<$Res, CoinsInfo>;
  @useResult
  $Res call({int id, int price, String title});
}

/// @nodoc
class _$CoinsInfoCopyWithImpl<$Res, $Val extends CoinsInfo>
    implements $CoinsInfoCopyWith<$Res> {
  _$CoinsInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinsInfoCopyWith<$Res> implements $CoinsInfoCopyWith<$Res> {
  factory _$$_CoinsInfoCopyWith(
          _$_CoinsInfo value, $Res Function(_$_CoinsInfo) then) =
      __$$_CoinsInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int price, String title});
}

/// @nodoc
class __$$_CoinsInfoCopyWithImpl<$Res>
    extends _$CoinsInfoCopyWithImpl<$Res, _$_CoinsInfo>
    implements _$$_CoinsInfoCopyWith<$Res> {
  __$$_CoinsInfoCopyWithImpl(
      _$_CoinsInfo _value, $Res Function(_$_CoinsInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_$_CoinsInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinsInfo implements _CoinsInfo {
  const _$_CoinsInfo(
      {required this.id, required this.price, required this.title});

  factory _$_CoinsInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CoinsInfoFromJson(json);

  @override
  final int id;
  @override
  final int price;
  @override
  final String title;

  @override
  String toString() {
    return 'CoinsInfo(id: $id, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinsInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinsInfoCopyWith<_$_CoinsInfo> get copyWith =>
      __$$_CoinsInfoCopyWithImpl<_$_CoinsInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinsInfoToJson(
      this,
    );
  }
}

abstract class _CoinsInfo implements CoinsInfo {
  const factory _CoinsInfo(
      {required final int id,
      required final int price,
      required final String title}) = _$_CoinsInfo;

  factory _CoinsInfo.fromJson(Map<String, dynamic> json) =
      _$_CoinsInfo.fromJson;

  @override
  int get id;
  @override
  int get price;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_CoinsInfoCopyWith<_$_CoinsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
