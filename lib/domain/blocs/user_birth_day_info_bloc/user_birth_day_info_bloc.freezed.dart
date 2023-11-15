// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_birth_day_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserBirthDayInfoEvent {
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
    required TResult Function(UserBirthDayInfoEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBirthDayInfoEventCopyWith<$Res> {
  factory $UserBirthDayInfoEventCopyWith(UserBirthDayInfoEvent value,
          $Res Function(UserBirthDayInfoEvent) then) =
      _$UserBirthDayInfoEventCopyWithImpl<$Res, UserBirthDayInfoEvent>;
}

/// @nodoc
class _$UserBirthDayInfoEventCopyWithImpl<$Res,
        $Val extends UserBirthDayInfoEvent>
    implements $UserBirthDayInfoEventCopyWith<$Res> {
  _$UserBirthDayInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserBirthDayInfoEventFetchCopyWith<$Res> {
  factory _$$UserBirthDayInfoEventFetchCopyWith(
          _$UserBirthDayInfoEventFetch value,
          $Res Function(_$UserBirthDayInfoEventFetch) then) =
      __$$UserBirthDayInfoEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserBirthDayInfoEventFetchCopyWithImpl<$Res>
    extends _$UserBirthDayInfoEventCopyWithImpl<$Res,
        _$UserBirthDayInfoEventFetch>
    implements _$$UserBirthDayInfoEventFetchCopyWith<$Res> {
  __$$UserBirthDayInfoEventFetchCopyWithImpl(
      _$UserBirthDayInfoEventFetch _value,
      $Res Function(_$UserBirthDayInfoEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserBirthDayInfoEventFetch extends UserBirthDayInfoEventFetch {
  const _$UserBirthDayInfoEventFetch() : super._();

  @override
  String toString() {
    return 'UserBirthDayInfoEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoEventFetch);
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
    required TResult Function(UserBirthDayInfoEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBirthDayInfoEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBirthDayInfoEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class UserBirthDayInfoEventFetch extends UserBirthDayInfoEvent {
  const factory UserBirthDayInfoEventFetch() = _$UserBirthDayInfoEventFetch;
  const UserBirthDayInfoEventFetch._() : super._();
}
