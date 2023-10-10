// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceEvent {
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
    required TResult Function(ServiceEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEventCopyWith<$Res> {
  factory $ServiceEventCopyWith(
          ServiceEvent value, $Res Function(ServiceEvent) then) =
      _$ServiceEventCopyWithImpl<$Res, ServiceEvent>;
}

/// @nodoc
class _$ServiceEventCopyWithImpl<$Res, $Val extends ServiceEvent>
    implements $ServiceEventCopyWith<$Res> {
  _$ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceEventFetchCopyWith<$Res> {
  factory _$$ServiceEventFetchCopyWith(
          _$ServiceEventFetch value, $Res Function(_$ServiceEventFetch) then) =
      __$$ServiceEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceEventFetchCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceEventFetch>
    implements _$$ServiceEventFetchCopyWith<$Res> {
  __$$ServiceEventFetchCopyWithImpl(
      _$ServiceEventFetch _value, $Res Function(_$ServiceEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceEventFetch implements ServiceEventFetch {
  const _$ServiceEventFetch();

  @override
  String toString() {
    return 'ServiceEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceEventFetch);
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
    required TResult Function(ServiceEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class ServiceEventFetch implements ServiceEvent {
  const factory ServiceEventFetch() = _$ServiceEventFetch;
}

ServiceState _$ServiceStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return ServiceStateLoading.fromJson(json);
    case 'loaded':
      return ServiceStateLoaded.fromJson(json);
    case 'error':
      return ServiceStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ServiceState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceStateLoading value) loading,
    required TResult Function(ServiceStateLoaded value) loaded,
    required TResult Function(ServiceStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceStateLoading value)? loading,
    TResult? Function(ServiceStateLoaded value)? loaded,
    TResult? Function(ServiceStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceStateLoading value)? loading,
    TResult Function(ServiceStateLoaded value)? loaded,
    TResult Function(ServiceStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceStateLoadingCopyWith<$Res> {
  factory _$$ServiceStateLoadingCopyWith(_$ServiceStateLoading value,
          $Res Function(_$ServiceStateLoading) then) =
      __$$ServiceStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceStateLoadingCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceStateLoading>
    implements _$$ServiceStateLoadingCopyWith<$Res> {
  __$$ServiceStateLoadingCopyWithImpl(
      _$ServiceStateLoading _value, $Res Function(_$ServiceStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ServiceStateLoading implements ServiceStateLoading {
  const _$ServiceStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$ServiceStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$ServiceStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServiceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
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
    required TResult Function(ServiceStateLoading value) loading,
    required TResult Function(ServiceStateLoaded value) loaded,
    required TResult Function(ServiceStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceStateLoading value)? loading,
    TResult? Function(ServiceStateLoaded value)? loaded,
    TResult? Function(ServiceStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceStateLoading value)? loading,
    TResult Function(ServiceStateLoaded value)? loaded,
    TResult Function(ServiceStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceStateLoadingToJson(
      this,
    );
  }
}

abstract class ServiceStateLoading implements ServiceState {
  const factory ServiceStateLoading() = _$ServiceStateLoading;

  factory ServiceStateLoading.fromJson(Map<String, dynamic> json) =
      _$ServiceStateLoading.fromJson;
}

/// @nodoc
abstract class _$$ServiceStateLoadedCopyWith<$Res> {
  factory _$$ServiceStateLoadedCopyWith(_$ServiceStateLoaded value,
          $Res Function(_$ServiceStateLoaded) then) =
      __$$ServiceStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets});
}

/// @nodoc
class __$$ServiceStateLoadedCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceStateLoaded>
    implements _$$ServiceStateLoadedCopyWith<$Res> {
  __$$ServiceStateLoadedCopyWithImpl(
      _$ServiceStateLoaded _value, $Res Function(_$ServiceStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesLoaded = null,
    Object? loeadedServiceWidgets = null,
  }) {
    return _then(_$ServiceStateLoaded(
      servicesLoaded: null == servicesLoaded
          ? _value._servicesLoaded
          : servicesLoaded // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      loeadedServiceWidgets: null == loeadedServiceWidgets
          ? _value._loeadedServiceWidgets
          : loeadedServiceWidgets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceStateLoaded implements ServiceStateLoaded {
  const _$ServiceStateLoaded(
      {required final List<Service> servicesLoaded,
      required final List<dynamic> loeadedServiceWidgets,
      final String? $type})
      : _servicesLoaded = servicesLoaded,
        _loeadedServiceWidgets = loeadedServiceWidgets,
        $type = $type ?? 'loaded';

  factory _$ServiceStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$ServiceStateLoadedFromJson(json);

  final List<Service> _servicesLoaded;
  @override
  List<Service> get servicesLoaded {
    if (_servicesLoaded is EqualUnmodifiableListView) return _servicesLoaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesLoaded);
  }

  final List<dynamic> _loeadedServiceWidgets;
  @override
  List<dynamic> get loeadedServiceWidgets {
    if (_loeadedServiceWidgets is EqualUnmodifiableListView)
      return _loeadedServiceWidgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loeadedServiceWidgets);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServiceState.loaded(servicesLoaded: $servicesLoaded, loeadedServiceWidgets: $loeadedServiceWidgets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._servicesLoaded, _servicesLoaded) &&
            const DeepCollectionEquality()
                .equals(other._loeadedServiceWidgets, _loeadedServiceWidgets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_servicesLoaded),
      const DeepCollectionEquality().hash(_loeadedServiceWidgets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStateLoadedCopyWith<_$ServiceStateLoaded> get copyWith =>
      __$$ServiceStateLoadedCopyWithImpl<_$ServiceStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(servicesLoaded, loeadedServiceWidgets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(servicesLoaded, loeadedServiceWidgets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(servicesLoaded, loeadedServiceWidgets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceStateLoading value) loading,
    required TResult Function(ServiceStateLoaded value) loaded,
    required TResult Function(ServiceStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceStateLoading value)? loading,
    TResult? Function(ServiceStateLoaded value)? loaded,
    TResult? Function(ServiceStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceStateLoading value)? loading,
    TResult Function(ServiceStateLoaded value)? loaded,
    TResult Function(ServiceStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceStateLoadedToJson(
      this,
    );
  }
}

abstract class ServiceStateLoaded implements ServiceState {
  const factory ServiceStateLoaded(
          {required final List<Service> servicesLoaded,
          required final List<dynamic> loeadedServiceWidgets}) =
      _$ServiceStateLoaded;

  factory ServiceStateLoaded.fromJson(Map<String, dynamic> json) =
      _$ServiceStateLoaded.fromJson;

  List<Service> get servicesLoaded;
  List<dynamic> get loeadedServiceWidgets;
  @JsonKey(ignore: true)
  _$$ServiceStateLoadedCopyWith<_$ServiceStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceStateErrorCopyWith<$Res> {
  factory _$$ServiceStateErrorCopyWith(
          _$ServiceStateError value, $Res Function(_$ServiceStateError) then) =
      __$$ServiceStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceStateErrorCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceStateError>
    implements _$$ServiceStateErrorCopyWith<$Res> {
  __$$ServiceStateErrorCopyWithImpl(
      _$ServiceStateError _value, $Res Function(_$ServiceStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ServiceStateError implements ServiceStateError {
  const _$ServiceStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$ServiceStateError.fromJson(Map<String, dynamic> json) =>
      _$$ServiceStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServiceState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Service> servicesLoaded, List<dynamic> loeadedServiceWidgets)?
        loaded,
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
    required TResult Function(ServiceStateLoading value) loading,
    required TResult Function(ServiceStateLoaded value) loaded,
    required TResult Function(ServiceStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceStateLoading value)? loading,
    TResult? Function(ServiceStateLoaded value)? loaded,
    TResult? Function(ServiceStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceStateLoading value)? loading,
    TResult Function(ServiceStateLoaded value)? loaded,
    TResult Function(ServiceStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceStateErrorToJson(
      this,
    );
  }
}

abstract class ServiceStateError implements ServiceState {
  const factory ServiceStateError() = _$ServiceStateError;

  factory ServiceStateError.fromJson(Map<String, dynamic> json) =
      _$ServiceStateError.fromJson;
}
