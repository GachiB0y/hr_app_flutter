// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statements_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatementsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfo itemsForm) create,
    required TResult Function(String id) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfo itemsForm)? create,
    TResult? Function(String id)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfo itemsForm)? create,
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatementsEventCreate value) create,
    required TResult Function(StatementsEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementsEventCopyWith<$Res> {
  factory $StatementsEventCopyWith(
          StatementsEvent value, $Res Function(StatementsEvent) then) =
      _$StatementsEventCopyWithImpl<$Res, StatementsEvent>;
}

/// @nodoc
class _$StatementsEventCopyWithImpl<$Res, $Val extends StatementsEvent>
    implements $StatementsEventCopyWith<$Res> {
  _$StatementsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StatementsEventCreateCopyWith<$Res> {
  factory _$$StatementsEventCreateCopyWith(_$StatementsEventCreate value,
          $Res Function(_$StatementsEventCreate) then) =
      __$$StatementsEventCreateCopyWithImpl<$Res>;
  @useResult
  $Res call({StatementFormInfo itemsForm});

  $StatementFormInfoCopyWith<$Res> get itemsForm;
}

/// @nodoc
class __$$StatementsEventCreateCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res, _$StatementsEventCreate>
    implements _$$StatementsEventCreateCopyWith<$Res> {
  __$$StatementsEventCreateCopyWithImpl(_$StatementsEventCreate _value,
      $Res Function(_$StatementsEventCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemsForm = null,
  }) {
    return _then(_$StatementsEventCreate(
      itemsForm: null == itemsForm
          ? _value.itemsForm
          : itemsForm // ignore: cast_nullable_to_non_nullable
              as StatementFormInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StatementFormInfoCopyWith<$Res> get itemsForm {
    return $StatementFormInfoCopyWith<$Res>(_value.itemsForm, (value) {
      return _then(_value.copyWith(itemsForm: value));
    });
  }
}

/// @nodoc

class _$StatementsEventCreate extends StatementsEventCreate {
  const _$StatementsEventCreate({required this.itemsForm}) : super._();

  @override
  final StatementFormInfo itemsForm;

  @override
  String toString() {
    return 'StatementsEvent.create(itemsForm: $itemsForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventCreate &&
            (identical(other.itemsForm, itemsForm) ||
                other.itemsForm == itemsForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemsForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventCreateCopyWith<_$StatementsEventCreate> get copyWith =>
      __$$StatementsEventCreateCopyWithImpl<_$StatementsEventCreate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfo itemsForm) create,
    required TResult Function(String id) fetch,
  }) {
    return create(itemsForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfo itemsForm)? create,
    TResult? Function(String id)? fetch,
  }) {
    return create?.call(itemsForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfo itemsForm)? create,
    TResult Function(String id)? fetch,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(itemsForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatementsEventCreate value) create,
    required TResult Function(StatementsEventFetch value) fetch,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class StatementsEventCreate extends StatementsEvent {
  const factory StatementsEventCreate(
      {required final StatementFormInfo itemsForm}) = _$StatementsEventCreate;
  const StatementsEventCreate._() : super._();

  StatementFormInfo get itemsForm;
  @JsonKey(ignore: true)
  _$$StatementsEventCreateCopyWith<_$StatementsEventCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatementsEventFetchCopyWith<$Res> {
  factory _$$StatementsEventFetchCopyWith(_$StatementsEventFetch value,
          $Res Function(_$StatementsEventFetch) then) =
      __$$StatementsEventFetchCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$StatementsEventFetchCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res, _$StatementsEventFetch>
    implements _$$StatementsEventFetchCopyWith<$Res> {
  __$$StatementsEventFetchCopyWithImpl(_$StatementsEventFetch _value,
      $Res Function(_$StatementsEventFetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StatementsEventFetch(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatementsEventFetch extends StatementsEventFetch {
  const _$StatementsEventFetch({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'StatementsEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventFetch &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventFetchCopyWith<_$StatementsEventFetch> get copyWith =>
      __$$StatementsEventFetchCopyWithImpl<_$StatementsEventFetch>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfo itemsForm) create,
    required TResult Function(String id) fetch,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfo itemsForm)? create,
    TResult? Function(String id)? fetch,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfo itemsForm)? create,
    TResult Function(String id)? fetch,
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
    required TResult Function(StatementsEventCreate value) create,
    required TResult Function(StatementsEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class StatementsEventFetch extends StatementsEvent {
  const factory StatementsEventFetch({required final String id}) =
      _$StatementsEventFetch;
  const StatementsEventFetch._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$StatementsEventFetchCopyWith<_$StatementsEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}
