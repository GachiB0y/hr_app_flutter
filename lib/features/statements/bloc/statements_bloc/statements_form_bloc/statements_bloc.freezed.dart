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
abstract class _$$StatementsEventCreateCopyWith<$Res> {
  factory _$$StatementsEventCreateCopyWith(_$StatementsEventCreate value,
          $Res Function(_$StatementsEventCreate) then) =
      __$$StatementsEventCreateCopyWithImpl<$Res>;
  @useResult
  $Res call({StatementFormInfoToSubmit itemsForm});

  $StatementFormInfoToSubmitCopyWith<$Res> get itemsForm;
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

class _$StatementsEventCreate extends StatementsEventCreate {
  const _$StatementsEventCreate({required this.itemsForm}) : super._();

  @override
  final StatementFormInfoToSubmit itemsForm;

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
      _$StatementsEventCreate;
  const StatementsEventCreate._() : super._();

  StatementFormInfoToSubmit get itemsForm;
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
      _$StatementsEventFetch;
  const StatementsEventFetch._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$StatementsEventFetchCopyWith<_$StatementsEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatementsEventSignDocumentCopyWith<$Res> {
  factory _$$StatementsEventSignDocumentCopyWith(
          _$StatementsEventSignDocument value,
          $Res Function(_$StatementsEventSignDocument) then) =
      __$$StatementsEventSignDocumentCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$StatementsEventSignDocumentCopyWithImpl<$Res>
    extends _$StatementsEventCopyWithImpl<$Res, _$StatementsEventSignDocument>
    implements _$$StatementsEventSignDocumentCopyWith<$Res> {
  __$$StatementsEventSignDocumentCopyWithImpl(
      _$StatementsEventSignDocument _value,
      $Res Function(_$StatementsEventSignDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$StatementsEventSignDocument(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatementsEventSignDocument extends StatementsEventSignDocument {
  const _$StatementsEventSignDocument({required this.code}) : super._();

  @override
  final String code;

  @override
  String toString() {
    return 'StatementsEvent.signDocument(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatementsEventSignDocument &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementsEventSignDocumentCopyWith<_$StatementsEventSignDocument>
      get copyWith => __$$StatementsEventSignDocumentCopyWithImpl<
          _$StatementsEventSignDocument>(this, _$identity);

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
      _$StatementsEventSignDocument;
  const StatementsEventSignDocument._() : super._();

  String get code;
  @JsonKey(ignore: true)
  _$$StatementsEventSignDocumentCopyWith<_$StatementsEventSignDocument>
      get copyWith => throw _privateConstructorUsedError;
}
