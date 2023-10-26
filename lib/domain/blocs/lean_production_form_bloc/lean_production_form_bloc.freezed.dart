// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lean_production_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeanProductionFormEvent {
  LeanProductionFormEntity get formEntity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LeanProductionFormEntity formEntity) submitForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormEntity formEntity)? submitForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LeanProductionFormEntity formEntity)? submitForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormEventSubmitForm value)
        submitForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormEventSubmitForm value)? submitForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormEventSubmitForm value)? submitForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeanProductionFormEventCopyWith<LeanProductionFormEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeanProductionFormEventCopyWith<$Res> {
  factory $LeanProductionFormEventCopyWith(LeanProductionFormEvent value,
          $Res Function(LeanProductionFormEvent) then) =
      _$LeanProductionFormEventCopyWithImpl<$Res, LeanProductionFormEvent>;
  @useResult
  $Res call({LeanProductionFormEntity formEntity});

  $LeanProductionFormEntityCopyWith<$Res> get formEntity;
}

/// @nodoc
class _$LeanProductionFormEventCopyWithImpl<$Res,
        $Val extends LeanProductionFormEvent>
    implements $LeanProductionFormEventCopyWith<$Res> {
  _$LeanProductionFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formEntity = null,
  }) {
    return _then(_value.copyWith(
      formEntity: null == formEntity
          ? _value.formEntity
          : formEntity // ignore: cast_nullable_to_non_nullable
              as LeanProductionFormEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeanProductionFormEntityCopyWith<$Res> get formEntity {
    return $LeanProductionFormEntityCopyWith<$Res>(_value.formEntity, (value) {
      return _then(_value.copyWith(formEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeanProductionFormEventSubmitFormCopyWith<$Res>
    implements $LeanProductionFormEventCopyWith<$Res> {
  factory _$$LeanProductionFormEventSubmitFormCopyWith(
          _$LeanProductionFormEventSubmitForm value,
          $Res Function(_$LeanProductionFormEventSubmitForm) then) =
      __$$LeanProductionFormEventSubmitFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeanProductionFormEntity formEntity});

  @override
  $LeanProductionFormEntityCopyWith<$Res> get formEntity;
}

/// @nodoc
class __$$LeanProductionFormEventSubmitFormCopyWithImpl<$Res>
    extends _$LeanProductionFormEventCopyWithImpl<$Res,
        _$LeanProductionFormEventSubmitForm>
    implements _$$LeanProductionFormEventSubmitFormCopyWith<$Res> {
  __$$LeanProductionFormEventSubmitFormCopyWithImpl(
      _$LeanProductionFormEventSubmitForm _value,
      $Res Function(_$LeanProductionFormEventSubmitForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formEntity = null,
  }) {
    return _then(_$LeanProductionFormEventSubmitForm(
      formEntity: null == formEntity
          ? _value.formEntity
          : formEntity // ignore: cast_nullable_to_non_nullable
              as LeanProductionFormEntity,
    ));
  }
}

/// @nodoc

class _$LeanProductionFormEventSubmitForm
    implements LeanProductionFormEventSubmitForm {
  const _$LeanProductionFormEventSubmitForm({required this.formEntity});

  @override
  final LeanProductionFormEntity formEntity;

  @override
  String toString() {
    return 'LeanProductionFormEvent.submitForm(formEntity: $formEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeanProductionFormEventSubmitForm &&
            (identical(other.formEntity, formEntity) ||
                other.formEntity == formEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeanProductionFormEventSubmitFormCopyWith<
          _$LeanProductionFormEventSubmitForm>
      get copyWith => __$$LeanProductionFormEventSubmitFormCopyWithImpl<
          _$LeanProductionFormEventSubmitForm>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LeanProductionFormEntity formEntity) submitForm,
  }) {
    return submitForm(formEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormEntity formEntity)? submitForm,
  }) {
    return submitForm?.call(formEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LeanProductionFormEntity formEntity)? submitForm,
    required TResult orElse(),
  }) {
    if (submitForm != null) {
      return submitForm(formEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormEventSubmitForm value)
        submitForm,
  }) {
    return submitForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormEventSubmitForm value)? submitForm,
  }) {
    return submitForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormEventSubmitForm value)? submitForm,
    required TResult orElse(),
  }) {
    if (submitForm != null) {
      return submitForm(this);
    }
    return orElse();
  }
}

abstract class LeanProductionFormEventSubmitForm
    implements LeanProductionFormEvent {
  const factory LeanProductionFormEventSubmitForm(
          {required final LeanProductionFormEntity formEntity}) =
      _$LeanProductionFormEventSubmitForm;

  @override
  LeanProductionFormEntity get formEntity;
  @override
  @JsonKey(ignore: true)
  _$$LeanProductionFormEventSubmitFormCopyWith<
          _$LeanProductionFormEventSubmitForm>
      get copyWith => throw _privateConstructorUsedError;
}

LeanProductionFormState _$LeanProductionFormStateFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return LeanProductionFormStateLoading.fromJson(json);
    case 'loaded':
      return LeanProductionFormStateLoaded.fromJson(json);
    case 'error':
      return LeanProductionFormStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'LeanProductionFormState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$LeanProductionFormState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            LeanProductionFormEntity? formEntity, bool? isSubmitting)
        loaded,
    required TResult Function(String? errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormStateLoading value) loading,
    required TResult Function(LeanProductionFormStateLoaded value) loaded,
    required TResult Function(LeanProductionFormStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormStateLoading value)? loading,
    TResult? Function(LeanProductionFormStateLoaded value)? loaded,
    TResult? Function(LeanProductionFormStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormStateLoading value)? loading,
    TResult Function(LeanProductionFormStateLoaded value)? loaded,
    TResult Function(LeanProductionFormStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeanProductionFormStateCopyWith<$Res> {
  factory $LeanProductionFormStateCopyWith(LeanProductionFormState value,
          $Res Function(LeanProductionFormState) then) =
      _$LeanProductionFormStateCopyWithImpl<$Res, LeanProductionFormState>;
}

/// @nodoc
class _$LeanProductionFormStateCopyWithImpl<$Res,
        $Val extends LeanProductionFormState>
    implements $LeanProductionFormStateCopyWith<$Res> {
  _$LeanProductionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LeanProductionFormStateLoadingCopyWith<$Res> {
  factory _$$LeanProductionFormStateLoadingCopyWith(
          _$LeanProductionFormStateLoading value,
          $Res Function(_$LeanProductionFormStateLoading) then) =
      __$$LeanProductionFormStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeanProductionFormStateLoadingCopyWithImpl<$Res>
    extends _$LeanProductionFormStateCopyWithImpl<$Res,
        _$LeanProductionFormStateLoading>
    implements _$$LeanProductionFormStateLoadingCopyWith<$Res> {
  __$$LeanProductionFormStateLoadingCopyWithImpl(
      _$LeanProductionFormStateLoading _value,
      $Res Function(_$LeanProductionFormStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LeanProductionFormStateLoading
    implements LeanProductionFormStateLoading {
  const _$LeanProductionFormStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LeanProductionFormStateLoading.fromJson(
          Map<String, dynamic> json) =>
      _$$LeanProductionFormStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LeanProductionFormState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeanProductionFormStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            LeanProductionFormEntity? formEntity, bool? isSubmitting)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormStateLoading value) loading,
    required TResult Function(LeanProductionFormStateLoaded value) loaded,
    required TResult Function(LeanProductionFormStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormStateLoading value)? loading,
    TResult? Function(LeanProductionFormStateLoaded value)? loaded,
    TResult? Function(LeanProductionFormStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormStateLoading value)? loading,
    TResult Function(LeanProductionFormStateLoaded value)? loaded,
    TResult Function(LeanProductionFormStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeanProductionFormStateLoadingToJson(
      this,
    );
  }
}

abstract class LeanProductionFormStateLoading
    implements LeanProductionFormState {
  const factory LeanProductionFormStateLoading() =
      _$LeanProductionFormStateLoading;

  factory LeanProductionFormStateLoading.fromJson(Map<String, dynamic> json) =
      _$LeanProductionFormStateLoading.fromJson;
}

/// @nodoc
abstract class _$$LeanProductionFormStateLoadedCopyWith<$Res> {
  factory _$$LeanProductionFormStateLoadedCopyWith(
          _$LeanProductionFormStateLoaded value,
          $Res Function(_$LeanProductionFormStateLoaded) then) =
      __$$LeanProductionFormStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({LeanProductionFormEntity? formEntity, bool? isSubmitting});

  $LeanProductionFormEntityCopyWith<$Res>? get formEntity;
}

/// @nodoc
class __$$LeanProductionFormStateLoadedCopyWithImpl<$Res>
    extends _$LeanProductionFormStateCopyWithImpl<$Res,
        _$LeanProductionFormStateLoaded>
    implements _$$LeanProductionFormStateLoadedCopyWith<$Res> {
  __$$LeanProductionFormStateLoadedCopyWithImpl(
      _$LeanProductionFormStateLoaded _value,
      $Res Function(_$LeanProductionFormStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formEntity = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$LeanProductionFormStateLoaded(
      formEntity: freezed == formEntity
          ? _value.formEntity
          : formEntity // ignore: cast_nullable_to_non_nullable
              as LeanProductionFormEntity?,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LeanProductionFormEntityCopyWith<$Res>? get formEntity {
    if (_value.formEntity == null) {
      return null;
    }

    return $LeanProductionFormEntityCopyWith<$Res>(_value.formEntity!, (value) {
      return _then(_value.copyWith(formEntity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$LeanProductionFormStateLoaded implements LeanProductionFormStateLoaded {
  const _$LeanProductionFormStateLoaded(
      {this.formEntity, this.isSubmitting, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$LeanProductionFormStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$LeanProductionFormStateLoadedFromJson(json);

  @override
  final LeanProductionFormEntity? formEntity;
  @override
  final bool? isSubmitting;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LeanProductionFormState.loaded(formEntity: $formEntity, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeanProductionFormStateLoaded &&
            (identical(other.formEntity, formEntity) ||
                other.formEntity == formEntity) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, formEntity, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeanProductionFormStateLoadedCopyWith<_$LeanProductionFormStateLoaded>
      get copyWith => __$$LeanProductionFormStateLoadedCopyWithImpl<
          _$LeanProductionFormStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            LeanProductionFormEntity? formEntity, bool? isSubmitting)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loaded(formEntity, isSubmitting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loaded?.call(formEntity, isSubmitting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(formEntity, isSubmitting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormStateLoading value) loading,
    required TResult Function(LeanProductionFormStateLoaded value) loaded,
    required TResult Function(LeanProductionFormStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormStateLoading value)? loading,
    TResult? Function(LeanProductionFormStateLoaded value)? loaded,
    TResult? Function(LeanProductionFormStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormStateLoading value)? loading,
    TResult Function(LeanProductionFormStateLoaded value)? loaded,
    TResult Function(LeanProductionFormStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeanProductionFormStateLoadedToJson(
      this,
    );
  }
}

abstract class LeanProductionFormStateLoaded
    implements LeanProductionFormState {
  const factory LeanProductionFormStateLoaded(
      {final LeanProductionFormEntity? formEntity,
      final bool? isSubmitting}) = _$LeanProductionFormStateLoaded;

  factory LeanProductionFormStateLoaded.fromJson(Map<String, dynamic> json) =
      _$LeanProductionFormStateLoaded.fromJson;

  LeanProductionFormEntity? get formEntity;
  bool? get isSubmitting;
  @JsonKey(ignore: true)
  _$$LeanProductionFormStateLoadedCopyWith<_$LeanProductionFormStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeanProductionFormStateErrorCopyWith<$Res> {
  factory _$$LeanProductionFormStateErrorCopyWith(
          _$LeanProductionFormStateError value,
          $Res Function(_$LeanProductionFormStateError) then) =
      __$$LeanProductionFormStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$LeanProductionFormStateErrorCopyWithImpl<$Res>
    extends _$LeanProductionFormStateCopyWithImpl<$Res,
        _$LeanProductionFormStateError>
    implements _$$LeanProductionFormStateErrorCopyWith<$Res> {
  __$$LeanProductionFormStateErrorCopyWithImpl(
      _$LeanProductionFormStateError _value,
      $Res Function(_$LeanProductionFormStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$LeanProductionFormStateError(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeanProductionFormStateError implements LeanProductionFormStateError {
  const _$LeanProductionFormStateError({this.errorText, final String? $type})
      : $type = $type ?? 'error';

  factory _$LeanProductionFormStateError.fromJson(Map<String, dynamic> json) =>
      _$$LeanProductionFormStateErrorFromJson(json);

  @override
  final String? errorText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LeanProductionFormState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeanProductionFormStateError &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeanProductionFormStateErrorCopyWith<_$LeanProductionFormStateError>
      get copyWith => __$$LeanProductionFormStateErrorCopyWithImpl<
          _$LeanProductionFormStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            LeanProductionFormEntity? formEntity, bool? isSubmitting)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LeanProductionFormEntity? formEntity, bool? isSubmitting)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeanProductionFormStateLoading value) loading,
    required TResult Function(LeanProductionFormStateLoaded value) loaded,
    required TResult Function(LeanProductionFormStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeanProductionFormStateLoading value)? loading,
    TResult? Function(LeanProductionFormStateLoaded value)? loaded,
    TResult? Function(LeanProductionFormStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeanProductionFormStateLoading value)? loading,
    TResult Function(LeanProductionFormStateLoaded value)? loaded,
    TResult Function(LeanProductionFormStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeanProductionFormStateErrorToJson(
      this,
    );
  }
}

abstract class LeanProductionFormStateError implements LeanProductionFormState {
  const factory LeanProductionFormStateError({final String? errorText}) =
      _$LeanProductionFormStateError;

  factory LeanProductionFormStateError.fromJson(Map<String, dynamic> json) =
      _$LeanProductionFormStateError.fromJson;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$LeanProductionFormStateErrorCopyWith<_$LeanProductionFormStateError>
      get copyWith => throw _privateConstructorUsedError;
}
