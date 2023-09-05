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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
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

class _$UserEventFetch implements UserEventFetch {
  const _$UserEventFetch();

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
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
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
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class UserEventFetch implements UserEvent {
  const factory UserEventFetch() = _$UserEventFetch;
}

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return UserStateLoading.fromJson(json);
    case 'loaded':
      return UserStateLoaded.fromJson(json);
    case 'error':
      return UserStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User userLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User userLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User userLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateLoaded value)? loaded,
    TResult? Function(UserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserStateLoadingCopyWith<$Res> {
  factory _$$UserStateLoadingCopyWith(
          _$UserStateLoading value, $Res Function(_$UserStateLoading) then) =
      __$$UserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateLoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoading>
    implements _$$UserStateLoadingCopyWith<$Res> {
  __$$UserStateLoadingCopyWithImpl(
      _$UserStateLoading _value, $Res Function(_$UserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserStateLoading implements UserStateLoading {
  const _$UserStateLoading({final String? $type}) : $type = $type ?? 'loading';

  factory _$UserStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$UserStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User userLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User userLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User userLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateLoaded value)? loaded,
    TResult? Function(UserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateLoadingToJson(
      this,
    );
  }
}

abstract class UserStateLoading implements UserState {
  const factory UserStateLoading() = _$UserStateLoading;

  factory UserStateLoading.fromJson(Map<String, dynamic> json) =
      _$UserStateLoading.fromJson;
}

/// @nodoc
abstract class _$$UserStateLoadedCopyWith<$Res> {
  factory _$$UserStateLoadedCopyWith(
          _$UserStateLoaded value, $Res Function(_$UserStateLoaded) then) =
      __$$UserStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({User userLoaded});

  $UserCopyWith<$Res> get userLoaded;
}

/// @nodoc
class __$$UserStateLoadedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateLoaded>
    implements _$$UserStateLoadedCopyWith<$Res> {
  __$$UserStateLoadedCopyWithImpl(
      _$UserStateLoaded _value, $Res Function(_$UserStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLoaded = null,
  }) {
    return _then(_$UserStateLoaded(
      userLoaded: null == userLoaded
          ? _value.userLoaded
          : userLoaded // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userLoaded {
    return $UserCopyWith<$Res>(_value.userLoaded, (value) {
      return _then(_value.copyWith(userLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStateLoaded implements UserStateLoaded {
  const _$UserStateLoaded({required this.userLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$UserStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$UserStateLoadedFromJson(json);

  @override
  final User userLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.loaded(userLoaded: $userLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateLoaded &&
            (identical(other.userLoaded, userLoaded) ||
                other.userLoaded == userLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateLoadedCopyWith<_$UserStateLoaded> get copyWith =>
      __$$UserStateLoadedCopyWithImpl<_$UserStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User userLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(userLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User userLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(userLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User userLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateLoaded value)? loaded,
    TResult? Function(UserStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateLoadedToJson(
      this,
    );
  }
}

abstract class UserStateLoaded implements UserState {
  const factory UserStateLoaded({required final User userLoaded}) =
      _$UserStateLoaded;

  factory UserStateLoaded.fromJson(Map<String, dynamic> json) =
      _$UserStateLoaded.fromJson;

  User get userLoaded;
  @JsonKey(ignore: true)
  _$$UserStateLoadedCopyWith<_$UserStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateErrorCopyWith<$Res> {
  factory _$$UserStateErrorCopyWith(
          _$UserStateError value, $Res Function(_$UserStateError) then) =
      __$$UserStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateErrorCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateError>
    implements _$$UserStateErrorCopyWith<$Res> {
  __$$UserStateErrorCopyWithImpl(
      _$UserStateError _value, $Res Function(_$UserStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserStateError implements UserStateError {
  const _$UserStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$UserStateError.fromJson(Map<String, dynamic> json) =>
      _$$UserStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User userLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User userLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User userLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserStateLoading value)? loading,
    TResult? Function(UserStateLoaded value)? loaded,
    TResult? Function(UserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateErrorToJson(
      this,
    );
  }
}

abstract class UserStateError implements UserState {
  const factory UserStateError() = _$UserStateError;

  factory UserStateError.fromJson(Map<String, dynamic> json) =
      _$UserStateError.fromJson;
}
