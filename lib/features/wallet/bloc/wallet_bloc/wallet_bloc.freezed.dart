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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int amount) sendCoinsToBracer,
    required TResult Function(int amount, int userId, String message)
        sendCoinsToOtherUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int amount)? sendCoinsToBracer,
    TResult? Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int amount)? sendCoinsToBracer,
    TResult Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWalletEvent value) fetch,
    required TResult Function(WalletEventSendCoinsToBracer value)
        sendCoinsToBracer,
    required TResult Function(WalletEventSendCoinsToOtherUser value)
        sendCoinsToOtherUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchWalletEvent value)? fetch,
    TResult? Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult? Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWalletEvent value)? fetch,
    TResult Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(
          WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent>
    implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchWalletEventImplCopyWith<$Res> {
  factory _$$FetchWalletEventImplCopyWith(_$FetchWalletEventImpl value,
          $Res Function(_$FetchWalletEventImpl) then) =
      __$$FetchWalletEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchWalletEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$FetchWalletEventImpl>
    implements _$$FetchWalletEventImplCopyWith<$Res> {
  __$$FetchWalletEventImplCopyWithImpl(_$FetchWalletEventImpl _value,
      $Res Function(_$FetchWalletEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchWalletEventImpl extends FetchWalletEvent {
  const _$FetchWalletEventImpl() : super._();

  @override
  String toString() {
    return 'WalletEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchWalletEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int amount) sendCoinsToBracer,
    required TResult Function(int amount, int userId, String message)
        sendCoinsToOtherUser,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int amount)? sendCoinsToBracer,
    TResult? Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int amount)? sendCoinsToBracer,
    TResult Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
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
    required TResult Function(FetchWalletEvent value) fetch,
    required TResult Function(WalletEventSendCoinsToBracer value)
        sendCoinsToBracer,
    required TResult Function(WalletEventSendCoinsToOtherUser value)
        sendCoinsToOtherUser,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchWalletEvent value)? fetch,
    TResult? Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult? Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWalletEvent value)? fetch,
    TResult Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchWalletEvent extends WalletEvent {
  const factory FetchWalletEvent() = _$FetchWalletEventImpl;
  const FetchWalletEvent._() : super._();
}

/// @nodoc
abstract class _$$WalletEventSendCoinsToBracerImplCopyWith<$Res> {
  factory _$$WalletEventSendCoinsToBracerImplCopyWith(
          _$WalletEventSendCoinsToBracerImpl value,
          $Res Function(_$WalletEventSendCoinsToBracerImpl) then) =
      __$$WalletEventSendCoinsToBracerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$WalletEventSendCoinsToBracerImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$WalletEventSendCoinsToBracerImpl>
    implements _$$WalletEventSendCoinsToBracerImplCopyWith<$Res> {
  __$$WalletEventSendCoinsToBracerImplCopyWithImpl(
      _$WalletEventSendCoinsToBracerImpl _value,
      $Res Function(_$WalletEventSendCoinsToBracerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$WalletEventSendCoinsToBracerImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletEventSendCoinsToBracerImpl extends WalletEventSendCoinsToBracer {
  const _$WalletEventSendCoinsToBracerImpl({required this.amount}) : super._();

  @override
  final int amount;

  @override
  String toString() {
    return 'WalletEvent.sendCoinsToBracer(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEventSendCoinsToBracerImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEventSendCoinsToBracerImplCopyWith<
          _$WalletEventSendCoinsToBracerImpl>
      get copyWith => __$$WalletEventSendCoinsToBracerImplCopyWithImpl<
          _$WalletEventSendCoinsToBracerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int amount) sendCoinsToBracer,
    required TResult Function(int amount, int userId, String message)
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToBracer(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int amount)? sendCoinsToBracer,
    TResult? Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToBracer?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int amount)? sendCoinsToBracer,
    TResult Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) {
    if (sendCoinsToBracer != null) {
      return sendCoinsToBracer(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWalletEvent value) fetch,
    required TResult Function(WalletEventSendCoinsToBracer value)
        sendCoinsToBracer,
    required TResult Function(WalletEventSendCoinsToOtherUser value)
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToBracer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchWalletEvent value)? fetch,
    TResult? Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult? Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToBracer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWalletEvent value)? fetch,
    TResult Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) {
    if (sendCoinsToBracer != null) {
      return sendCoinsToBracer(this);
    }
    return orElse();
  }
}

abstract class WalletEventSendCoinsToBracer extends WalletEvent {
  const factory WalletEventSendCoinsToBracer({required final int amount}) =
      _$WalletEventSendCoinsToBracerImpl;
  const WalletEventSendCoinsToBracer._() : super._();

  int get amount;
  @JsonKey(ignore: true)
  _$$WalletEventSendCoinsToBracerImplCopyWith<
          _$WalletEventSendCoinsToBracerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletEventSendCoinsToOtherUserImplCopyWith<$Res> {
  factory _$$WalletEventSendCoinsToOtherUserImplCopyWith(
          _$WalletEventSendCoinsToOtherUserImpl value,
          $Res Function(_$WalletEventSendCoinsToOtherUserImpl) then) =
      __$$WalletEventSendCoinsToOtherUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount, int userId, String message});
}

/// @nodoc
class __$$WalletEventSendCoinsToOtherUserImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res,
        _$WalletEventSendCoinsToOtherUserImpl>
    implements _$$WalletEventSendCoinsToOtherUserImplCopyWith<$Res> {
  __$$WalletEventSendCoinsToOtherUserImplCopyWithImpl(
      _$WalletEventSendCoinsToOtherUserImpl _value,
      $Res Function(_$WalletEventSendCoinsToOtherUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? userId = null,
    Object? message = null,
  }) {
    return _then(_$WalletEventSendCoinsToOtherUserImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletEventSendCoinsToOtherUserImpl
    extends WalletEventSendCoinsToOtherUser {
  const _$WalletEventSendCoinsToOtherUserImpl(
      {required this.amount, required this.userId, required this.message})
      : super._();

  @override
  final int amount;
  @override
  final int userId;
  @override
  final String message;

  @override
  String toString() {
    return 'WalletEvent.sendCoinsToOtherUser(amount: $amount, userId: $userId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEventSendCoinsToOtherUserImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, userId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEventSendCoinsToOtherUserImplCopyWith<
          _$WalletEventSendCoinsToOtherUserImpl>
      get copyWith => __$$WalletEventSendCoinsToOtherUserImplCopyWithImpl<
          _$WalletEventSendCoinsToOtherUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int amount) sendCoinsToBracer,
    required TResult Function(int amount, int userId, String message)
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToOtherUser(amount, userId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int amount)? sendCoinsToBracer,
    TResult? Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToOtherUser?.call(amount, userId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int amount)? sendCoinsToBracer,
    TResult Function(int amount, int userId, String message)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) {
    if (sendCoinsToOtherUser != null) {
      return sendCoinsToOtherUser(amount, userId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWalletEvent value) fetch,
    required TResult Function(WalletEventSendCoinsToBracer value)
        sendCoinsToBracer,
    required TResult Function(WalletEventSendCoinsToOtherUser value)
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToOtherUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchWalletEvent value)? fetch,
    TResult? Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult? Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
  }) {
    return sendCoinsToOtherUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWalletEvent value)? fetch,
    TResult Function(WalletEventSendCoinsToBracer value)? sendCoinsToBracer,
    TResult Function(WalletEventSendCoinsToOtherUser value)?
        sendCoinsToOtherUser,
    required TResult orElse(),
  }) {
    if (sendCoinsToOtherUser != null) {
      return sendCoinsToOtherUser(this);
    }
    return orElse();
  }
}

abstract class WalletEventSendCoinsToOtherUser extends WalletEvent {
  const factory WalletEventSendCoinsToOtherUser(
      {required final int amount,
      required final int userId,
      required final String message}) = _$WalletEventSendCoinsToOtherUserImpl;
  const WalletEventSendCoinsToOtherUser._() : super._();

  int get amount;
  int get userId;
  String get message;
  @JsonKey(ignore: true)
  _$$WalletEventSendCoinsToOtherUserImplCopyWith<
          _$WalletEventSendCoinsToOtherUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
