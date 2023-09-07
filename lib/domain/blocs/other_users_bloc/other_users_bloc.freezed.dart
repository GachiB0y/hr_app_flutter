// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtherUsersEvent {
  String get phoneNumber => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventFetch value)
        gethUsersByPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventFetch value)? gethUsersByPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventFetch value)? gethUsersByPhoneNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtherUsersEventCopyWith<OtherUsersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUsersEventCopyWith<$Res> {
  factory $OtherUsersEventCopyWith(
          OtherUsersEvent value, $Res Function(OtherUsersEvent) then) =
      _$OtherUsersEventCopyWithImpl<$Res, OtherUsersEvent>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$OtherUsersEventCopyWithImpl<$Res, $Val extends OtherUsersEvent>
    implements $OtherUsersEventCopyWith<$Res> {
  _$OtherUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherUsersEventFetchCopyWith<$Res>
    implements $OtherUsersEventCopyWith<$Res> {
  factory _$$OtherUsersEventFetchCopyWith(_$OtherUsersEventFetch value,
          $Res Function(_$OtherUsersEventFetch) then) =
      __$$OtherUsersEventFetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$OtherUsersEventFetchCopyWithImpl<$Res>
    extends _$OtherUsersEventCopyWithImpl<$Res, _$OtherUsersEventFetch>
    implements _$$OtherUsersEventFetchCopyWith<$Res> {
  __$$OtherUsersEventFetchCopyWithImpl(_$OtherUsersEventFetch _value,
      $Res Function(_$OtherUsersEventFetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$OtherUsersEventFetch(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherUsersEventFetch implements OtherUsersEventFetch {
  const _$OtherUsersEventFetch({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtherUsersEvent.gethUsersByPhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUsersEventFetch &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUsersEventFetchCopyWith<_$OtherUsersEventFetch> get copyWith =>
      __$$OtherUsersEventFetchCopyWithImpl<_$OtherUsersEventFetch>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
  }) {
    return gethUsersByPhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
  }) {
    return gethUsersByPhoneNumber?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    required TResult orElse(),
  }) {
    if (gethUsersByPhoneNumber != null) {
      return gethUsersByPhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventFetch value)
        gethUsersByPhoneNumber,
  }) {
    return gethUsersByPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventFetch value)? gethUsersByPhoneNumber,
  }) {
    return gethUsersByPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventFetch value)? gethUsersByPhoneNumber,
    required TResult orElse(),
  }) {
    if (gethUsersByPhoneNumber != null) {
      return gethUsersByPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class OtherUsersEventFetch implements OtherUsersEvent {
  const factory OtherUsersEventFetch({required final String phoneNumber}) =
      _$OtherUsersEventFetch;

  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$OtherUsersEventFetchCopyWith<_$OtherUsersEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherUserState _$OtherUserStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return OtherUserStateLoading.fromJson(json);
    case 'loaded':
      return OtherUserStateLoaded.fromJson(json);
    case 'error':
      return OtherUserStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OtherUserState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OtherUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<User> listUsersLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<User> listUsersLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<User> listUsersLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUserStateLoading value) loading,
    required TResult Function(OtherUserStateLoaded value) loaded,
    required TResult Function(OtherUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUserStateLoading value)? loading,
    TResult? Function(OtherUserStateLoaded value)? loaded,
    TResult? Function(OtherUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUserStateLoading value)? loading,
    TResult Function(OtherUserStateLoaded value)? loaded,
    TResult Function(OtherUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserStateCopyWith<$Res> {
  factory $OtherUserStateCopyWith(
          OtherUserState value, $Res Function(OtherUserState) then) =
      _$OtherUserStateCopyWithImpl<$Res, OtherUserState>;
}

/// @nodoc
class _$OtherUserStateCopyWithImpl<$Res, $Val extends OtherUserState>
    implements $OtherUserStateCopyWith<$Res> {
  _$OtherUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OtherUserStateLoadingCopyWith<$Res> {
  factory _$$OtherUserStateLoadingCopyWith(_$OtherUserStateLoading value,
          $Res Function(_$OtherUserStateLoading) then) =
      __$$OtherUserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtherUserStateLoadingCopyWithImpl<$Res>
    extends _$OtherUserStateCopyWithImpl<$Res, _$OtherUserStateLoading>
    implements _$$OtherUserStateLoadingCopyWith<$Res> {
  __$$OtherUserStateLoadingCopyWithImpl(_$OtherUserStateLoading _value,
      $Res Function(_$OtherUserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OtherUserStateLoading implements OtherUserStateLoading {
  const _$OtherUserStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$OtherUserStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OtherUserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtherUserStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<User> listUsersLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<User> listUsersLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<User> listUsersLoaded)? loaded,
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
    required TResult Function(OtherUserStateLoading value) loading,
    required TResult Function(OtherUserStateLoaded value) loaded,
    required TResult Function(OtherUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUserStateLoading value)? loading,
    TResult? Function(OtherUserStateLoaded value)? loaded,
    TResult? Function(OtherUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUserStateLoading value)? loading,
    TResult Function(OtherUserStateLoaded value)? loaded,
    TResult Function(OtherUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserStateLoadingToJson(
      this,
    );
  }
}

abstract class OtherUserStateLoading implements OtherUserState {
  const factory OtherUserStateLoading() = _$OtherUserStateLoading;

  factory OtherUserStateLoading.fromJson(Map<String, dynamic> json) =
      _$OtherUserStateLoading.fromJson;
}

/// @nodoc
abstract class _$$OtherUserStateLoadedCopyWith<$Res> {
  factory _$$OtherUserStateLoadedCopyWith(_$OtherUserStateLoaded value,
          $Res Function(_$OtherUserStateLoaded) then) =
      __$$OtherUserStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> listUsersLoaded});
}

/// @nodoc
class __$$OtherUserStateLoadedCopyWithImpl<$Res>
    extends _$OtherUserStateCopyWithImpl<$Res, _$OtherUserStateLoaded>
    implements _$$OtherUserStateLoadedCopyWith<$Res> {
  __$$OtherUserStateLoadedCopyWithImpl(_$OtherUserStateLoaded _value,
      $Res Function(_$OtherUserStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listUsersLoaded = null,
  }) {
    return _then(_$OtherUserStateLoaded(
      listUsersLoaded: null == listUsersLoaded
          ? _value._listUsersLoaded
          : listUsersLoaded // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherUserStateLoaded implements OtherUserStateLoaded {
  const _$OtherUserStateLoaded(
      {required final List<User> listUsersLoaded, final String? $type})
      : _listUsersLoaded = listUsersLoaded,
        $type = $type ?? 'loaded';

  factory _$OtherUserStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserStateLoadedFromJson(json);

  final List<User> _listUsersLoaded;
  @override
  List<User> get listUsersLoaded {
    if (_listUsersLoaded is EqualUnmodifiableListView) return _listUsersLoaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listUsersLoaded);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OtherUserState.loaded(listUsersLoaded: $listUsersLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUserStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._listUsersLoaded, _listUsersLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listUsersLoaded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUserStateLoadedCopyWith<_$OtherUserStateLoaded> get copyWith =>
      __$$OtherUserStateLoadedCopyWithImpl<_$OtherUserStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<User> listUsersLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(listUsersLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<User> listUsersLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(listUsersLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<User> listUsersLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listUsersLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUserStateLoading value) loading,
    required TResult Function(OtherUserStateLoaded value) loaded,
    required TResult Function(OtherUserStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUserStateLoading value)? loading,
    TResult? Function(OtherUserStateLoaded value)? loaded,
    TResult? Function(OtherUserStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUserStateLoading value)? loading,
    TResult Function(OtherUserStateLoaded value)? loaded,
    TResult Function(OtherUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserStateLoadedToJson(
      this,
    );
  }
}

abstract class OtherUserStateLoaded implements OtherUserState {
  const factory OtherUserStateLoaded(
      {required final List<User> listUsersLoaded}) = _$OtherUserStateLoaded;

  factory OtherUserStateLoaded.fromJson(Map<String, dynamic> json) =
      _$OtherUserStateLoaded.fromJson;

  List<User> get listUsersLoaded;
  @JsonKey(ignore: true)
  _$$OtherUserStateLoadedCopyWith<_$OtherUserStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherUserStateErrorCopyWith<$Res> {
  factory _$$OtherUserStateErrorCopyWith(_$OtherUserStateError value,
          $Res Function(_$OtherUserStateError) then) =
      __$$OtherUserStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtherUserStateErrorCopyWithImpl<$Res>
    extends _$OtherUserStateCopyWithImpl<$Res, _$OtherUserStateError>
    implements _$$OtherUserStateErrorCopyWith<$Res> {
  __$$OtherUserStateErrorCopyWithImpl(
      _$OtherUserStateError _value, $Res Function(_$OtherUserStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OtherUserStateError implements OtherUserStateError {
  const _$OtherUserStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$OtherUserStateError.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OtherUserState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtherUserStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<User> listUsersLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<User> listUsersLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<User> listUsersLoaded)? loaded,
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
    required TResult Function(OtherUserStateLoading value) loading,
    required TResult Function(OtherUserStateLoaded value) loaded,
    required TResult Function(OtherUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUserStateLoading value)? loading,
    TResult? Function(OtherUserStateLoaded value)? loaded,
    TResult? Function(OtherUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUserStateLoading value)? loading,
    TResult Function(OtherUserStateLoaded value)? loaded,
    TResult Function(OtherUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserStateErrorToJson(
      this,
    );
  }
}

abstract class OtherUserStateError implements OtherUserState {
  const factory OtherUserStateError() = _$OtherUserStateError;

  factory OtherUserStateError.fromJson(Map<String, dynamic> json) =
      _$OtherUserStateError.fromJson;
}
