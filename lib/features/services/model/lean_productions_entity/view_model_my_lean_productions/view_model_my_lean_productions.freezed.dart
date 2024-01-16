// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_model_my_lean_productions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewModelMyLeanProductions _$ViewModelMyLeanProductionsFromJson(
    Map<String, dynamic> json) {
  return _ViewModelMyLeanProductions.fromJson(json);
}

/// @nodoc
mixin _$ViewModelMyLeanProductions {
  List<MyLeanProductionsEntity>? get myProposals =>
      throw _privateConstructorUsedError;
  bool? get isSubmitting => throw _privateConstructorUsedError;
  bool? get isLoadingFile => throw _privateConstructorUsedError;
  ApiClientExceptionType? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewModelMyLeanProductionsCopyWith<ViewModelMyLeanProductions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewModelMyLeanProductionsCopyWith<$Res> {
  factory $ViewModelMyLeanProductionsCopyWith(ViewModelMyLeanProductions value,
          $Res Function(ViewModelMyLeanProductions) then) =
      _$ViewModelMyLeanProductionsCopyWithImpl<$Res,
          ViewModelMyLeanProductions>;
  @useResult
  $Res call(
      {List<MyLeanProductionsEntity>? myProposals,
      bool? isSubmitting,
      bool? isLoadingFile,
      ApiClientExceptionType? exception});
}

/// @nodoc
class _$ViewModelMyLeanProductionsCopyWithImpl<$Res,
        $Val extends ViewModelMyLeanProductions>
    implements $ViewModelMyLeanProductionsCopyWith<$Res> {
  _$ViewModelMyLeanProductionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myProposals = freezed,
    Object? isSubmitting = freezed,
    Object? isLoadingFile = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      myProposals: freezed == myProposals
          ? _value.myProposals
          : myProposals // ignore: cast_nullable_to_non_nullable
              as List<MyLeanProductionsEntity>?,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingFile: freezed == isLoadingFile
          ? _value.isLoadingFile
          : isLoadingFile // ignore: cast_nullable_to_non_nullable
              as bool?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ApiClientExceptionType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewModelMyLeanProductionsCopyWith<$Res>
    implements $ViewModelMyLeanProductionsCopyWith<$Res> {
  factory _$$_ViewModelMyLeanProductionsCopyWith(
          _$_ViewModelMyLeanProductions value,
          $Res Function(_$_ViewModelMyLeanProductions) then) =
      __$$_ViewModelMyLeanProductionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MyLeanProductionsEntity>? myProposals,
      bool? isSubmitting,
      bool? isLoadingFile,
      ApiClientExceptionType? exception});
}

/// @nodoc
class __$$_ViewModelMyLeanProductionsCopyWithImpl<$Res>
    extends _$ViewModelMyLeanProductionsCopyWithImpl<$Res,
        _$_ViewModelMyLeanProductions>
    implements _$$_ViewModelMyLeanProductionsCopyWith<$Res> {
  __$$_ViewModelMyLeanProductionsCopyWithImpl(
      _$_ViewModelMyLeanProductions _value,
      $Res Function(_$_ViewModelMyLeanProductions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myProposals = freezed,
    Object? isSubmitting = freezed,
    Object? isLoadingFile = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ViewModelMyLeanProductions(
      myProposals: freezed == myProposals
          ? _value._myProposals
          : myProposals // ignore: cast_nullable_to_non_nullable
              as List<MyLeanProductionsEntity>?,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingFile: freezed == isLoadingFile
          ? _value.isLoadingFile
          : isLoadingFile // ignore: cast_nullable_to_non_nullable
              as bool?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ApiClientExceptionType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewModelMyLeanProductions implements _ViewModelMyLeanProductions {
  const _$_ViewModelMyLeanProductions(
      {required final List<MyLeanProductionsEntity>? myProposals,
      this.isSubmitting,
      this.isLoadingFile = false,
      this.exception})
      : _myProposals = myProposals;

  factory _$_ViewModelMyLeanProductions.fromJson(Map<String, dynamic> json) =>
      _$$_ViewModelMyLeanProductionsFromJson(json);

  final List<MyLeanProductionsEntity>? _myProposals;
  @override
  List<MyLeanProductionsEntity>? get myProposals {
    final value = _myProposals;
    if (value == null) return null;
    if (_myProposals is EqualUnmodifiableListView) return _myProposals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSubmitting;
  @override
  @JsonKey()
  final bool? isLoadingFile;
  @override
  final ApiClientExceptionType? exception;

  @override
  String toString() {
    return 'ViewModelMyLeanProductions(myProposals: $myProposals, isSubmitting: $isSubmitting, isLoadingFile: $isLoadingFile, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModelMyLeanProductions &&
            const DeepCollectionEquality()
                .equals(other._myProposals, _myProposals) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isLoadingFile, isLoadingFile) ||
                other.isLoadingFile == isLoadingFile) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_myProposals),
      isSubmitting,
      isLoadingFile,
      exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModelMyLeanProductionsCopyWith<_$_ViewModelMyLeanProductions>
      get copyWith => __$$_ViewModelMyLeanProductionsCopyWithImpl<
          _$_ViewModelMyLeanProductions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewModelMyLeanProductionsToJson(
      this,
    );
  }
}

abstract class _ViewModelMyLeanProductions
    implements ViewModelMyLeanProductions {
  const factory _ViewModelMyLeanProductions(
      {required final List<MyLeanProductionsEntity>? myProposals,
      final bool? isSubmitting,
      final bool? isLoadingFile,
      final ApiClientExceptionType? exception}) = _$_ViewModelMyLeanProductions;

  factory _ViewModelMyLeanProductions.fromJson(Map<String, dynamic> json) =
      _$_ViewModelMyLeanProductions.fromJson;

  @override
  List<MyLeanProductionsEntity>? get myProposals;
  @override
  bool? get isSubmitting;
  @override
  bool? get isLoadingFile;
  @override
  ApiClientExceptionType? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ViewModelMyLeanProductionsCopyWith<_$_ViewModelMyLeanProductions>
      get copyWith => throw _privateConstructorUsedError;
}
