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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$OneNewsEventFetchImplCopyWith<$Res>
    implements $OneNewsEventCopyWith<$Res> {
  factory _$$OneNewsEventFetchImplCopyWith(_$OneNewsEventFetchImpl value,
          $Res Function(_$OneNewsEventFetchImpl) then) =
      __$$OneNewsEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$OneNewsEventFetchImplCopyWithImpl<$Res>
    extends _$OneNewsEventCopyWithImpl<$Res, _$OneNewsEventFetchImpl>
    implements _$$OneNewsEventFetchImplCopyWith<$Res> {
  __$$OneNewsEventFetchImplCopyWithImpl(_$OneNewsEventFetchImpl _value,
      $Res Function(_$OneNewsEventFetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OneNewsEventFetchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OneNewsEventFetchImpl implements OneNewsEventFetch {
  const _$OneNewsEventFetchImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'OneNewsEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneNewsEventFetchImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneNewsEventFetchImplCopyWith<_$OneNewsEventFetchImpl> get copyWith =>
      __$$OneNewsEventFetchImplCopyWithImpl<_$OneNewsEventFetchImpl>(
          this, _$identity);

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
      _$OneNewsEventFetchImpl;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$OneNewsEventFetchImplCopyWith<_$OneNewsEventFetchImpl> get copyWith =>
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
abstract class _$$OneNewsStateLoadingImplCopyWith<$Res> {
  factory _$$OneNewsStateLoadingImplCopyWith(_$OneNewsStateLoadingImpl value,
          $Res Function(_$OneNewsStateLoadingImpl) then) =
      __$$OneNewsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OneNewsStateLoadingImplCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateLoadingImpl>
    implements _$$OneNewsStateLoadingImplCopyWith<$Res> {
  __$$OneNewsStateLoadingImplCopyWithImpl(_$OneNewsStateLoadingImpl _value,
      $Res Function(_$OneNewsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OneNewsStateLoadingImpl implements OneNewsStateLoading {
  const _$OneNewsStateLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$OneNewsStateLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneNewsStateLoadingImpl);
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
    return _$$OneNewsStateLoadingImplToJson(
      this,
    );
  }
}

abstract class OneNewsStateLoading implements OneNewsState {
  const factory OneNewsStateLoading() = _$OneNewsStateLoadingImpl;

  factory OneNewsStateLoading.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$OneNewsStateLoadedImplCopyWith<$Res> {
  factory _$$OneNewsStateLoadedImplCopyWith(_$OneNewsStateLoadedImpl value,
          $Res Function(_$OneNewsStateLoadedImpl) then) =
      __$$OneNewsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventEntity oneNewsLoaded});

  $EventEntityCopyWith<$Res> get oneNewsLoaded;
}

/// @nodoc
class __$$OneNewsStateLoadedImplCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateLoadedImpl>
    implements _$$OneNewsStateLoadedImplCopyWith<$Res> {
  __$$OneNewsStateLoadedImplCopyWithImpl(_$OneNewsStateLoadedImpl _value,
      $Res Function(_$OneNewsStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneNewsLoaded = null,
  }) {
    return _then(_$OneNewsStateLoadedImpl(
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
class _$OneNewsStateLoadedImpl implements OneNewsStateLoaded {
  const _$OneNewsStateLoadedImpl(
      {required this.oneNewsLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$OneNewsStateLoadedImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateLoadedImplFromJson(json);

  @override
  final EventEntity oneNewsLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.loaded(oneNewsLoaded: $oneNewsLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneNewsStateLoadedImpl &&
            (identical(other.oneNewsLoaded, oneNewsLoaded) ||
                other.oneNewsLoaded == oneNewsLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, oneNewsLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneNewsStateLoadedImplCopyWith<_$OneNewsStateLoadedImpl> get copyWith =>
      __$$OneNewsStateLoadedImplCopyWithImpl<_$OneNewsStateLoadedImpl>(
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
    return _$$OneNewsStateLoadedImplToJson(
      this,
    );
  }
}

abstract class OneNewsStateLoaded implements OneNewsState {
  const factory OneNewsStateLoaded({required final EventEntity oneNewsLoaded}) =
      _$OneNewsStateLoadedImpl;

  factory OneNewsStateLoaded.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateLoadedImpl.fromJson;

  EventEntity get oneNewsLoaded;
  @JsonKey(ignore: true)
  _$$OneNewsStateLoadedImplCopyWith<_$OneNewsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OneNewsStateErrorImplCopyWith<$Res> {
  factory _$$OneNewsStateErrorImplCopyWith(_$OneNewsStateErrorImpl value,
          $Res Function(_$OneNewsStateErrorImpl) then) =
      __$$OneNewsStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OneNewsStateErrorImplCopyWithImpl<$Res>
    extends _$OneNewsStateCopyWithImpl<$Res, _$OneNewsStateErrorImpl>
    implements _$$OneNewsStateErrorImplCopyWith<$Res> {
  __$$OneNewsStateErrorImplCopyWithImpl(_$OneNewsStateErrorImpl _value,
      $Res Function(_$OneNewsStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$OneNewsStateErrorImpl implements OneNewsStateError {
  const _$OneNewsStateErrorImpl({final String? $type})
      : $type = $type ?? 'error';

  factory _$OneNewsStateErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneNewsStateErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OneNewsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OneNewsStateErrorImpl);
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
    return _$$OneNewsStateErrorImplToJson(
      this,
    );
  }
}

abstract class OneNewsStateError implements OneNewsState {
  const factory OneNewsStateError() = _$OneNewsStateErrorImpl;

  factory OneNewsStateError.fromJson(Map<String, dynamic> json) =
      _$OneNewsStateErrorImpl.fromJson;
}
