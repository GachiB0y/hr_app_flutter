// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_bus_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleBusEvent {
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
    required TResult Function(ScheduleBusEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBusEventCopyWith<$Res> {
  factory $ScheduleBusEventCopyWith(
          ScheduleBusEvent value, $Res Function(ScheduleBusEvent) then) =
      _$ScheduleBusEventCopyWithImpl<$Res, ScheduleBusEvent>;
}

/// @nodoc
class _$ScheduleBusEventCopyWithImpl<$Res, $Val extends ScheduleBusEvent>
    implements $ScheduleBusEventCopyWith<$Res> {
  _$ScheduleBusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScheduleBusEventFetchCopyWith<$Res> {
  factory _$$ScheduleBusEventFetchCopyWith(_$ScheduleBusEventFetch value,
          $Res Function(_$ScheduleBusEventFetch) then) =
      __$$ScheduleBusEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScheduleBusEventFetchCopyWithImpl<$Res>
    extends _$ScheduleBusEventCopyWithImpl<$Res, _$ScheduleBusEventFetch>
    implements _$$ScheduleBusEventFetchCopyWith<$Res> {
  __$$ScheduleBusEventFetchCopyWithImpl(_$ScheduleBusEventFetch _value,
      $Res Function(_$ScheduleBusEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScheduleBusEventFetch implements ScheduleBusEventFetch {
  const _$ScheduleBusEventFetch();

  @override
  String toString() {
    return 'ScheduleBusEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScheduleBusEventFetch);
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
    required TResult Function(ScheduleBusEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class ScheduleBusEventFetch implements ScheduleBusEvent {
  const factory ScheduleBusEventFetch() = _$ScheduleBusEventFetch;
}

ScheduleBusState _$ScheduleBusStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return ScheduleBusStateLoading.fromJson(json);
    case 'loaded':
      return ScheduleBusStateLoaded.fromJson(json);
    case 'error':
      return ScheduleBusStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ScheduleBusState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ScheduleBusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ScheduleBus scheduleBusLoaded) loaded,
    required TResult Function(String? errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult? Function(String? errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleBusStateLoading value) loading,
    required TResult Function(ScheduleBusStateLoaded value) loaded,
    required TResult Function(ScheduleBusStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusStateLoading value)? loading,
    TResult? Function(ScheduleBusStateLoaded value)? loaded,
    TResult? Function(ScheduleBusStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusStateLoading value)? loading,
    TResult Function(ScheduleBusStateLoaded value)? loaded,
    TResult Function(ScheduleBusStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBusStateCopyWith<$Res> {
  factory $ScheduleBusStateCopyWith(
          ScheduleBusState value, $Res Function(ScheduleBusState) then) =
      _$ScheduleBusStateCopyWithImpl<$Res, ScheduleBusState>;
}

/// @nodoc
class _$ScheduleBusStateCopyWithImpl<$Res, $Val extends ScheduleBusState>
    implements $ScheduleBusStateCopyWith<$Res> {
  _$ScheduleBusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScheduleBusStateLoadingCopyWith<$Res> {
  factory _$$ScheduleBusStateLoadingCopyWith(_$ScheduleBusStateLoading value,
          $Res Function(_$ScheduleBusStateLoading) then) =
      __$$ScheduleBusStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScheduleBusStateLoadingCopyWithImpl<$Res>
    extends _$ScheduleBusStateCopyWithImpl<$Res, _$ScheduleBusStateLoading>
    implements _$$ScheduleBusStateLoadingCopyWith<$Res> {
  __$$ScheduleBusStateLoadingCopyWithImpl(_$ScheduleBusStateLoading _value,
      $Res Function(_$ScheduleBusStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ScheduleBusStateLoading implements ScheduleBusStateLoading {
  const _$ScheduleBusStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$ScheduleBusStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleBusStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScheduleBusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleBusStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ScheduleBus scheduleBusLoaded) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult Function(String? errorText)? error,
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
    required TResult Function(ScheduleBusStateLoading value) loading,
    required TResult Function(ScheduleBusStateLoaded value) loaded,
    required TResult Function(ScheduleBusStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusStateLoading value)? loading,
    TResult? Function(ScheduleBusStateLoaded value)? loaded,
    TResult? Function(ScheduleBusStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusStateLoading value)? loading,
    TResult Function(ScheduleBusStateLoaded value)? loaded,
    TResult Function(ScheduleBusStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleBusStateLoadingToJson(
      this,
    );
  }
}

abstract class ScheduleBusStateLoading implements ScheduleBusState {
  const factory ScheduleBusStateLoading() = _$ScheduleBusStateLoading;

  factory ScheduleBusStateLoading.fromJson(Map<String, dynamic> json) =
      _$ScheduleBusStateLoading.fromJson;
}

/// @nodoc
abstract class _$$ScheduleBusStateLoadedCopyWith<$Res> {
  factory _$$ScheduleBusStateLoadedCopyWith(_$ScheduleBusStateLoaded value,
          $Res Function(_$ScheduleBusStateLoaded) then) =
      __$$ScheduleBusStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduleBus scheduleBusLoaded});

  $ScheduleBusCopyWith<$Res> get scheduleBusLoaded;
}

/// @nodoc
class __$$ScheduleBusStateLoadedCopyWithImpl<$Res>
    extends _$ScheduleBusStateCopyWithImpl<$Res, _$ScheduleBusStateLoaded>
    implements _$$ScheduleBusStateLoadedCopyWith<$Res> {
  __$$ScheduleBusStateLoadedCopyWithImpl(_$ScheduleBusStateLoaded _value,
      $Res Function(_$ScheduleBusStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleBusLoaded = null,
  }) {
    return _then(_$ScheduleBusStateLoaded(
      scheduleBusLoaded: null == scheduleBusLoaded
          ? _value.scheduleBusLoaded
          : scheduleBusLoaded // ignore: cast_nullable_to_non_nullable
              as ScheduleBus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleBusCopyWith<$Res> get scheduleBusLoaded {
    return $ScheduleBusCopyWith<$Res>(_value.scheduleBusLoaded, (value) {
      return _then(_value.copyWith(scheduleBusLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleBusStateLoaded implements ScheduleBusStateLoaded {
  const _$ScheduleBusStateLoaded(
      {required this.scheduleBusLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$ScheduleBusStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleBusStateLoadedFromJson(json);

  @override
  final ScheduleBus scheduleBusLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScheduleBusState.loaded(scheduleBusLoaded: $scheduleBusLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleBusStateLoaded &&
            (identical(other.scheduleBusLoaded, scheduleBusLoaded) ||
                other.scheduleBusLoaded == scheduleBusLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scheduleBusLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleBusStateLoadedCopyWith<_$ScheduleBusStateLoaded> get copyWith =>
      __$$ScheduleBusStateLoadedCopyWithImpl<_$ScheduleBusStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ScheduleBus scheduleBusLoaded) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loaded(scheduleBusLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loaded?.call(scheduleBusLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(scheduleBusLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleBusStateLoading value) loading,
    required TResult Function(ScheduleBusStateLoaded value) loaded,
    required TResult Function(ScheduleBusStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusStateLoading value)? loading,
    TResult? Function(ScheduleBusStateLoaded value)? loaded,
    TResult? Function(ScheduleBusStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusStateLoading value)? loading,
    TResult Function(ScheduleBusStateLoaded value)? loaded,
    TResult Function(ScheduleBusStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleBusStateLoadedToJson(
      this,
    );
  }
}

abstract class ScheduleBusStateLoaded implements ScheduleBusState {
  const factory ScheduleBusStateLoaded(
          {required final ScheduleBus scheduleBusLoaded}) =
      _$ScheduleBusStateLoaded;

  factory ScheduleBusStateLoaded.fromJson(Map<String, dynamic> json) =
      _$ScheduleBusStateLoaded.fromJson;

  ScheduleBus get scheduleBusLoaded;
  @JsonKey(ignore: true)
  _$$ScheduleBusStateLoadedCopyWith<_$ScheduleBusStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScheduleBusStateErrorCopyWith<$Res> {
  factory _$$ScheduleBusStateErrorCopyWith(_$ScheduleBusStateError value,
          $Res Function(_$ScheduleBusStateError) then) =
      __$$ScheduleBusStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$ScheduleBusStateErrorCopyWithImpl<$Res>
    extends _$ScheduleBusStateCopyWithImpl<$Res, _$ScheduleBusStateError>
    implements _$$ScheduleBusStateErrorCopyWith<$Res> {
  __$$ScheduleBusStateErrorCopyWithImpl(_$ScheduleBusStateError _value,
      $Res Function(_$ScheduleBusStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$ScheduleBusStateError(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleBusStateError implements ScheduleBusStateError {
  const _$ScheduleBusStateError({this.errorText, final String? $type})
      : $type = $type ?? 'error';

  factory _$ScheduleBusStateError.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleBusStateErrorFromJson(json);

  @override
  final String? errorText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScheduleBusState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleBusStateError &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleBusStateErrorCopyWith<_$ScheduleBusStateError> get copyWith =>
      __$$ScheduleBusStateErrorCopyWithImpl<_$ScheduleBusStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ScheduleBus scheduleBusLoaded) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ScheduleBus scheduleBusLoaded)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleBusStateLoading value) loading,
    required TResult Function(ScheduleBusStateLoaded value) loaded,
    required TResult Function(ScheduleBusStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleBusStateLoading value)? loading,
    TResult? Function(ScheduleBusStateLoaded value)? loaded,
    TResult? Function(ScheduleBusStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleBusStateLoading value)? loading,
    TResult Function(ScheduleBusStateLoaded value)? loaded,
    TResult Function(ScheduleBusStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleBusStateErrorToJson(
      this,
    );
  }
}

abstract class ScheduleBusStateError implements ScheduleBusState {
  const factory ScheduleBusStateError({final String? errorText}) =
      _$ScheduleBusStateError;

  factory ScheduleBusStateError.fromJson(Map<String, dynamic> json) =
      _$ScheduleBusStateError.fromJson;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$ScheduleBusStateErrorCopyWith<_$ScheduleBusStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
