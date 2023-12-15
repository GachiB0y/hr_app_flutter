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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$UserEventFetchCopyWith<$Res> {
  factory _$$UserEventFetchCopyWith(
          _$UserEventFetch value, $Res Function(_$UserEventFetch) then) =
      __$$UserEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEventFetchCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventFetch>
    implements _$$UserEventFetchCopyWith<$Res> {
  __$$UserEventFetchCopyWithImpl(
      _$UserEventFetch _value, $Res Function(_$UserEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEventFetch extends UserEventFetch {
  const _$UserEventFetch() : super._();

  @override
  String toString() {
    return 'UserEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEventFetch);
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
  const factory UserEventFetch() = _$UserEventFetch;
  const UserEventFetch._() : super._();
}

/// @nodoc
abstract class _$$UserEventGethUserByUserIdCopyWith<$Res> {
  factory _$$UserEventGethUserByUserIdCopyWith(
          _$UserEventGethUserByUserId value,
          $Res Function(_$UserEventGethUserByUserId) then) =
      __$$UserEventGethUserByUserIdCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$UserEventGethUserByUserIdCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventGethUserByUserId>
    implements _$$UserEventGethUserByUserIdCopyWith<$Res> {
  __$$UserEventGethUserByUserIdCopyWithImpl(_$UserEventGethUserByUserId _value,
      $Res Function(_$UserEventGethUserByUserId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$UserEventGethUserByUserId(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserEventGethUserByUserId extends UserEventGethUserByUserId {
  const _$UserEventGethUserByUserId({required this.userId}) : super._();

  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.gethUserByUserId(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventGethUserByUserId &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventGethUserByUserIdCopyWith<_$UserEventGethUserByUserId>
      get copyWith => __$$UserEventGethUserByUserIdCopyWithImpl<
          _$UserEventGethUserByUserId>(this, _$identity);

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
      _$UserEventGethUserByUserId;
  const UserEventGethUserByUserId._() : super._();

  String get userId;
  @JsonKey(ignore: true)
  _$$UserEventGethUserByUserIdCopyWith<_$UserEventGethUserByUserId>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventSaveTagsToSendCopyWith<$Res> {
  factory _$$UserEventSaveTagsToSendCopyWith(_$UserEventSaveTagsToSend value,
          $Res Function(_$UserEventSaveTagsToSend) then) =
      __$$UserEventSaveTagsToSendCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TagUser> tags, int userId});
}

/// @nodoc
class __$$UserEventSaveTagsToSendCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventSaveTagsToSend>
    implements _$$UserEventSaveTagsToSendCopyWith<$Res> {
  __$$UserEventSaveTagsToSendCopyWithImpl(_$UserEventSaveTagsToSend _value,
      $Res Function(_$UserEventSaveTagsToSend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? userId = null,
  }) {
    return _then(_$UserEventSaveTagsToSend(
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

class _$UserEventSaveTagsToSend extends UserEventSaveTagsToSend {
  const _$UserEventSaveTagsToSend(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventSaveTagsToSend &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tags), userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventSaveTagsToSendCopyWith<_$UserEventSaveTagsToSend> get copyWith =>
      __$$UserEventSaveTagsToSendCopyWithImpl<_$UserEventSaveTagsToSend>(
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
      required final int userId}) = _$UserEventSaveTagsToSend;
  const UserEventSaveTagsToSend._() : super._();

  List<TagUser> get tags;
  int get userId;
  @JsonKey(ignore: true)
  _$$UserEventSaveTagsToSendCopyWith<_$UserEventSaveTagsToSend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventAddTagCopyWith<$Res> {
  factory _$$UserEventAddTagCopyWith(
          _$UserEventAddTag value, $Res Function(_$UserEventAddTag) then) =
      __$$UserEventAddTagCopyWithImpl<$Res>;
  @useResult
  $Res call({TagUser tag});

  $TagUserCopyWith<$Res> get tag;
}

/// @nodoc
class __$$UserEventAddTagCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventAddTag>
    implements _$$UserEventAddTagCopyWith<$Res> {
  __$$UserEventAddTagCopyWithImpl(
      _$UserEventAddTag _value, $Res Function(_$UserEventAddTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$UserEventAddTag(
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

class _$UserEventAddTag extends UserEventAddTag {
  const _$UserEventAddTag({required this.tag}) : super._();

  @override
  final TagUser tag;

  @override
  String toString() {
    return 'UserEvent.addTag(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventAddTag &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventAddTagCopyWith<_$UserEventAddTag> get copyWith =>
      __$$UserEventAddTagCopyWithImpl<_$UserEventAddTag>(this, _$identity);

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
      _$UserEventAddTag;
  const UserEventAddTag._() : super._();

  TagUser get tag;
  @JsonKey(ignore: true)
  _$$UserEventAddTagCopyWith<_$UserEventAddTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventDeleteTagCopyWith<$Res> {
  factory _$$UserEventDeleteTagCopyWith(_$UserEventDeleteTag value,
          $Res Function(_$UserEventDeleteTag) then) =
      __$$UserEventDeleteTagCopyWithImpl<$Res>;
  @useResult
  $Res call({TagUser tag});

  $TagUserCopyWith<$Res> get tag;
}

/// @nodoc
class __$$UserEventDeleteTagCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventDeleteTag>
    implements _$$UserEventDeleteTagCopyWith<$Res> {
  __$$UserEventDeleteTagCopyWithImpl(
      _$UserEventDeleteTag _value, $Res Function(_$UserEventDeleteTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$UserEventDeleteTag(
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

class _$UserEventDeleteTag extends UserEventDeleteTag {
  const _$UserEventDeleteTag({required this.tag}) : super._();

  @override
  final TagUser tag;

  @override
  String toString() {
    return 'UserEvent.deleteTag(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventDeleteTag &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventDeleteTagCopyWith<_$UserEventDeleteTag> get copyWith =>
      __$$UserEventDeleteTagCopyWithImpl<_$UserEventDeleteTag>(
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
      _$UserEventDeleteTag;
  const UserEventDeleteTag._() : super._();

  TagUser get tag;
  @JsonKey(ignore: true)
  _$$UserEventDeleteTagCopyWith<_$UserEventDeleteTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEventSendAvatarWithProfileCopyWith<$Res> {
  factory _$$UserEventSendAvatarWithProfileCopyWith(
          _$UserEventSendAvatarWithProfile value,
          $Res Function(_$UserEventSendAvatarWithProfile) then) =
      __$$UserEventSendAvatarWithProfileCopyWithImpl<$Res>;
  @useResult
  $Res call({io.File imageFile, int userId});
}

/// @nodoc
class __$$UserEventSendAvatarWithProfileCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventSendAvatarWithProfile>
    implements _$$UserEventSendAvatarWithProfileCopyWith<$Res> {
  __$$UserEventSendAvatarWithProfileCopyWithImpl(
      _$UserEventSendAvatarWithProfile _value,
      $Res Function(_$UserEventSendAvatarWithProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = null,
    Object? userId = null,
  }) {
    return _then(_$UserEventSendAvatarWithProfile(
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

class _$UserEventSendAvatarWithProfile extends UserEventSendAvatarWithProfile {
  const _$UserEventSendAvatarWithProfile(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventSendAvatarWithProfile &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFile, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventSendAvatarWithProfileCopyWith<_$UserEventSendAvatarWithProfile>
      get copyWith => __$$UserEventSendAvatarWithProfileCopyWithImpl<
          _$UserEventSendAvatarWithProfile>(this, _$identity);

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
      required final int userId}) = _$UserEventSendAvatarWithProfile;
  const UserEventSendAvatarWithProfile._() : super._();

  io.File get imageFile;
  int get userId;
  @JsonKey(ignore: true)
  _$$UserEventSendAvatarWithProfileCopyWith<_$UserEventSendAvatarWithProfile>
      get copyWith => throw _privateConstructorUsedError;
}
