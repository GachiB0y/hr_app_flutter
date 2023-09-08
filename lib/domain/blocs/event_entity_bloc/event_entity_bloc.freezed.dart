// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventEntityEvent {
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
    required TResult Function(EventEntityEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityEventCopyWith<$Res> {
  factory $EventEntityEventCopyWith(
          EventEntityEvent value, $Res Function(EventEntityEvent) then) =
      _$EventEntityEventCopyWithImpl<$Res, EventEntityEvent>;
}

/// @nodoc
class _$EventEntityEventCopyWithImpl<$Res, $Val extends EventEntityEvent>
    implements $EventEntityEventCopyWith<$Res> {
  _$EventEntityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventEntityEventFetchCopyWith<$Res> {
  factory _$$EventEntityEventFetchCopyWith(_$EventEntityEventFetch value,
          $Res Function(_$EventEntityEventFetch) then) =
      __$$EventEntityEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityEventFetchCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventFetch>
    implements _$$EventEntityEventFetchCopyWith<$Res> {
  __$$EventEntityEventFetchCopyWithImpl(_$EventEntityEventFetch _value,
      $Res Function(_$EventEntityEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventEntityEventFetch implements EventEntityEventFetch {
  const _$EventEntityEventFetch();

  @override
  String toString() {
    return 'EventEntityEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventEntityEventFetch);
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
    required TResult Function(EventEntityEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventFetch implements EventEntityEvent {
  const factory EventEntityEventFetch() = _$EventEntityEventFetch;
}

EventEntityState _$EventEntityStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return EventEntityStateLoading.fromJson(json);
    case 'loaded':
      return EventEntityStateLoaded.fromJson(json);
    case 'error':
      return EventEntityStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EventEntityState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EventEntityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityStateCopyWith<$Res> {
  factory $EventEntityStateCopyWith(
          EventEntityState value, $Res Function(EventEntityState) then) =
      _$EventEntityStateCopyWithImpl<$Res, EventEntityState>;
}

/// @nodoc
class _$EventEntityStateCopyWithImpl<$Res, $Val extends EventEntityState>
    implements $EventEntityStateCopyWith<$Res> {
  _$EventEntityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventEntityStateLoadingCopyWith<$Res> {
  factory _$$EventEntityStateLoadingCopyWith(_$EventEntityStateLoading value,
          $Res Function(_$EventEntityStateLoading) then) =
      __$$EventEntityStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityStateLoadingCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateLoading>
    implements _$$EventEntityStateLoadingCopyWith<$Res> {
  __$$EventEntityStateLoadingCopyWithImpl(_$EventEntityStateLoading _value,
      $Res Function(_$EventEntityStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EventEntityStateLoading implements EventEntityStateLoading {
  const _$EventEntityStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$EventEntityStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded)? loaded,
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
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateLoadingToJson(
      this,
    );
  }
}

abstract class EventEntityStateLoading implements EventEntityState {
  const factory EventEntityStateLoading() = _$EventEntityStateLoading;

  factory EventEntityStateLoading.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateLoading.fromJson;
}

/// @nodoc
abstract class _$$EventEntityStateLoadedCopyWith<$Res> {
  factory _$$EventEntityStateLoadedCopyWith(_$EventEntityStateLoaded value,
          $Res Function(_$EventEntityStateLoaded) then) =
      __$$EventEntityStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EventEntity> listEventEntityLoaded});
}

/// @nodoc
class __$$EventEntityStateLoadedCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateLoaded>
    implements _$$EventEntityStateLoadedCopyWith<$Res> {
  __$$EventEntityStateLoadedCopyWithImpl(_$EventEntityStateLoaded _value,
      $Res Function(_$EventEntityStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEventEntityLoaded = null,
  }) {
    return _then(_$EventEntityStateLoaded(
      listEventEntityLoaded: null == listEventEntityLoaded
          ? _value._listEventEntityLoaded
          : listEventEntityLoaded // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventEntityStateLoaded implements EventEntityStateLoaded {
  const _$EventEntityStateLoaded(
      {required final List<EventEntity> listEventEntityLoaded,
      final String? $type})
      : _listEventEntityLoaded = listEventEntityLoaded,
        $type = $type ?? 'loaded';

  factory _$EventEntityStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateLoadedFromJson(json);

  final List<EventEntity> _listEventEntityLoaded;
  @override
  List<EventEntity> get listEventEntityLoaded {
    if (_listEventEntityLoaded is EqualUnmodifiableListView)
      return _listEventEntityLoaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listEventEntityLoaded);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.loaded(listEventEntityLoaded: $listEventEntityLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._listEventEntityLoaded, _listEventEntityLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listEventEntityLoaded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityStateLoadedCopyWith<_$EventEntityStateLoaded> get copyWith =>
      __$$EventEntityStateLoadedCopyWithImpl<_$EventEntityStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(listEventEntityLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(listEventEntityLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listEventEntityLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateLoadedToJson(
      this,
    );
  }
}

abstract class EventEntityStateLoaded implements EventEntityState {
  const factory EventEntityStateLoaded(
          {required final List<EventEntity> listEventEntityLoaded}) =
      _$EventEntityStateLoaded;

  factory EventEntityStateLoaded.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateLoaded.fromJson;

  List<EventEntity> get listEventEntityLoaded;
  @JsonKey(ignore: true)
  _$$EventEntityStateLoadedCopyWith<_$EventEntityStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventEntityStateErrorCopyWith<$Res> {
  factory _$$EventEntityStateErrorCopyWith(_$EventEntityStateError value,
          $Res Function(_$EventEntityStateError) then) =
      __$$EventEntityStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityStateErrorCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateError>
    implements _$$EventEntityStateErrorCopyWith<$Res> {
  __$$EventEntityStateErrorCopyWithImpl(_$EventEntityStateError _value,
      $Res Function(_$EventEntityStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EventEntityStateError implements EventEntityStateError {
  const _$EventEntityStateError({final String? $type})
      : $type = $type ?? 'error';

  factory _$EventEntityStateError.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventEntityStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded)? loaded,
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
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateErrorToJson(
      this,
    );
  }
}

abstract class EventEntityStateError implements EventEntityState {
  const factory EventEntityStateError() = _$EventEntityStateError;

  factory EventEntityStateError.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateError.fromJson;
}