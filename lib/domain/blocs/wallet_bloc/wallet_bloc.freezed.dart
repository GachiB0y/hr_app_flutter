// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletEvent {
  String get userToken => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userToken) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userToken)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userToken)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletEventCopyWith<WalletEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(
          WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
  @useResult
  $Res call({String userToken});
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent>
    implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToken = null,
  }) {
    return _then(_value.copyWith(
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletEventFetchCopyWith<$Res>
    implements $WalletEventCopyWith<$Res> {
  factory _$$WalletEventFetchCopyWith(
          _$WalletEventFetch value, $Res Function(_$WalletEventFetch) then) =
      __$$WalletEventFetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userToken});
}

/// @nodoc
class __$$WalletEventFetchCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$WalletEventFetch>
    implements _$$WalletEventFetchCopyWith<$Res> {
  __$$WalletEventFetchCopyWithImpl(
      _$WalletEventFetch _value, $Res Function(_$WalletEventFetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToken = null,
  }) {
    return _then(_$WalletEventFetch(
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletEventFetch implements WalletEventFetch {
  const _$WalletEventFetch({required this.userToken});

  @override
  final String userToken;

  @override
  String toString() {
    return 'WalletEvent.fetch(userToken: $userToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEventFetch &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEventFetchCopyWith<_$WalletEventFetch> get copyWith =>
      __$$WalletEventFetchCopyWithImpl<_$WalletEventFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userToken) fetch,
  }) {
    return fetch(userToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userToken)? fetch,
  }) {
    return fetch?.call(userToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userToken)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(userToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class WalletEventFetch implements WalletEvent {
  const factory WalletEventFetch({required final String userToken}) =
      _$WalletEventFetch;

  @override
  String get userToken;
  @override
  @JsonKey(ignore: true)
  _$$WalletEventFetchCopyWith<_$WalletEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletState _$WalletStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return WalletStateLoading.fromJson(json);
    case 'loaded':
      return WalletStateLoaded.fromJson(json);
    case 'error':
      return WalletStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'WalletState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$WalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Wallet walletLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Wallet walletLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Wallet walletLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateLoaded value) loaded,
    required TResult Function(WalletStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletStateLoading value)? loading,
    TResult? Function(WalletStateLoaded value)? loaded,
    TResult? Function(WalletStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateLoaded value)? loaded,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WalletStateLoadingCopyWith<$Res> {
  factory _$$WalletStateLoadingCopyWith(_$WalletStateLoading value,
          $Res Function(_$WalletStateLoading) then) =
      __$$WalletStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletStateLoadingCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateLoading>
    implements _$$WalletStateLoadingCopyWith<$Res> {
  __$$WalletStateLoadingCopyWithImpl(
      _$WalletStateLoading _value, $Res Function(_$WalletStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$WalletStateLoading implements WalletStateLoading {
  const _$WalletStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$WalletStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$WalletStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WalletState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Wallet walletLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Wallet walletLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Wallet walletLoaded)? loaded,
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
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateLoaded value) loaded,
    required TResult Function(WalletStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletStateLoading value)? loading,
    TResult? Function(WalletStateLoaded value)? loaded,
    TResult? Function(WalletStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateLoaded value)? loaded,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletStateLoadingToJson(
      this,
    );
  }
}

abstract class WalletStateLoading implements WalletState {
  const factory WalletStateLoading() = _$WalletStateLoading;

  factory WalletStateLoading.fromJson(Map<String, dynamic> json) =
      _$WalletStateLoading.fromJson;
}

/// @nodoc
abstract class _$$WalletStateLoadedCopyWith<$Res> {
  factory _$$WalletStateLoadedCopyWith(
          _$WalletStateLoaded value, $Res Function(_$WalletStateLoaded) then) =
      __$$WalletStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Wallet walletLoaded});

  $WalletCopyWith<$Res> get walletLoaded;
}

/// @nodoc
class __$$WalletStateLoadedCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateLoaded>
    implements _$$WalletStateLoadedCopyWith<$Res> {
  __$$WalletStateLoadedCopyWithImpl(
      _$WalletStateLoaded _value, $Res Function(_$WalletStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletLoaded = null,
  }) {
    return _then(_$WalletStateLoaded(
      walletLoaded: null == walletLoaded
          ? _value.walletLoaded
          : walletLoaded // ignore: cast_nullable_to_non_nullable
              as Wallet,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res> get walletLoaded {
    return $WalletCopyWith<$Res>(_value.walletLoaded, (value) {
      return _then(_value.copyWith(walletLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletStateLoaded implements WalletStateLoaded {
  const _$WalletStateLoaded({required this.walletLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$WalletStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$WalletStateLoadedFromJson(json);

  @override
  final Wallet walletLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WalletState.loaded(walletLoaded: $walletLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateLoaded &&
            (identical(other.walletLoaded, walletLoaded) ||
                other.walletLoaded == walletLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, walletLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletStateLoadedCopyWith<_$WalletStateLoaded> get copyWith =>
      __$$WalletStateLoadedCopyWithImpl<_$WalletStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Wallet walletLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(walletLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Wallet walletLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(walletLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Wallet walletLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(walletLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateLoaded value) loaded,
    required TResult Function(WalletStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletStateLoading value)? loading,
    TResult? Function(WalletStateLoaded value)? loaded,
    TResult? Function(WalletStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateLoaded value)? loaded,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletStateLoadedToJson(
      this,
    );
  }
}

abstract class WalletStateLoaded implements WalletState {
  const factory WalletStateLoaded({required final Wallet walletLoaded}) =
      _$WalletStateLoaded;

  factory WalletStateLoaded.fromJson(Map<String, dynamic> json) =
      _$WalletStateLoaded.fromJson;

  Wallet get walletLoaded;
  @JsonKey(ignore: true)
  _$$WalletStateLoadedCopyWith<_$WalletStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletStateErrorCopyWith<$Res> {
  factory _$$WalletStateErrorCopyWith(
          _$WalletStateError value, $Res Function(_$WalletStateError) then) =
      __$$WalletStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletStateErrorCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateError>
    implements _$$WalletStateErrorCopyWith<$Res> {
  __$$WalletStateErrorCopyWithImpl(
      _$WalletStateError _value, $Res Function(_$WalletStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$WalletStateError implements WalletStateError {
  const _$WalletStateError({final String? $type}) : $type = $type ?? 'error';

  factory _$WalletStateError.fromJson(Map<String, dynamic> json) =>
      _$$WalletStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WalletState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Wallet walletLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Wallet walletLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Wallet walletLoaded)? loaded,
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
    required TResult Function(WalletStateLoading value) loading,
    required TResult Function(WalletStateLoaded value) loaded,
    required TResult Function(WalletStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletStateLoading value)? loading,
    TResult? Function(WalletStateLoaded value)? loaded,
    TResult? Function(WalletStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletStateLoading value)? loading,
    TResult Function(WalletStateLoaded value)? loaded,
    TResult Function(WalletStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletStateErrorToJson(
      this,
    );
  }
}

abstract class WalletStateError implements WalletState {
  const factory WalletStateError() = _$WalletStateError;

  factory WalletStateError.fromJson(Map<String, dynamic> json) =
      _$WalletStateError.fromJson;
}
