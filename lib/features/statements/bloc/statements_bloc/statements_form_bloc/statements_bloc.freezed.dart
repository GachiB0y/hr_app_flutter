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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatementsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfoToSubmit itemsForm) create,
    required TResult Function(String id) fetch,
    required TResult Function(String code) signDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult? Function(String id)? fetch,
    TResult? Function(String code)? signDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult Function(String id)? fetch,
    TResult Function(String code)? signDocument,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatementsEventCreate value) create,
    required TResult Function(StatementsEventFetch value) fetch,
    required TResult Function(StatementsEventSignDocument value) signDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
    TResult? Function(StatementsEventSignDocument value)? signDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    TResult Function(StatementsEventSignDocument value)? signDocument,
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
abstract class _$$StatementsEventCreateImplCopyWith<$Res> {
  factory _$$StatementsEventCreateImplCopyWith(
          _$StatementsEventCreateImpl value,
          $Res Function(_$StatementsEventCreateImpl) then) =
      __$$StatementsEventCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StatementFormInfoToSubmit itemsForm});

  $StatementFormInfoToSubmitCopyWith<$Res> get itemsForm;
}

/// @nodoc
class __$$StatementsEventCreateImplCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res, _$StatementsEventCreateImpl>
    implements _$$StatementsEventCreateImplCopyWith<$Res> {
  __$$StatementsEventCreateImplCopyWithImpl(_$StatementsEventCreateImpl _value,
      $Res Function(_$StatementsEventCreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemsForm = null,
  }) {
    return _then(_$StatementsEventCreateImpl(
      itemsForm: null == itemsForm
          ? _value.itemsForm
          : itemsForm // ignore: cast_nullable_to_non_nullable
              as StatementFormInfoToSubmit,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StatementFormInfoToSubmitCopyWith<$Res> get itemsForm {
    return $StatementFormInfoToSubmitCopyWith<$Res>(_value.itemsForm, (value) {
      return _then(_value.copyWith(itemsForm: value));
    });
  }
}

/// @nodoc

class _$StatementsEventCreateImpl extends StatementsEventCreate {
  const _$StatementsEventCreateImpl({required this.itemsForm}) : super._();

  @override
  final StatementFormInfoToSubmit itemsForm;

  @override
  String toString() {
    return 'StatementsEvent.create(itemsForm: $itemsForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventCreateImpl &&
            (identical(other.itemsForm, itemsForm) ||
                other.itemsForm == itemsForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemsForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventCreateImplCopyWith<_$StatementsEventCreateImpl>
      get copyWith => __$$StatementsEventCreateImplCopyWithImpl<
          _$StatementsEventCreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfoToSubmit itemsForm) create,
    required TResult Function(String id) fetch,
    required TResult Function(String code) signDocument,
  }) {
    return create(itemsForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult? Function(String id)? fetch,
    TResult? Function(String code)? signDocument,
  }) {
    return create?.call(itemsForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult Function(String id)? fetch,
    TResult Function(String code)? signDocument,
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
    required TResult Function(StatementsEventSignDocument value) signDocument,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
    TResult? Function(StatementsEventSignDocument value)? signDocument,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    TResult Function(StatementsEventSignDocument value)? signDocument,
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
          {required final StatementFormInfoToSubmit itemsForm}) =
      _$StatementsEventCreateImpl;
  const StatementsEventCreate._() : super._();

  StatementFormInfoToSubmit get itemsForm;
  @JsonKey(ignore: true)
  _$$StatementsEventCreateImplCopyWith<_$StatementsEventCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatementsEventFetchImplCopyWith<$Res> {
  factory _$$StatementsEventFetchImplCopyWith(_$StatementsEventFetchImpl value,
          $Res Function(_$StatementsEventFetchImpl) then) =
      __$$StatementsEventFetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$StatementsEventFetchImplCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res, _$StatementsEventFetchImpl>
    implements _$$StatementsEventFetchImplCopyWith<$Res> {
  __$$StatementsEventFetchImplCopyWithImpl(_$StatementsEventFetchImpl _value,
      $Res Function(_$StatementsEventFetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StatementsEventFetchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatementsEventFetchImpl extends StatementsEventFetch {
  const _$StatementsEventFetchImpl({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'StatementsEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventFetchImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventFetchImplCopyWith<_$StatementsEventFetchImpl>
      get copyWith =>
          __$$StatementsEventFetchImplCopyWithImpl<_$StatementsEventFetchImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfoToSubmit itemsForm) create,
    required TResult Function(String id) fetch,
    required TResult Function(String code) signDocument,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult? Function(String id)? fetch,
    TResult? Function(String code)? signDocument,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult Function(String id)? fetch,
    TResult Function(String code)? signDocument,
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
    required TResult Function(StatementsEventSignDocument value) signDocument,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
    TResult? Function(StatementsEventSignDocument value)? signDocument,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    TResult Function(StatementsEventSignDocument value)? signDocument,
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
      _$StatementsEventFetchImpl;
  const StatementsEventFetch._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$StatementsEventFetchImplCopyWith<_$StatementsEventFetchImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatementsEventSignDocumentImplCopyWith<$Res> {
  factory _$$StatementsEventSignDocumentImplCopyWith(
          _$StatementsEventSignDocumentImpl value,
          $Res Function(_$StatementsEventSignDocumentImpl) then) =
      __$$StatementsEventSignDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$StatementsEventSignDocumentImplCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res,
        _$StatementsEventSignDocumentImpl>
    implements _$$StatementsEventSignDocumentImplCopyWith<$Res> {
  __$$StatementsEventSignDocumentImplCopyWithImpl(
      _$StatementsEventSignDocumentImpl _value,
      $Res Function(_$StatementsEventSignDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$StatementsEventSignDocumentImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatementsEventSignDocumentImpl extends StatementsEventSignDocument {
  const _$StatementsEventSignDocumentImpl({required this.code}) : super._();

  @override
  final String code;

  @override
  String toString() {
    return 'StatementsEvent.signDocument(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventSignDocumentImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventSignDocumentImplCopyWith<_$StatementsEventSignDocumentImpl>
      get copyWith => __$$StatementsEventSignDocumentImplCopyWithImpl<
          _$StatementsEventSignDocumentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatementFormInfoToSubmit itemsForm) create,
    required TResult Function(String id) fetch,
    required TResult Function(String code) signDocument,
  }) {
    return signDocument(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult? Function(String id)? fetch,
    TResult? Function(String code)? signDocument,
  }) {
    return signDocument?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatementFormInfoToSubmit itemsForm)? create,
    TResult Function(String id)? fetch,
    TResult Function(String code)? signDocument,
    required TResult orElse(),
  }) {
    if (signDocument != null) {
      return signDocument(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatementsEventCreate value) create,
    required TResult Function(StatementsEventFetch value) fetch,
    required TResult Function(StatementsEventSignDocument value) signDocument,
  }) {
    return signDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatementsEventCreate value)? create,
    TResult? Function(StatementsEventFetch value)? fetch,
    TResult? Function(StatementsEventSignDocument value)? signDocument,
  }) {
    return signDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatementsEventCreate value)? create,
    TResult Function(StatementsEventFetch value)? fetch,
    TResult Function(StatementsEventSignDocument value)? signDocument,
    required TResult orElse(),
  }) {
    if (signDocument != null) {
      return signDocument(this);
    }
    return orElse();
  }
}

abstract class StatementsEventSignDocument extends StatementsEvent {
  const factory StatementsEventSignDocument({required final String code}) =
      _$StatementsEventSignDocumentImpl;
  const StatementsEventSignDocument._() : super._();

  String get code;
  @JsonKey(ignore: true)
  _$$StatementsEventSignDocumentImplCopyWith<_$StatementsEventSignDocumentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
