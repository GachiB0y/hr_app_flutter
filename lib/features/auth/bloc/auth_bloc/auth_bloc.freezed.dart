// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getCode,
    required TResult Function(String phoneNumber, String code) authByCode,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? getCode,
    TResult? Function(String phoneNumber, String code)? authByCode,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getCode,
    TResult Function(String phoneNumber, String code)? authByCode,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCodeAuthEvent value) getCode,
    required TResult Function(AuthByCodeAuthEvent value) authByCode,
    required TResult Function(LogoutAuthEvent value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCodeAuthEvent value)? getCode,
    TResult? Function(AuthByCodeAuthEvent value)? authByCode,
    TResult? Function(LogoutAuthEvent value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCodeAuthEvent value)? getCode,
    TResult Function(AuthByCodeAuthEvent value)? authByCode,
    TResult Function(LogoutAuthEvent value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCodeAuthEventCopyWith<$Res> {
  factory _$$GetCodeAuthEventCopyWith(
          _$GetCodeAuthEvent value, $Res Function(_$GetCodeAuthEvent) then) =
      __$$GetCodeAuthEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$GetCodeAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetCodeAuthEvent>
    implements _$$GetCodeAuthEventCopyWith<$Res> {
  __$$GetCodeAuthEventCopyWithImpl(
      _$GetCodeAuthEvent _value, $Res Function(_$GetCodeAuthEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$GetCodeAuthEvent(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCodeAuthEvent extends GetCodeAuthEvent {
  const _$GetCodeAuthEvent({required this.phoneNumber}) : super._();

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.getCode(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCodeAuthEvent &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCodeAuthEventCopyWith<_$GetCodeAuthEvent> get copyWith =>
      __$$GetCodeAuthEventCopyWithImpl<_$GetCodeAuthEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getCode,
    required TResult Function(String phoneNumber, String code) authByCode,
    required TResult Function() logout,
  }) {
    return getCode(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? getCode,
    TResult? Function(String phoneNumber, String code)? authByCode,
    TResult? Function()? logout,
  }) {
    return getCode?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getCode,
    TResult Function(String phoneNumber, String code)? authByCode,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (getCode != null) {
      return getCode(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCodeAuthEvent value) getCode,
    required TResult Function(AuthByCodeAuthEvent value) authByCode,
    required TResult Function(LogoutAuthEvent value) logout,
  }) {
    return getCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCodeAuthEvent value)? getCode,
    TResult? Function(AuthByCodeAuthEvent value)? authByCode,
    TResult? Function(LogoutAuthEvent value)? logout,
  }) {
    return getCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCodeAuthEvent value)? getCode,
    TResult Function(AuthByCodeAuthEvent value)? authByCode,
    TResult Function(LogoutAuthEvent value)? logout,
    required TResult orElse(),
  }) {
    if (getCode != null) {
      return getCode(this);
    }
    return orElse();
  }
}

abstract class GetCodeAuthEvent extends AuthEvent {
  const factory GetCodeAuthEvent({required final String phoneNumber}) =
      _$GetCodeAuthEvent;
  const GetCodeAuthEvent._() : super._();

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$GetCodeAuthEventCopyWith<_$GetCodeAuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthByCodeAuthEventCopyWith<$Res> {
  factory _$$AuthByCodeAuthEventCopyWith(_$AuthByCodeAuthEvent value,
          $Res Function(_$AuthByCodeAuthEvent) then) =
      __$$AuthByCodeAuthEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class __$$AuthByCodeAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthByCodeAuthEvent>
    implements _$$AuthByCodeAuthEventCopyWith<$Res> {
  __$$AuthByCodeAuthEventCopyWithImpl(
      _$AuthByCodeAuthEvent _value, $Res Function(_$AuthByCodeAuthEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_$AuthByCodeAuthEvent(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthByCodeAuthEvent extends AuthByCodeAuthEvent {
  const _$AuthByCodeAuthEvent({required this.phoneNumber, required this.code})
      : super._();

  @override
  final String phoneNumber;
  @override
  final String code;

  @override
  String toString() {
    return 'AuthEvent.authByCode(phoneNumber: $phoneNumber, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthByCodeAuthEvent &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthByCodeAuthEventCopyWith<_$AuthByCodeAuthEvent> get copyWith =>
      __$$AuthByCodeAuthEventCopyWithImpl<_$AuthByCodeAuthEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getCode,
    required TResult Function(String phoneNumber, String code) authByCode,
    required TResult Function() logout,
  }) {
    return authByCode(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? getCode,
    TResult? Function(String phoneNumber, String code)? authByCode,
    TResult? Function()? logout,
  }) {
    return authByCode?.call(phoneNumber, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getCode,
    TResult Function(String phoneNumber, String code)? authByCode,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (authByCode != null) {
      return authByCode(phoneNumber, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCodeAuthEvent value) getCode,
    required TResult Function(AuthByCodeAuthEvent value) authByCode,
    required TResult Function(LogoutAuthEvent value) logout,
  }) {
    return authByCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCodeAuthEvent value)? getCode,
    TResult? Function(AuthByCodeAuthEvent value)? authByCode,
    TResult? Function(LogoutAuthEvent value)? logout,
  }) {
    return authByCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCodeAuthEvent value)? getCode,
    TResult Function(AuthByCodeAuthEvent value)? authByCode,
    TResult Function(LogoutAuthEvent value)? logout,
    required TResult orElse(),
  }) {
    if (authByCode != null) {
      return authByCode(this);
    }
    return orElse();
  }
}

abstract class AuthByCodeAuthEvent extends AuthEvent {
  const factory AuthByCodeAuthEvent(
      {required final String phoneNumber,
      required final String code}) = _$AuthByCodeAuthEvent;
  const AuthByCodeAuthEvent._() : super._();

  String get phoneNumber;
  String get code;
  @JsonKey(ignore: true)
  _$$AuthByCodeAuthEventCopyWith<_$AuthByCodeAuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutAuthEventCopyWith<$Res> {
  factory _$$LogoutAuthEventCopyWith(
          _$LogoutAuthEvent value, $Res Function(_$LogoutAuthEvent) then) =
      __$$LogoutAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutAuthEvent>
    implements _$$LogoutAuthEventCopyWith<$Res> {
  __$$LogoutAuthEventCopyWithImpl(
      _$LogoutAuthEvent _value, $Res Function(_$LogoutAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutAuthEvent extends LogoutAuthEvent {
  const _$LogoutAuthEvent() : super._();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getCode,
    required TResult Function(String phoneNumber, String code) authByCode,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? getCode,
    TResult? Function(String phoneNumber, String code)? authByCode,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getCode,
    TResult Function(String phoneNumber, String code)? authByCode,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCodeAuthEvent value) getCode,
    required TResult Function(AuthByCodeAuthEvent value) authByCode,
    required TResult Function(LogoutAuthEvent value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCodeAuthEvent value)? getCode,
    TResult? Function(AuthByCodeAuthEvent value)? authByCode,
    TResult? Function(LogoutAuthEvent value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCodeAuthEvent value)? getCode,
    TResult Function(AuthByCodeAuthEvent value)? authByCode,
    TResult Function(LogoutAuthEvent value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class LogoutAuthEvent extends AuthEvent {
  const factory LogoutAuthEvent() = _$LogoutAuthEvent;
  const LogoutAuthEvent._() : super._();
}
