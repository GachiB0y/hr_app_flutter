// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OneNewsEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneNewsEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OneNewsEventCopyWith<OneNewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneNewsEventCopyWith<$Res> {
  factory $OneNewsEventCopyWith(
          OneNewsEvent value, $Res Function(OneNewsEvent) then) =
      _$OneNewsEventCopyWithImpl<$Res, OneNewsEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$OneNewsEventCopyWithImpl<$Res, $Val extends OneNewsEvent>
    implements $OneNewsEventCopyWith<$Res> {
  _$OneNewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneNewsEventFetchCopyWith<$Res>
    implements $OneNewsEventCopyWith<$Res> {
  factory _$$OneNewsEventFetchCopyWith(
          _$OneNewsEventFetch value, $Res Function(_$OneNewsEventFetch) then) =
      __$$OneNewsEventFetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$OneNewsEventFetchCopyWithImpl<$Res>
    extends _$OneNewsEventCopyWithImpl<$Res, _$OneNewsEventFetch>
    implements _$$OneNewsEventFetchCopyWith<$Res> {
  __$$OneNewsEventFetchCopyWithImpl(
      _$OneNewsEventFetch _value, $Res Function(_$OneNewsEventFetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OneNewsEventFetch(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OneNewsEventFetch implements OneNewsEventFetch {
  const _$OneNewsEventFetch({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'OneNewsEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneNewsEventFetch &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneNewsEventFetchCopyWith<_$OneNewsEventFetch> get copyWith =>
      __$$OneNewsEventFetchCopyWithImpl<_$OneNewsEventFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneNewsEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class OneNewsEventFetch implements OneNewsEvent {
  const factory OneNewsEventFetch({required final String id}) =
      _$OneNewsEventFetch;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$OneNewsEventFetchCopyWith<_$OneNewsEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

OneNewsState _$OneNewsStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return OneNewsStateLoading.fromJson(json);
    case 'loaded':
      return OneNewsStateLoaded.fromJson(json);
    case 'error':
      return OneNewsStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OneNewsState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OneNewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EventEntity oneNewsLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(EventEntity oneNewsLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEntity oneNewsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneNewsStateLoading value) loading,
    required TResult Function(OneNewsStateLoaded value) loaded,
    required TResult Function(OneNewsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsStateLoading value)? loading,
    TResult? Function(OneNewsStateLoaded value)? loaded,
    TResult? Function(OneNewsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsStateLoading value)? loading,
    TResult Function(OneNewsStateLoaded value)? loaded,
    TResult Function(OneNewsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneNewsStateCopyWith<$Res> {
  factory $OneNewsStateCopyWith(
          OneNewsState value, $Res Function(OneNewsState) then) =
      _$OneNewsStateCopyWithImpl<$Res, OneNewsState>;
}

/// @nodoc
class _$OneNewsStateCopyWithImpl<$Res, $Val extends OneNewsState>
    implements $OneNewsStateCopyWith<$Res> {
  _$OneNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OneNewsStateLoadingCopyWith<$Res> {
  factory _$$OneNewsStateLoadingCopyWith(_$OneNewsStateLoading value,
          $Res Function(_$OneNewsStateLoading) then) =
      __$$OneNewsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OneNewsStateLoadingCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateLoading>
    implements _$$OneNewsStateLoadingCopyWith<$Res> {
  __$$OneNewsStateLoadingCopyWithImpl(
      _$OneNewsStateLoading _value, $Res Function(_$OneNewsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OneNewsStateLoading implements OneNewsStateLoading {
  const _$OneNewsStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$OneNewsStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OneNewsStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EventEntity oneNewsLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(EventEntity oneNewsLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEntity oneNewsLoaded)? loaded,
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
    required TResult Function(OneNewsStateLoading value) loading,
    required TResult Function(OneNewsStateLoaded value) loaded,
    required TResult Function(OneNewsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsStateLoading value)? loading,
    TResult? Function(OneNewsStateLoaded value)? loaded,
    TResult? Function(OneNewsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsStateLoading value)? loading,
    TResult Function(OneNewsStateLoaded value)? loaded,
    TResult Function(OneNewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OneNewsStateLoadingToJson(
      this,
    );
  }
}

abstract class OneNewsStateLoading implements OneNewsState {
  const factory OneNewsStateLoading() = _$OneNewsStateLoading;

  factory OneNewsStateLoading.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateLoading.fromJson;
}

/// @nodoc
abstract class _$$OneNewsStateLoadedCopyWith<$Res> {
  factory _$$OneNewsStateLoadedCopyWith(_$OneNewsStateLoaded value,
          $Res Function(_$OneNewsStateLoaded) then) =
      __$$OneNewsStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({EventEntity oneNewsLoaded});

  $EventEntityCopyWith<$Res> get oneNewsLoaded;
}

/// @nodoc
class __$$OneNewsStateLoadedCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateLoaded>
    implements _$$OneNewsStateLoadedCopyWith<$Res> {
  __$$OneNewsStateLoadedCopyWithImpl(
      _$OneNewsStateLoaded _value, $Res Function(_$OneNewsStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneNewsLoaded = null,
  }) {
    return _then(_$OneNewsStateLoaded(
      oneNewsLoaded: null == oneNewsLoaded
          ? _value.oneNewsLoaded
          : oneNewsLoaded // ignore: cast_nullable_to_non_nullable
              as EventEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EventEntityCopyWith<$Res> get oneNewsLoaded {
    return $EventEntityCopyWith<$Res>(_value.oneNewsLoaded, (value) {
      return _then(_value.copyWith(oneNewsLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$OneNewsStateLoaded implements OneNewsStateLoaded {
  const _$OneNewsStateLoaded({required this.oneNewsLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$OneNewsStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateLoadedFromJson(json);

  @override
  final EventEntity oneNewsLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.loaded(oneNewsLoaded: $oneNewsLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneNewsStateLoaded &&
            (identical(other.oneNewsLoaded, oneNewsLoaded) ||
                other.oneNewsLoaded == oneNewsLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, oneNewsLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneNewsStateLoadedCopyWith<_$OneNewsStateLoaded> get copyWith =>
      __$$OneNewsStateLoadedCopyWithImpl<_$OneNewsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EventEntity oneNewsLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(oneNewsLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(EventEntity oneNewsLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(oneNewsLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEntity oneNewsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(oneNewsLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneNewsStateLoading value) loading,
    required TResult Function(OneNewsStateLoaded value) loaded,
    required TResult Function(OneNewsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsStateLoading value)? loading,
    TResult? Function(OneNewsStateLoaded value)? loaded,
    TResult? Function(OneNewsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsStateLoading value)? loading,
    TResult Function(OneNewsStateLoaded value)? loaded,
    TResult Function(OneNewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OneNewsStateLoadedToJson(
      this,
    );
  }
}

abstract class OneNewsStateLoaded implements OneNewsState {
  const factory OneNewsStateLoaded({required final EventEntity oneNewsLoaded}) =
      _$OneNewsStateLoaded;

  factory OneNewsStateLoaded.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateLoaded.fromJson;

  EventEntity get oneNewsLoaded;
  @JsonKey(ignore: true)
  _$$OneNewsStateLoadedCopyWith<_$OneNewsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OneNewsStateErrorCopyWith<$Res> {
  factory _$$OneNewsStateErrorCopyWith(
          _$OneNewsStateError value, $Res Function(_$OneNewsStateError) then) =
      __$$OneNewsStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OneNewsStateErrorCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateError>
    implements _$$OneNewsStateErrorCopyWith<$Res> {
  __$$OneNewsStateErrorCopyWithImpl(
      _$OneNewsStateError _value, $Res Function(_$OneNewsStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OneNewsStateError implements OneNewsStateError {
  const _$OneNewsStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$OneNewsStateError.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OneNewsStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EventEntity oneNewsLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(EventEntity oneNewsLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEntity oneNewsLoaded)? loaded,
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
    required TResult Function(OneNewsStateLoading value) loading,
    required TResult Function(OneNewsStateLoaded value) loaded,
    required TResult Function(OneNewsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneNewsStateLoading value)? loading,
    TResult? Function(OneNewsStateLoaded value)? loaded,
    TResult? Function(OneNewsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneNewsStateLoading value)? loading,
    TResult Function(OneNewsStateLoaded value)? loaded,
    TResult Function(OneNewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OneNewsStateErrorToJson(
      this,
    );
  }
}

abstract class OneNewsStateError implements OneNewsState {
  const factory OneNewsStateError() = _$OneNewsStateError;

  factory OneNewsStateError.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateError.fromJson;
}
