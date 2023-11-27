// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bag_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BagReportEvent {
  BagReportEntity get formInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BagReportEntity formInfo) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BagReportEntity formInfo)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BagReportEntity formInfo)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BagReportEventCreate value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BagReportEventCreate value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BagReportEventCreate value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BagReportEventCopyWith<BagReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BagReportEventCopyWith<$Res> {
  factory $BagReportEventCopyWith(
          BagReportEvent value, $Res Function(BagReportEvent) then) =
      _$BagReportEventCopyWithImpl<$Res, BagReportEvent>;
  @useResult
  $Res call({BagReportEntity formInfo});

  $BagReportEntityCopyWith<$Res> get formInfo;
}

/// @nodoc
class _$BagReportEventCopyWithImpl<$Res, $Val extends BagReportEvent>
    implements $BagReportEventCopyWith<$Res> {
  _$BagReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formInfo = null,
  }) {
    return _then(_value.copyWith(
      formInfo: null == formInfo
          ? _value.formInfo
          : formInfo // ignore: cast_nullable_to_non_nullable
              as BagReportEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BagReportEntityCopyWith<$Res> get formInfo {
    return $BagReportEntityCopyWith<$Res>(_value.formInfo, (value) {
      return _then(_value.copyWith(formInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BagReportEventCreateCopyWith<$Res>
    implements $BagReportEventCopyWith<$Res> {
  factory _$$BagReportEventCreateCopyWith(_$BagReportEventCreate value,
          $Res Function(_$BagReportEventCreate) then) =
      __$$BagReportEventCreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BagReportEntity formInfo});

  @override
  $BagReportEntityCopyWith<$Res> get formInfo;
}

/// @nodoc
class __$$BagReportEventCreateCopyWithImpl<$Res>
    extends _$BagReportEventCopyWithImpl<$Res, _$BagReportEventCreate>
    implements _$$BagReportEventCreateCopyWith<$Res> {
  __$$BagReportEventCreateCopyWithImpl(_$BagReportEventCreate _value,
      $Res Function(_$BagReportEventCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formInfo = null,
  }) {
    return _then(_$BagReportEventCreate(
      formInfo: null == formInfo
          ? _value.formInfo
          : formInfo // ignore: cast_nullable_to_non_nullable
              as BagReportEntity,
    ));
  }
}

/// @nodoc

class _$BagReportEventCreate extends BagReportEventCreate {
  const _$BagReportEventCreate({required this.formInfo}) : super._();

  @override
  final BagReportEntity formInfo;

  @override
  String toString() {
    return 'BagReportEvent.create(formInfo: $formInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BagReportEventCreate &&
            (identical(other.formInfo, formInfo) ||
                other.formInfo == formInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BagReportEventCreateCopyWith<_$BagReportEventCreate> get copyWith =>
      __$$BagReportEventCreateCopyWithImpl<_$BagReportEventCreate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BagReportEntity formInfo) create,
  }) {
    return create(formInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BagReportEntity formInfo)? create,
  }) {
    return create?.call(formInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BagReportEntity formInfo)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(formInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BagReportEventCreate value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BagReportEventCreate value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BagReportEventCreate value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class BagReportEventCreate extends BagReportEvent {
  const factory BagReportEventCreate(
      {required final BagReportEntity formInfo}) = _$BagReportEventCreate;
  const BagReportEventCreate._() : super._();

  @override
  BagReportEntity get formInfo;
  @override
  @JsonKey(ignore: true)
  _$$BagReportEventCreateCopyWith<_$BagReportEventCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
