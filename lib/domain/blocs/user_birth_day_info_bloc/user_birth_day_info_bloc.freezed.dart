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
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? startDate, DateTime? endDate) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? startDate, DateTime? endDate)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? startDate, DateTime? endDate)? fetch,
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

  @JsonKey(ignore: true)
  $UserBirthDayInfoEventCopyWith<UserBirthDayInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBirthDayInfoEventCopyWith<$Res> {
  factory $UserBirthDayInfoEventCopyWith(UserBirthDayInfoEvent value,
          $Res Function(UserBirthDayInfoEvent) then) =
      _$UserBirthDayInfoEventCopyWithImpl<$Res, UserBirthDayInfoEvent>;
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBirthDayInfoEventFetchCopyWith<$Res>
    implements $UserBirthDayInfoEventCopyWith<$Res> {
  factory _$$UserBirthDayInfoEventFetchCopyWith(
          _$UserBirthDayInfoEventFetch value,
          $Res Function(_$UserBirthDayInfoEventFetch) then) =
      __$$UserBirthDayInfoEventFetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$UserBirthDayInfoEventFetch(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UserBirthDayInfoEventFetch extends UserBirthDayInfoEventFetch {
  const _$UserBirthDayInfoEventFetch({this.startDate, this.endDate})
      : super._();

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'UserBirthDayInfoEvent.fetch(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBirthDayInfoEventFetch &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBirthDayInfoEventFetchCopyWith<_$UserBirthDayInfoEventFetch>
      get copyWith => __$$UserBirthDayInfoEventFetchCopyWithImpl<
          _$UserBirthDayInfoEventFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? startDate, DateTime? endDate) fetch,
  }) {
    return fetch(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? startDate, DateTime? endDate)? fetch,
  }) {
    return fetch?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? startDate, DateTime? endDate)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(startDate, endDate);
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
  const factory UserBirthDayInfoEventFetch(
      {final DateTime? startDate,
      final DateTime? endDate}) = _$UserBirthDayInfoEventFetch;
  const UserBirthDayInfoEventFetch._() : super._();

  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$UserBirthDayInfoEventFetchCopyWith<_$UserBirthDayInfoEventFetch>
      get copyWith => throw _privateConstructorUsedError;
}
