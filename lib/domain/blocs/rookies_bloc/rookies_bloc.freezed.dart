// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rookies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RookiesEvent {
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
    required TResult Function(RookiesEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RookiesEventCopyWith<$Res> {
  factory $RookiesEventCopyWith(
          RookiesEvent value, $Res Function(RookiesEvent) then) =
      _$RookiesEventCopyWithImpl<$Res, RookiesEvent>;
}

/// @nodoc
class _$RookiesEventCopyWithImpl<$Res, $Val extends RookiesEvent>
    implements $RookiesEventCopyWith<$Res> {
  _$RookiesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RookiesEventFetchCopyWith<$Res> {
  factory _$$RookiesEventFetchCopyWith(
          _$RookiesEventFetch value, $Res Function(_$RookiesEventFetch) then) =
      __$$RookiesEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RookiesEventFetchCopyWithImpl<$Res>
    extends _$RookiesEventCopyWithImpl<$Res, _$RookiesEventFetch>
    implements _$$RookiesEventFetchCopyWith<$Res> {
  __$$RookiesEventFetchCopyWithImpl(
      _$RookiesEventFetch _value, $Res Function(_$RookiesEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RookiesEventFetch implements RookiesEventFetch {
  const _$RookiesEventFetch();

  @override
  String toString() {
    return 'RookiesEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RookiesEventFetch);
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
    required TResult Function(RookiesEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class RookiesEventFetch implements RookiesEvent {
  const factory RookiesEventFetch() = _$RookiesEventFetch;
}

RookiesState _$RookiesStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return RookiesStateLoading.fromJson(json);
    case 'loaded':
      return RookiesStateLoaded.fromJson(json);
    case 'error':
      return RookiesStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RookiesState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RookiesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Rookies rookiesLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Rookies rookiesLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Rookies rookiesLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RookiesStateLoading value) loading,
    required TResult Function(RookiesStateLoaded value) loaded,
    required TResult Function(RookiesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesStateLoading value)? loading,
    TResult? Function(RookiesStateLoaded value)? loaded,
    TResult? Function(RookiesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesStateLoading value)? loading,
    TResult Function(RookiesStateLoaded value)? loaded,
    TResult Function(RookiesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RookiesStateCopyWith<$Res> {
  factory $RookiesStateCopyWith(
          RookiesState value, $Res Function(RookiesState) then) =
      _$RookiesStateCopyWithImpl<$Res, RookiesState>;
}

/// @nodoc
class _$RookiesStateCopyWithImpl<$Res, $Val extends RookiesState>
    implements $RookiesStateCopyWith<$Res> {
  _$RookiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RookiesStateLoadingCopyWith<$Res> {
  factory _$$RookiesStateLoadingCopyWith(_$RookiesStateLoading value,
          $Res Function(_$RookiesStateLoading) then) =
      __$$RookiesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RookiesStateLoadingCopyWithImpl<$Res>
    extends _$RookiesStateCopyWithImpl<$Res, _$RookiesStateLoading>
    implements _$$RookiesStateLoadingCopyWith<$Res> {
  __$$RookiesStateLoadingCopyWithImpl(
      _$RookiesStateLoading _value, $Res Function(_$RookiesStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RookiesStateLoading implements RookiesStateLoading {
  const _$RookiesStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$RookiesStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$RookiesStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RookiesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RookiesStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Rookies rookiesLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Rookies rookiesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Rookies rookiesLoaded)? loaded,
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
    required TResult Function(RookiesStateLoading value) loading,
    required TResult Function(RookiesStateLoaded value) loaded,
    required TResult Function(RookiesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesStateLoading value)? loading,
    TResult? Function(RookiesStateLoaded value)? loaded,
    TResult? Function(RookiesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesStateLoading value)? loading,
    TResult Function(RookiesStateLoaded value)? loaded,
    TResult Function(RookiesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RookiesStateLoadingToJson(
      this,
    );
  }
}

abstract class RookiesStateLoading implements RookiesState {
  const factory RookiesStateLoading() = _$RookiesStateLoading;

  factory RookiesStateLoading.fromJson(Map<String, dynamic> json) =
      _$RookiesStateLoading.fromJson;
}

/// @nodoc
abstract class _$$RookiesStateLoadedCopyWith<$Res> {
  factory _$$RookiesStateLoadedCopyWith(_$RookiesStateLoaded value,
          $Res Function(_$RookiesStateLoaded) then) =
      __$$RookiesStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Rookies rookiesLoaded});

  $RookiesCopyWith<$Res> get rookiesLoaded;
}

/// @nodoc
class __$$RookiesStateLoadedCopyWithImpl<$Res>
    extends _$RookiesStateCopyWithImpl<$Res, _$RookiesStateLoaded>
    implements _$$RookiesStateLoadedCopyWith<$Res> {
  __$$RookiesStateLoadedCopyWithImpl(
      _$RookiesStateLoaded _value, $Res Function(_$RookiesStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rookiesLoaded = null,
  }) {
    return _then(_$RookiesStateLoaded(
      rookiesLoaded: null == rookiesLoaded
          ? _value.rookiesLoaded
          : rookiesLoaded // ignore: cast_nullable_to_non_nullable
              as Rookies,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RookiesCopyWith<$Res> get rookiesLoaded {
    return $RookiesCopyWith<$Res>(_value.rookiesLoaded, (value) {
      return _then(_value.copyWith(rookiesLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$RookiesStateLoaded implements RookiesStateLoaded {
  const _$RookiesStateLoaded({required this.rookiesLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$RookiesStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$RookiesStateLoadedFromJson(json);

  @override
  final Rookies rookiesLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RookiesState.loaded(rookiesLoaded: $rookiesLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RookiesStateLoaded &&
            (identical(other.rookiesLoaded, rookiesLoaded) ||
                other.rookiesLoaded == rookiesLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rookiesLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RookiesStateLoadedCopyWith<_$RookiesStateLoaded> get copyWith =>
      __$$RookiesStateLoadedCopyWithImpl<_$RookiesStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Rookies rookiesLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(rookiesLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Rookies rookiesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(rookiesLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Rookies rookiesLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(rookiesLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RookiesStateLoading value) loading,
    required TResult Function(RookiesStateLoaded value) loaded,
    required TResult Function(RookiesStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesStateLoading value)? loading,
    TResult? Function(RookiesStateLoaded value)? loaded,
    TResult? Function(RookiesStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesStateLoading value)? loading,
    TResult Function(RookiesStateLoaded value)? loaded,
    TResult Function(RookiesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RookiesStateLoadedToJson(
      this,
    );
  }
}

abstract class RookiesStateLoaded implements RookiesState {
  const factory RookiesStateLoaded({required final Rookies rookiesLoaded}) =
      _$RookiesStateLoaded;

  factory RookiesStateLoaded.fromJson(Map<String, dynamic> json) =
      _$RookiesStateLoaded.fromJson;

  Rookies get rookiesLoaded;
  @JsonKey(ignore: true)
  _$$RookiesStateLoadedCopyWith<_$RookiesStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RookiesStateErrorCopyWith<$Res> {
  factory _$$RookiesStateErrorCopyWith(
          _$RookiesStateError value, $Res Function(_$RookiesStateError) then) =
      __$$RookiesStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RookiesStateErrorCopyWithImpl<$Res>
    extends _$RookiesStateCopyWithImpl<$Res, _$RookiesStateError>
    implements _$$RookiesStateErrorCopyWith<$Res> {
  __$$RookiesStateErrorCopyWithImpl(
      _$RookiesStateError _value, $Res Function(_$RookiesStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RookiesStateError implements RookiesStateError {
  const _$RookiesStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$RookiesStateError.fromJson(Map<String, dynamic> json) =>
      _$$RookiesStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RookiesState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RookiesStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Rookies rookiesLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Rookies rookiesLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Rookies rookiesLoaded)? loaded,
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
    required TResult Function(RookiesStateLoading value) loading,
    required TResult Function(RookiesStateLoaded value) loaded,
    required TResult Function(RookiesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RookiesStateLoading value)? loading,
    TResult? Function(RookiesStateLoaded value)? loaded,
    TResult? Function(RookiesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RookiesStateLoading value)? loading,
    TResult Function(RookiesStateLoaded value)? loaded,
    TResult Function(RookiesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RookiesStateErrorToJson(
      this,
    );
  }
}

abstract class RookiesStateError implements RookiesState {
  const factory RookiesStateError() = _$RookiesStateError;

  factory RookiesStateError.fromJson(Map<String, dynamic> json) =
      _$RookiesStateError.fromJson;
}
