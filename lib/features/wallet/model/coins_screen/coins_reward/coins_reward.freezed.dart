// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coins_reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinsReward _$CoinsRewardFromJson(Map<String, dynamic> json) {
  return _CoinsReward.fromJson(json);
}

/// @nodoc
mixin _$CoinsReward {
  int get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinsRewardCopyWith<CoinsReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinsRewardCopyWith<$Res> {
  factory $CoinsRewardCopyWith(
          CoinsReward value, $Res Function(CoinsReward) then) =
      _$CoinsRewardCopyWithImpl<$Res, CoinsReward>;
  @useResult
  $Res call(
      {int id, int price, String title, String? image, String? description});
}

/// @nodoc
class _$CoinsRewardCopyWithImpl<$Res, $Val extends CoinsReward>
    implements $CoinsRewardCopyWith<$Res> {
  _$CoinsRewardCopyWithImpl(this._value, this._then);

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
    Object? image = freezed,
    Object? description = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinsRewardImplCopyWith<$Res>
    implements $CoinsRewardCopyWith<$Res> {
  factory _$$CoinsRewardImplCopyWith(
          _$CoinsRewardImpl value, $Res Function(_$CoinsRewardImpl) then) =
      __$$CoinsRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int price, String title, String? image, String? description});
}

/// @nodoc
class __$$CoinsRewardImplCopyWithImpl<$Res>
    extends _$CoinsRewardCopyWithImpl<$Res, _$CoinsRewardImpl>
    implements _$$CoinsRewardImplCopyWith<$Res> {
  __$$CoinsRewardImplCopyWithImpl(
      _$CoinsRewardImpl _value, $Res Function(_$CoinsRewardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? title = null,
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CoinsRewardImpl(
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinsRewardImpl implements _CoinsReward {
  const _$CoinsRewardImpl(
      {required this.id,
      required this.price,
      required this.title,
      this.image,
      this.description});

  factory _$CoinsRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinsRewardImplFromJson(json);

  @override
  final int id;
  @override
  final int price;
  @override
  final String title;
  @override
  final String? image;
  @override
  final String? description;

  @override
  String toString() {
    return 'CoinsReward(id: $id, price: $price, title: $title, image: $image, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinsRewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, title, image, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinsRewardImplCopyWith<_$CoinsRewardImpl> get copyWith =>
      __$$CoinsRewardImplCopyWithImpl<_$CoinsRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinsRewardImplToJson(
      this,
    );
  }
}

abstract class _CoinsReward implements CoinsReward {
  const factory _CoinsReward(
      {required final int id,
      required final int price,
      required final String title,
      final String? image,
      final String? description}) = _$CoinsRewardImpl;

  factory _CoinsReward.fromJson(Map<String, dynamic> json) =
      _$CoinsRewardImpl.fromJson;

  @override
  int get id;
  @override
  int get price;
  @override
  String get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CoinsRewardImplCopyWith<_$CoinsRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
