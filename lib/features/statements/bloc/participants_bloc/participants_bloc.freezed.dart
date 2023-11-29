// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participants_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ParticipantsEvent {
  String get inputValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String inputValue) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String inputValue)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String inputValue)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchParticipantsEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchParticipantsEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchParticipantsEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParticipantsEventCopyWith<ParticipantsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantsEventCopyWith<$Res> {
  factory $ParticipantsEventCopyWith(
          ParticipantsEvent value, $Res Function(ParticipantsEvent) then) =
      _$ParticipantsEventCopyWithImpl<$Res, ParticipantsEvent>;
  @useResult
  $Res call({String inputValue});
}

/// @nodoc
class _$ParticipantsEventCopyWithImpl<$Res, $Val extends ParticipantsEvent>
    implements $ParticipantsEventCopyWith<$Res> {
  _$ParticipantsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputValue = null,
  }) {
    return _then(_value.copyWith(
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchParticipantsEventCopyWith<$Res>
    implements $ParticipantsEventCopyWith<$Res> {
  factory _$$FetchParticipantsEventCopyWith(_$FetchParticipantsEvent value,
          $Res Function(_$FetchParticipantsEvent) then) =
      __$$FetchParticipantsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String inputValue});
}

/// @nodoc
class __$$FetchParticipantsEventCopyWithImpl<$Res>
    extends _$ParticipantsEventCopyWithImpl<$Res, _$FetchParticipantsEvent>
    implements _$$FetchParticipantsEventCopyWith<$Res> {
  __$$FetchParticipantsEventCopyWithImpl(_$FetchParticipantsEvent _value,
      $Res Function(_$FetchParticipantsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputValue = null,
  }) {
    return _then(_$FetchParticipantsEvent(
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchParticipantsEvent extends FetchParticipantsEvent {
  const _$FetchParticipantsEvent({required this.inputValue}) : super._();

  @override
  final String inputValue;

  @override
  String toString() {
    return 'ParticipantsEvent.fetch(inputValue: $inputValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchParticipantsEvent &&
            (identical(other.inputValue, inputValue) ||
                other.inputValue == inputValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchParticipantsEventCopyWith<_$FetchParticipantsEvent> get copyWith =>
      __$$FetchParticipantsEventCopyWithImpl<_$FetchParticipantsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String inputValue) fetch,
  }) {
    return fetch(inputValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String inputValue)? fetch,
  }) {
    return fetch?.call(inputValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String inputValue)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(inputValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchParticipantsEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchParticipantsEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchParticipantsEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchParticipantsEvent extends ParticipantsEvent {
  const factory FetchParticipantsEvent({required final String inputValue}) =
      _$FetchParticipantsEvent;
  const FetchParticipantsEvent._() : super._();

  @override
  String get inputValue;
  @override
  @JsonKey(ignore: true)
  _$$FetchParticipantsEventCopyWith<_$FetchParticipantsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
