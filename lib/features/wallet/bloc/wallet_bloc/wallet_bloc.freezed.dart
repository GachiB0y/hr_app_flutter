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
abstract class _$$FetchWalletEventCopyWith<$Res> {
  factory _$$FetchWalletEventCopyWith(
          _$FetchWalletEvent value, $Res Function(_$FetchWalletEvent) then) =
      __$$FetchWalletEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchWalletEventCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$FetchWalletEvent>
    implements _$$FetchWalletEventCopyWith<$Res> {
  __$$FetchWalletEventCopyWithImpl(
      _$FetchWalletEvent _value, $Res Function(_$FetchWalletEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchWalletEvent extends FetchWalletEvent {
  const _$FetchWalletEvent() : super._();

  @override
  String toString() {
    return 'WalletEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchWalletEvent);
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
  const factory FetchWalletEvent() = _$FetchWalletEvent;
  const FetchWalletEvent._() : super._();
}

/// @nodoc
abstract class _$$WalletEventSendCoinsToBracerCopyWith<$Res> {
  factory _$$WalletEventSendCoinsToBracerCopyWith(
          _$WalletEventSendCoinsToBracer value,
          $Res Function(_$WalletEventSendCoinsToBracer) then) =
      __$$WalletEventSendCoinsToBracerCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$WalletEventSendCoinsToBracerCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$WalletEventSendCoinsToBracer>
    implements _$$WalletEventSendCoinsToBracerCopyWith<$Res> {
  __$$WalletEventSendCoinsToBracerCopyWithImpl(
      _$WalletEventSendCoinsToBracer _value,
      $Res Function(_$WalletEventSendCoinsToBracer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$WalletEventSendCoinsToBracer(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletEventSendCoinsToBracer extends WalletEventSendCoinsToBracer {
  const _$WalletEventSendCoinsToBracer({required this.amount}) : super._();

  @override
  final int amount;

  @override
  String toString() {
    return 'WalletEvent.sendCoinsToBracer(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEventSendCoinsToBracer &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEventSendCoinsToBracerCopyWith<_$WalletEventSendCoinsToBracer>
      get copyWith => __$$WalletEventSendCoinsToBracerCopyWithImpl<
          _$WalletEventSendCoinsToBracer>(this, _$identity);

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
      _$WalletEventSendCoinsToBracer;
  const WalletEventSendCoinsToBracer._() : super._();

  int get amount;
  @JsonKey(ignore: true)
  _$$WalletEventSendCoinsToBracerCopyWith<_$WalletEventSendCoinsToBracer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletEventSendCoinsToOtherUserCopyWith<$Res> {
  factory _$$WalletEventSendCoinsToOtherUserCopyWith(
          _$WalletEventSendCoinsToOtherUser value,
          $Res Function(_$WalletEventSendCoinsToOtherUser) then) =
      __$$WalletEventSendCoinsToOtherUserCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount, int userId, String message});
}

/// @nodoc
class __$$WalletEventSendCoinsToOtherUserCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$WalletEventSendCoinsToOtherUser>
    implements _$$WalletEventSendCoinsToOtherUserCopyWith<$Res> {
  __$$WalletEventSendCoinsToOtherUserCopyWithImpl(
      _$WalletEventSendCoinsToOtherUser _value,
      $Res Function(_$WalletEventSendCoinsToOtherUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? userId = null,
    Object? message = null,
  }) {
    return _then(_$WalletEventSendCoinsToOtherUser(
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

class _$WalletEventSendCoinsToOtherUser
    extends WalletEventSendCoinsToOtherUser {
  const _$WalletEventSendCoinsToOtherUser(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEventSendCoinsToOtherUser &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, userId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEventSendCoinsToOtherUserCopyWith<_$WalletEventSendCoinsToOtherUser>
      get copyWith => __$$WalletEventSendCoinsToOtherUserCopyWithImpl<
          _$WalletEventSendCoinsToOtherUser>(this, _$identity);

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
      required final String message}) = _$WalletEventSendCoinsToOtherUser;
  const WalletEventSendCoinsToOtherUser._() : super._();

  int get amount;
  int get userId;
  String get message;
  @JsonKey(ignore: true)
  _$$WalletEventSendCoinsToOtherUserCopyWith<_$WalletEventSendCoinsToOtherUser>
      get copyWith => throw _privateConstructorUsedError;
}
