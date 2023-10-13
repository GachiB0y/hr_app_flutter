// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_birth_day_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserBirthDayInfoEvent {
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
    required TResult Function(UserBirthDayInfoEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBirthDayInfoEventCopyWith<$Res> {
  factory $UserBirthDayInfoEventCopyWith(UserBirthDayInfoEvent value,
          $Res Function(UserBirthDayInfoEvent) then) =
      _$UserBirthDayInfoEventCopyWithImpl<$Res, UserBirthDayInfoEvent>;
}

/// @nodoc
class _$UserBirthDayInfoEventCopyWithImpl<$Res,
        $Val extends UserBirthDayInfoEvent>
    implements $UserBirthDayInfoEventCopyWith<$Res> {
  _$UserBirthDayInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserBirthDayInfoEventFetchCopyWith<$Res> {
  factory _$$UserBirthDayInfoEventFetchCopyWith(
          _$UserBirthDayInfoEventFetch value,
          $Res Function(_$UserBirthDayInfoEventFetch) then) =
      __$$UserBirthDayInfoEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserBirthDayInfoEventFetchCopyWithImpl<$Res>
    extends _$UserBirthDayInfoEventCopyWithImpl<$Res,
        _$UserBirthDayInfoEventFetch>
    implements _$$UserBirthDayInfoEventFetchCopyWith<$Res> {
  __$$UserBirthDayInfoEventFetchCopyWithImpl(
      _$UserBirthDayInfoEventFetch _value,
      $Res Function(_$UserBirthDayInfoEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserBirthDayInfoEventFetch implements UserBirthDayInfoEventFetch {
  const _$UserBirthDayInfoEventFetch();

  @override
  String toString() {
    return 'UserBirthDayInfoEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoEventFetch);
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
    required TResult Function(UserBirthDayInfoEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class UserBirthDayInfoEventFetch implements UserBirthDayInfoEvent {
  const factory UserBirthDayInfoEventFetch() = _$UserBirthDayInfoEventFetch;
}

UserBirthDayInfoState _$UserBirthDayInfoStateFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return UserBirthDayInfoStateLoading.fromJson(json);
    case 'loaded':
      return UserBirthDayInfoStateLoaded.fromJson(json);
    case 'error':
      return UserBirthDayInfoStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'UserBirthDayInfoState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserBirthDayInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BirthDayInfoEntity birthDayInfoLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBirthDayInfoStateLoading value) loading,
    required TResult Function(UserBirthDayInfoStateLoaded value) loaded,
    required TResult Function(UserBirthDayInfoStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoStateLoading value)? loading,
    TResult? Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult? Function(UserBirthDayInfoStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoStateLoading value)? loading,
    TResult Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult Function(UserBirthDayInfoStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBirthDayInfoStateCopyWith<$Res> {
  factory $UserBirthDayInfoStateCopyWith(UserBirthDayInfoState value,
          $Res Function(UserBirthDayInfoState) then) =
      _$UserBirthDayInfoStateCopyWithImpl<$Res, UserBirthDayInfoState>;
}

/// @nodoc
class _$UserBirthDayInfoStateCopyWithImpl<$Res,
        $Val extends UserBirthDayInfoState>
    implements $UserBirthDayInfoStateCopyWith<$Res> {
  _$UserBirthDayInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserBirthDayInfoStateLoadingCopyWith<$Res> {
  factory _$$UserBirthDayInfoStateLoadingCopyWith(
          _$UserBirthDayInfoStateLoading value,
          $Res Function(_$UserBirthDayInfoStateLoading) then) =
      __$$UserBirthDayInfoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserBirthDayInfoStateLoadingCopyWithImpl<$Res>
    extends _$UserBirthDayInfoStateCopyWithImpl<$Res,
        _$UserBirthDayInfoStateLoading>
    implements _$$UserBirthDayInfoStateLoadingCopyWith<$Res> {
  __$$UserBirthDayInfoStateLoadingCopyWithImpl(
      _$UserBirthDayInfoStateLoading _value,
      $Res Function(_$UserBirthDayInfoStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserBirthDayInfoStateLoading implements UserBirthDayInfoStateLoading {
  const _$UserBirthDayInfoStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$UserBirthDayInfoStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$UserBirthDayInfoStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserBirthDayInfoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BirthDayInfoEntity birthDayInfoLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
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
    required TResult Function(UserBirthDayInfoStateLoading value) loading,
    required TResult Function(UserBirthDayInfoStateLoaded value) loaded,
    required TResult Function(UserBirthDayInfoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoStateLoading value)? loading,
    TResult? Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult? Function(UserBirthDayInfoStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoStateLoading value)? loading,
    TResult Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult Function(UserBirthDayInfoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBirthDayInfoStateLoadingToJson(
      this,
    );
  }
}

abstract class UserBirthDayInfoStateLoading implements UserBirthDayInfoState {
  const factory UserBirthDayInfoStateLoading() = _$UserBirthDayInfoStateLoading;

  factory UserBirthDayInfoStateLoading.fromJson(Map<String, dynamic> json) =
      _$UserBirthDayInfoStateLoading.fromJson;
}

/// @nodoc
abstract class _$$UserBirthDayInfoStateLoadedCopyWith<$Res> {
  factory _$$UserBirthDayInfoStateLoadedCopyWith(
          _$UserBirthDayInfoStateLoaded value,
          $Res Function(_$UserBirthDayInfoStateLoaded) then) =
      __$$UserBirthDayInfoStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({BirthDayInfoEntity birthDayInfoLoaded});

  $BirthDayInfoEntityCopyWith<$Res> get birthDayInfoLoaded;
}

/// @nodoc
class __$$UserBirthDayInfoStateLoadedCopyWithImpl<$Res>
    extends _$UserBirthDayInfoStateCopyWithImpl<$Res,
        _$UserBirthDayInfoStateLoaded>
    implements _$$UserBirthDayInfoStateLoadedCopyWith<$Res> {
  __$$UserBirthDayInfoStateLoadedCopyWithImpl(
      _$UserBirthDayInfoStateLoaded _value,
      $Res Function(_$UserBirthDayInfoStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDayInfoLoaded = null,
  }) {
    return _then(_$UserBirthDayInfoStateLoaded(
      birthDayInfoLoaded: null == birthDayInfoLoaded
          ? _value.birthDayInfoLoaded
          : birthDayInfoLoaded // ignore: cast_nullable_to_non_nullable
              as BirthDayInfoEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BirthDayInfoEntityCopyWith<$Res> get birthDayInfoLoaded {
    return $BirthDayInfoEntityCopyWith<$Res>(_value.birthDayInfoLoaded,
        (value) {
      return _then(_value.copyWith(birthDayInfoLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBirthDayInfoStateLoaded implements UserBirthDayInfoStateLoaded {
  const _$UserBirthDayInfoStateLoaded(
      {required this.birthDayInfoLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$UserBirthDayInfoStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$UserBirthDayInfoStateLoadedFromJson(json);

  @override
  final BirthDayInfoEntity birthDayInfoLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserBirthDayInfoState.loaded(birthDayInfoLoaded: $birthDayInfoLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoStateLoaded &&
            (identical(other.birthDayInfoLoaded, birthDayInfoLoaded) ||
                other.birthDayInfoLoaded == birthDayInfoLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, birthDayInfoLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBirthDayInfoStateLoadedCopyWith<_$UserBirthDayInfoStateLoaded>
      get copyWith => __$$UserBirthDayInfoStateLoadedCopyWithImpl<
          _$UserBirthDayInfoStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BirthDayInfoEntity birthDayInfoLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(birthDayInfoLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(birthDayInfoLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(birthDayInfoLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBirthDayInfoStateLoading value) loading,
    required TResult Function(UserBirthDayInfoStateLoaded value) loaded,
    required TResult Function(UserBirthDayInfoStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoStateLoading value)? loading,
    TResult? Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult? Function(UserBirthDayInfoStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoStateLoading value)? loading,
    TResult Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult Function(UserBirthDayInfoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBirthDayInfoStateLoadedToJson(
      this,
    );
  }
}

abstract class UserBirthDayInfoStateLoaded implements UserBirthDayInfoState {
  const factory UserBirthDayInfoStateLoaded(
          {required final BirthDayInfoEntity birthDayInfoLoaded}) =
      _$UserBirthDayInfoStateLoaded;

  factory UserBirthDayInfoStateLoaded.fromJson(Map<String, dynamic> json) =
      _$UserBirthDayInfoStateLoaded.fromJson;

  BirthDayInfoEntity get birthDayInfoLoaded;
  @JsonKey(ignore: true)
  _$$UserBirthDayInfoStateLoadedCopyWith<_$UserBirthDayInfoStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBirthDayInfoStateErrorCopyWith<$Res> {
  factory _$$UserBirthDayInfoStateErrorCopyWith(
          _$UserBirthDayInfoStateError value,
          $Res Function(_$UserBirthDayInfoStateError) then) =
      __$$UserBirthDayInfoStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserBirthDayInfoStateErrorCopyWithImpl<$Res>
    extends _$UserBirthDayInfoStateCopyWithImpl<$Res,
        _$UserBirthDayInfoStateError>
    implements _$$UserBirthDayInfoStateErrorCopyWith<$Res> {
  __$$UserBirthDayInfoStateErrorCopyWithImpl(
      _$UserBirthDayInfoStateError _value,
      $Res Function(_$UserBirthDayInfoStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserBirthDayInfoStateError implements UserBirthDayInfoStateError {
  const _$UserBirthDayInfoStateError({final String? $type})
      : $type = $type ?? 'error';

  factory _$UserBirthDayInfoStateError.fromJson(Map<String, dynamic> json) =>
      _$$UserBirthDayInfoStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserBirthDayInfoState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(BirthDayInfoEntity birthDayInfoLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(BirthDayInfoEntity birthDayInfoLoaded)? loaded,
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
    required TResult Function(UserBirthDayInfoStateLoading value) loading,
    required TResult Function(UserBirthDayInfoStateLoaded value) loaded,
    required TResult Function(UserBirthDayInfoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoStateLoading value)? loading,
    TResult? Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult? Function(UserBirthDayInfoStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoStateLoading value)? loading,
    TResult Function(UserBirthDayInfoStateLoaded value)? loaded,
    TResult Function(UserBirthDayInfoStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBirthDayInfoStateErrorToJson(
      this,
    );
  }
}

abstract class UserBirthDayInfoStateError implements UserBirthDayInfoState {
  const factory UserBirthDayInfoStateError() = _$UserBirthDayInfoStateError;

  factory UserBirthDayInfoStateError.fromJson(Map<String, dynamic> json) =
      _$UserBirthDayInfoStateError.fromJson;
}
