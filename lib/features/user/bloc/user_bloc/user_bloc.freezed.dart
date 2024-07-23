// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserEventFetchImplCopyWith<$Res> {
  factory _$$UserEventFetchImplCopyWith(_$UserEventFetchImpl value,
          $Res Function(_$UserEventFetchImpl) then) =
      __$$UserEventFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEventFetchImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventFetchImpl>
    implements _$$UserEventFetchImplCopyWith<$Res> {
  __$$UserEventFetchImplCopyWithImpl(
      _$UserEventFetchImpl _value, $Res Function(_$UserEventFetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEventFetchImpl extends UserEventFetch {
  const _$UserEventFetchImpl() : super._();

  @override
  String toString() {
    return 'UserEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEventFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class UserEventFetch extends UserEvent {
  const factory UserEventFetch() = _$UserEventFetchImpl;
  const UserEventFetch._() : super._();
}

/// @nodoc
abstract class _$$UserEventGethUserByUserIdImplCopyWith<$Res> {
  factory _$$UserEventGethUserByUserIdImplCopyWith(
          _$UserEventGethUserByUserIdImpl value,
          $Res Function(_$UserEventGethUserByUserIdImpl) then) =
      __$$UserEventGethUserByUserIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$UserEventGethUserByUserIdImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventGethUserByUserIdImpl>
    implements _$$UserEventGethUserByUserIdImplCopyWith<$Res> {
  __$$UserEventGethUserByUserIdImplCopyWithImpl(
      _$UserEventGethUserByUserIdImpl _value,
      $Res Function(_$UserEventGethUserByUserIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$UserEventGethUserByUserIdImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserEventGethUserByUserIdImpl extends UserEventGethUserByUserId {
  const _$UserEventGethUserByUserIdImpl({required this.userId}) : super._();

  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.gethUserByUserId(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventGethUserByUserIdImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventGethUserByUserIdImplCopyWith<_$UserEventGethUserByUserIdImpl>
      get copyWith => __$$UserEventGethUserByUserIdImplCopyWithImpl<
          _$UserEventGethUserByUserIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return gethUserByUserId(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return gethUserByUserId?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (gethUserByUserId != null) {
      return gethUserByUserId(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return gethUserByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return gethUserByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (gethUserByUserId != null) {
      return gethUserByUserId(this);
    }
    return orElse();
  }
}

abstract class UserEventGethUserByUserId extends UserEvent {
  const factory UserEventGethUserByUserId({required final String userId}) =
      _$UserEventGethUserByUserIdImpl;
  const UserEventGethUserByUserId._() : super._();

  String get userId;
  @JsonKey(ignore: true)
  _$$UserEventGethUserByUserIdImplCopyWith<_$UserEventGethUserByUserIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventSaveTagsToSendImplCopyWith<$Res> {
  factory _$$UserEventSaveTagsToSendImplCopyWith(
          _$UserEventSaveTagsToSendImpl value,
          $Res Function(_$UserEventSaveTagsToSendImpl) then) =
      __$$UserEventSaveTagsToSendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TagUser> tags, int userId});
}

/// @nodoc
class __$$UserEventSaveTagsToSendImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventSaveTagsToSendImpl>
    implements _$$UserEventSaveTagsToSendImplCopyWith<$Res> {
  __$$UserEventSaveTagsToSendImplCopyWithImpl(
      _$UserEventSaveTagsToSendImpl _value,
      $Res Function(_$UserEventSaveTagsToSendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? userId = null,
  }) {
    return _then(_$UserEventSaveTagsToSendImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagUser>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserEventSaveTagsToSendImpl extends UserEventSaveTagsToSend {
  const _$UserEventSaveTagsToSendImpl(
      {required final List<TagUser> tags, required this.userId})
      : _tags = tags,
        super._();

  final List<TagUser> _tags;
  @override
  List<TagUser> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final int userId;

  @override
  String toString() {
    return 'UserEvent.saveTagsToSend(tags: $tags, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventSaveTagsToSendImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tags), userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventSaveTagsToSendImplCopyWith<_$UserEventSaveTagsToSendImpl>
      get copyWith => __$$UserEventSaveTagsToSendImplCopyWithImpl<
          _$UserEventSaveTagsToSendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return saveTagsToSend(tags, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return saveTagsToSend?.call(tags, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (saveTagsToSend != null) {
      return saveTagsToSend(tags, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return saveTagsToSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return saveTagsToSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (saveTagsToSend != null) {
      return saveTagsToSend(this);
    }
    return orElse();
  }
}

abstract class UserEventSaveTagsToSend extends UserEvent {
  const factory UserEventSaveTagsToSend(
      {required final List<TagUser> tags,
      required final int userId}) = _$UserEventSaveTagsToSendImpl;
  const UserEventSaveTagsToSend._() : super._();

  List<TagUser> get tags;
  int get userId;
  @JsonKey(ignore: true)
  _$$UserEventSaveTagsToSendImplCopyWith<_$UserEventSaveTagsToSendImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventAddTagImplCopyWith<$Res> {
  factory _$$UserEventAddTagImplCopyWith(_$UserEventAddTagImpl value,
          $Res Function(_$UserEventAddTagImpl) then) =
      __$$UserEventAddTagImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TagUser tag});

  $TagUserCopyWith<$Res> get tag;
}

/// @nodoc
class __$$UserEventAddTagImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventAddTagImpl>
    implements _$$UserEventAddTagImplCopyWith<$Res> {
  __$$UserEventAddTagImplCopyWithImpl(
      _$UserEventAddTagImpl _value, $Res Function(_$UserEventAddTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$UserEventAddTagImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TagUserCopyWith<$Res> get tag {
    return $TagUserCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value));
    });
  }
}

/// @nodoc

class _$UserEventAddTagImpl extends UserEventAddTag {
  const _$UserEventAddTagImpl({required this.tag}) : super._();

  @override
  final TagUser tag;

  @override
  String toString() {
    return 'UserEvent.addTag(tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventAddTagImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventAddTagImplCopyWith<_$UserEventAddTagImpl> get copyWith =>
      __$$UserEventAddTagImplCopyWithImpl<_$UserEventAddTagImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return addTag(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return addTag?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (addTag != null) {
      return addTag(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return addTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return addTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (addTag != null) {
      return addTag(this);
    }
    return orElse();
  }
}

abstract class UserEventAddTag extends UserEvent {
  const factory UserEventAddTag({required final TagUser tag}) =
      _$UserEventAddTagImpl;
  const UserEventAddTag._() : super._();

  TagUser get tag;
  @JsonKey(ignore: true)
  _$$UserEventAddTagImplCopyWith<_$UserEventAddTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventDeleteTagImplCopyWith<$Res> {
  factory _$$UserEventDeleteTagImplCopyWith(_$UserEventDeleteTagImpl value,
          $Res Function(_$UserEventDeleteTagImpl) then) =
      __$$UserEventDeleteTagImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TagUser tag});

  $TagUserCopyWith<$Res> get tag;
}

/// @nodoc
class __$$UserEventDeleteTagImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventDeleteTagImpl>
    implements _$$UserEventDeleteTagImplCopyWith<$Res> {
  __$$UserEventDeleteTagImplCopyWithImpl(_$UserEventDeleteTagImpl _value,
      $Res Function(_$UserEventDeleteTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$UserEventDeleteTagImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TagUserCopyWith<$Res> get tag {
    return $TagUserCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value));
    });
  }
}

/// @nodoc

class _$UserEventDeleteTagImpl extends UserEventDeleteTag {
  const _$UserEventDeleteTagImpl({required this.tag}) : super._();

  @override
  final TagUser tag;

  @override
  String toString() {
    return 'UserEvent.deleteTag(tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventDeleteTagImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventDeleteTagImplCopyWith<_$UserEventDeleteTagImpl> get copyWith =>
      __$$UserEventDeleteTagImplCopyWithImpl<_$UserEventDeleteTagImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return deleteTag(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return deleteTag?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (deleteTag != null) {
      return deleteTag(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return deleteTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return deleteTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (deleteTag != null) {
      return deleteTag(this);
    }
    return orElse();
  }
}

abstract class UserEventDeleteTag extends UserEvent {
  const factory UserEventDeleteTag({required final TagUser tag}) =
      _$UserEventDeleteTagImpl;
  const UserEventDeleteTag._() : super._();

  TagUser get tag;
  @JsonKey(ignore: true)
  _$$UserEventDeleteTagImplCopyWith<_$UserEventDeleteTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventSendAvatarWithProfileImplCopyWith<$Res> {
  factory _$$UserEventSendAvatarWithProfileImplCopyWith(
          _$UserEventSendAvatarWithProfileImpl value,
          $Res Function(_$UserEventSendAvatarWithProfileImpl) then) =
      __$$UserEventSendAvatarWithProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({io.File imageFile, int userId});
}

/// @nodoc
class __$$UserEventSendAvatarWithProfileImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventSendAvatarWithProfileImpl>
    implements _$$UserEventSendAvatarWithProfileImplCopyWith<$Res> {
  __$$UserEventSendAvatarWithProfileImplCopyWithImpl(
      _$UserEventSendAvatarWithProfileImpl _value,
      $Res Function(_$UserEventSendAvatarWithProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = null,
    Object? userId = null,
  }) {
    return _then(_$UserEventSendAvatarWithProfileImpl(
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as io.File,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserEventSendAvatarWithProfileImpl
    extends UserEventSendAvatarWithProfile {
  const _$UserEventSendAvatarWithProfileImpl(
      {required this.imageFile, required this.userId})
      : super._();

  @override
  final io.File imageFile;
  @override
  final int userId;

  @override
  String toString() {
    return 'UserEvent.sendAvatarWithProfile(imageFile: $imageFile, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventSendAvatarWithProfileImpl &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFile, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventSendAvatarWithProfileImplCopyWith<
          _$UserEventSendAvatarWithProfileImpl>
      get copyWith => __$$UserEventSendAvatarWithProfileImplCopyWithImpl<
          _$UserEventSendAvatarWithProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String userId) gethUserByUserId,
    required TResult Function(List<TagUser> tags, int userId) saveTagsToSend,
    required TResult Function(TagUser tag) addTag,
    required TResult Function(TagUser tag) deleteTag,
    required TResult Function(io.File imageFile, int userId)
        sendAvatarWithProfile,
  }) {
    return sendAvatarWithProfile(imageFile, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String userId)? gethUserByUserId,
    TResult? Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult? Function(TagUser tag)? addTag,
    TResult? Function(TagUser tag)? deleteTag,
    TResult? Function(io.File imageFile, int userId)? sendAvatarWithProfile,
  }) {
    return sendAvatarWithProfile?.call(imageFile, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String userId)? gethUserByUserId,
    TResult Function(List<TagUser> tags, int userId)? saveTagsToSend,
    TResult Function(TagUser tag)? addTag,
    TResult Function(TagUser tag)? deleteTag,
    TResult Function(io.File imageFile, int userId)? sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (sendAvatarWithProfile != null) {
      return sendAvatarWithProfile(imageFile, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
    required TResult Function(UserEventGethUserByUserId value) gethUserByUserId,
    required TResult Function(UserEventSaveTagsToSend value) saveTagsToSend,
    required TResult Function(UserEventAddTag value) addTag,
    required TResult Function(UserEventDeleteTag value) deleteTag,
    required TResult Function(UserEventSendAvatarWithProfile value)
        sendAvatarWithProfile,
  }) {
    return sendAvatarWithProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
    TResult? Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult? Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult? Function(UserEventAddTag value)? addTag,
    TResult? Function(UserEventDeleteTag value)? deleteTag,
    TResult? Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
  }) {
    return sendAvatarWithProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    TResult Function(UserEventGethUserByUserId value)? gethUserByUserId,
    TResult Function(UserEventSaveTagsToSend value)? saveTagsToSend,
    TResult Function(UserEventAddTag value)? addTag,
    TResult Function(UserEventDeleteTag value)? deleteTag,
    TResult Function(UserEventSendAvatarWithProfile value)?
        sendAvatarWithProfile,
    required TResult orElse(),
  }) {
    if (sendAvatarWithProfile != null) {
      return sendAvatarWithProfile(this);
    }
    return orElse();
  }
}

abstract class UserEventSendAvatarWithProfile extends UserEvent {
  const factory UserEventSendAvatarWithProfile(
      {required final io.File imageFile,
      required final int userId}) = _$UserEventSendAvatarWithProfileImpl;
  const UserEventSendAvatarWithProfile._() : super._();

  io.File get imageFile;
  int get userId;
  @JsonKey(ignore: true)
  _$$UserEventSendAvatarWithProfileImplCopyWith<
          _$UserEventSendAvatarWithProfileImpl>
      get copyWith => throw _privateConstructorUsedError;
}
