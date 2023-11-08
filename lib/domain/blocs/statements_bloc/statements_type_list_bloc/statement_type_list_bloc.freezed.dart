// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statement_type_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatementTypeListEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStatementTypeListEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStatementTypeListEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStatementTypeListEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatementTypeListEventCopyWith<StatementTypeListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementTypeListEventCopyWith<$Res> {
  factory $StatementTypeListEventCopyWith(StatementTypeListEvent value,
          $Res Function(StatementTypeListEvent) then) =
      _$StatementTypeListEventCopyWithImpl<$Res, StatementTypeListEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$StatementTypeListEventCopyWithImpl<$Res,
        $Val extends StatementTypeListEvent>
    implements $StatementTypeListEventCopyWith<$Res> {
  _$StatementTypeListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchStatementTypeListEventCopyWith<$Res>
    implements $StatementTypeListEventCopyWith<$Res> {
  factory _$$FetchStatementTypeListEventCopyWith(
          _$FetchStatementTypeListEvent value,
          $Res Function(_$FetchStatementTypeListEvent) then) =
      __$$FetchStatementTypeListEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchStatementTypeListEventCopyWithImpl<$Res>
    extends _$StatementTypeListEventCopyWithImpl<$Res,
        _$FetchStatementTypeListEvent>
    implements _$$FetchStatementTypeListEventCopyWith<$Res> {
  __$$FetchStatementTypeListEventCopyWithImpl(
      _$FetchStatementTypeListEvent _value,
      $Res Function(_$FetchStatementTypeListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchStatementTypeListEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchStatementTypeListEvent extends FetchStatementTypeListEvent {
  const _$FetchStatementTypeListEvent({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'StatementTypeListEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStatementTypeListEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStatementTypeListEventCopyWith<_$FetchStatementTypeListEvent>
      get copyWith => __$$FetchStatementTypeListEventCopyWithImpl<
          _$FetchStatementTypeListEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetch,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetch,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStatementTypeListEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStatementTypeListEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStatementTypeListEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchStatementTypeListEvent extends StatementTypeListEvent {
  const factory FetchStatementTypeListEvent({required final int id}) =
      _$FetchStatementTypeListEvent;
  const FetchStatementTypeListEvent._() : super._();

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$FetchStatementTypeListEventCopyWith<_$FetchStatementTypeListEvent>
      get copyWith => throw _privateConstructorUsedError;
}
