// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: 'auto_card')
  int get autoCard => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_i')
  String get nameI => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_o')
  String get nameO => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_birth')
  String? get dateBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_position')
  String get staffPosition => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_1')
  String? get phoneOne => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_2')
  String? get phoneTwo => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String get avatar => throw _privateConstructorUsedError;
  List<TagUser> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'edit_tags')
  bool get editTags => throw _privateConstructorUsedError;
  bool get self => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String? dateBirth,
      @JsonKey(name: 'staff_position') String staffPosition,
      String? email,
      @JsonKey(name: 'phone_1') String? phoneOne,
      @JsonKey(name: 'phone_2') String? phoneTwo,
      @JsonKey(name: 'avatar') String avatar,
      List<TagUser> tags,
      @JsonKey(name: 'edit_tags') bool editTags,
      bool self});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

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
    Object? dateBirth = freezed,
    Object? staffPosition = null,
    Object? email = freezed,
    Object? phoneOne = freezed,
    Object? phoneTwo = freezed,
    Object? avatar = null,
    Object? tags = null,
    Object? editTags = null,
    Object? self = null,
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
      dateBirth: freezed == dateBirth
          ? _value.dateBirth
          : dateBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPosition: null == staffPosition
          ? _value.staffPosition
          : staffPosition // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneOne: freezed == phoneOne
          ? _value.phoneOne
          : phoneOne // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneTwo: freezed == phoneTwo
          ? _value.phoneTwo
          : phoneTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUser>,
      editTags: null == editTags
          ? _value.editTags
          : editTags // ignore: cast_nullable_to_non_nullable
              as bool,
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_card') int autoCard,
      String name,
      @JsonKey(name: 'name_i') String nameI,
      @JsonKey(name: 'name_o') String nameO,
      @JsonKey(name: 'date_birth') String? dateBirth,
      @JsonKey(name: 'staff_position') String staffPosition,
      String? email,
      @JsonKey(name: 'phone_1') String? phoneOne,
      @JsonKey(name: 'phone_2') String? phoneTwo,
      @JsonKey(name: 'avatar') String avatar,
      List<TagUser> tags,
      @JsonKey(name: 'edit_tags') bool editTags,
      bool self});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoCard = null,
    Object? name = null,
    Object? nameI = null,
    Object? nameO = null,
    Object? dateBirth = freezed,
    Object? staffPosition = null,
    Object? email = freezed,
    Object? phoneOne = freezed,
    Object? phoneTwo = freezed,
    Object? avatar = null,
    Object? tags = null,
    Object? editTags = null,
    Object? self = null,
  }) {
    return _then(_$_UserInfo(
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
      dateBirth: freezed == dateBirth
          ? _value.dateBirth
          : dateBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPosition: null == staffPosition
          ? _value.staffPosition
          : staffPosition // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneOne: freezed == phoneOne
          ? _value.phoneOne
          : phoneOne // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneTwo: freezed == phoneTwo
          ? _value.phoneTwo
          : phoneTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUser>,
      editTags: null == editTags
          ? _value.editTags
          : editTags // ignore: cast_nullable_to_non_nullable
              as bool,
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {@JsonKey(name: 'auto_card') required this.autoCard,
      required this.name,
      @JsonKey(name: 'name_i') required this.nameI,
      @JsonKey(name: 'name_o') required this.nameO,
      @JsonKey(name: 'date_birth') this.dateBirth = null,
      @JsonKey(name: 'staff_position') required this.staffPosition,
      this.email = null,
      @JsonKey(name: 'phone_1') this.phoneOne = null,
      @JsonKey(name: 'phone_2') this.phoneTwo = null,
      @JsonKey(name: 'avatar') required this.avatar,
      required final List<TagUser> tags,
      @JsonKey(name: 'edit_tags') this.editTags = false,
      required this.self})
      : _tags = tags;

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

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
  final String? dateBirth;
  @override
  @JsonKey(name: 'staff_position')
  final String staffPosition;
  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey(name: 'phone_1')
  final String? phoneOne;
  @override
  @JsonKey(name: 'phone_2')
  final String? phoneTwo;
  @override
  @JsonKey(name: 'avatar')
  final String avatar;
  final List<TagUser> _tags;
  @override
  List<TagUser> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'edit_tags')
  final bool editTags;
  @override
  final bool self;

  @override
  String toString() {
    return 'UserInfo(autoCard: $autoCard, name: $name, nameI: $nameI, nameO: $nameO, dateBirth: $dateBirth, staffPosition: $staffPosition, email: $email, phoneOne: $phoneOne, phoneTwo: $phoneTwo, avatar: $avatar, tags: $tags, editTags: $editTags, self: $self)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.autoCard, autoCard) ||
                other.autoCard == autoCard) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameI, nameI) || other.nameI == nameI) &&
            (identical(other.nameO, nameO) || other.nameO == nameO) &&
            (identical(other.dateBirth, dateBirth) ||
                other.dateBirth == dateBirth) &&
            (identical(other.staffPosition, staffPosition) ||
                other.staffPosition == staffPosition) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneOne, phoneOne) ||
                other.phoneOne == phoneOne) &&
            (identical(other.phoneTwo, phoneTwo) ||
                other.phoneTwo == phoneTwo) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.editTags, editTags) ||
                other.editTags == editTags) &&
            (identical(other.self, self) || other.self == self));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      autoCard,
      name,
      nameI,
      nameO,
      dateBirth,
      staffPosition,
      email,
      phoneOne,
      phoneTwo,
      avatar,
      const DeepCollectionEquality().hash(_tags),
      editTags,
      self);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {@JsonKey(name: 'auto_card') required final int autoCard,
      required final String name,
      @JsonKey(name: 'name_i') required final String nameI,
      @JsonKey(name: 'name_o') required final String nameO,
      @JsonKey(name: 'date_birth') final String? dateBirth,
      @JsonKey(name: 'staff_position') required final String staffPosition,
      final String? email,
      @JsonKey(name: 'phone_1') final String? phoneOne,
      @JsonKey(name: 'phone_2') final String? phoneTwo,
      @JsonKey(name: 'avatar') required final String avatar,
      required final List<TagUser> tags,
      @JsonKey(name: 'edit_tags') final bool editTags,
      required final bool self}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

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
  String? get dateBirth;
  @override
  @JsonKey(name: 'staff_position')
  String get staffPosition;
  @override
  String? get email;
  @override
  @JsonKey(name: 'phone_1')
  String? get phoneOne;
  @override
  @JsonKey(name: 'phone_2')
  String? get phoneTwo;
  @override
  @JsonKey(name: 'avatar')
  String get avatar;
  @override
  List<TagUser> get tags;
  @override
  @JsonKey(name: 'edit_tags')
  bool get editTags;
  @override
  bool get self;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

TagUser _$TagUserFromJson(Map<String, dynamic> json) {
  return _TagUser.fromJson(json);
}

/// @nodoc
mixin _$TagUser {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagUserCopyWith<TagUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagUserCopyWith<$Res> {
  factory $TagUserCopyWith(TagUser value, $Res Function(TagUser) then) =
      _$TagUserCopyWithImpl<$Res, TagUser>;
  @useResult
  $Res call({int? id, String name});
}

/// @nodoc
class _$TagUserCopyWithImpl<$Res, $Val extends TagUser>
    implements $TagUserCopyWith<$Res> {
  _$TagUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagUserCopyWith<$Res> implements $TagUserCopyWith<$Res> {
  factory _$$_TagUserCopyWith(
          _$_TagUser value, $Res Function(_$_TagUser) then) =
      __$$_TagUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name});
}

/// @nodoc
class __$$_TagUserCopyWithImpl<$Res>
    extends _$TagUserCopyWithImpl<$Res, _$_TagUser>
    implements _$$_TagUserCopyWith<$Res> {
  __$$_TagUserCopyWithImpl(_$_TagUser _value, $Res Function(_$_TagUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_TagUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagUser implements _TagUser {
  const _$_TagUser({this.id = null, required this.name});

  factory _$_TagUser.fromJson(Map<String, dynamic> json) =>
      _$$_TagUserFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  final String name;

  @override
  String toString() {
    return 'TagUser(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagUserCopyWith<_$_TagUser> get copyWith =>
      __$$_TagUserCopyWithImpl<_$_TagUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagUserToJson(
      this,
    );
  }
}

abstract class _TagUser implements TagUser {
  const factory _TagUser({final int? id, required final String name}) =
      _$_TagUser;

  factory _TagUser.fromJson(Map<String, dynamic> json) = _$_TagUser.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TagUserCopyWith<_$_TagUser> get copyWith =>
      throw _privateConstructorUsedError;
}
