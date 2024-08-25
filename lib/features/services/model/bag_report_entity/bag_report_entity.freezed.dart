// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bag_report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BagReportEntity _$BagReportEntityFromJson(Map<String, dynamic> json) {
  return _BagReportEntity.fromJson(json);
}

/// @nodoc
mixin _$BagReportEntity {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get pathsToFiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BagReportEntityCopyWith<BagReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BagReportEntityCopyWith<$Res> {
  factory $BagReportEntityCopyWith(
          BagReportEntity value, $Res Function(BagReportEntity) then) =
      _$BagReportEntityCopyWithImpl<$Res, BagReportEntity>;
  @useResult
  $Res call({String title, String description, List<String> pathsToFiles});
}

/// @nodoc
class _$BagReportEntityCopyWithImpl<$Res, $Val extends BagReportEntity>
    implements $BagReportEntityCopyWith<$Res> {
  _$BagReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? pathsToFiles = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pathsToFiles: null == pathsToFiles
          ? _value.pathsToFiles
          : pathsToFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BagReportEntityImplCopyWith<$Res>
    implements $BagReportEntityCopyWith<$Res> {
  factory _$$BagReportEntityImplCopyWith(_$BagReportEntityImpl value,
          $Res Function(_$BagReportEntityImpl) then) =
      __$$BagReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, List<String> pathsToFiles});
}

/// @nodoc
class __$$BagReportEntityImplCopyWithImpl<$Res>
    extends _$BagReportEntityCopyWithImpl<$Res, _$BagReportEntityImpl>
    implements _$$BagReportEntityImplCopyWith<$Res> {
  __$$BagReportEntityImplCopyWithImpl(
      _$BagReportEntityImpl _value, $Res Function(_$BagReportEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? pathsToFiles = null,
  }) {
    return _then(_$BagReportEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pathsToFiles: null == pathsToFiles
          ? _value._pathsToFiles
          : pathsToFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BagReportEntityImpl implements _BagReportEntity {
  const _$BagReportEntityImpl(
      {required this.title,
      required this.description,
      required final List<String> pathsToFiles})
      : _pathsToFiles = pathsToFiles;

  factory _$BagReportEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BagReportEntityImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  final List<String> _pathsToFiles;
  @override
  List<String> get pathsToFiles {
    if (_pathsToFiles is EqualUnmodifiableListView) return _pathsToFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathsToFiles);
  }

  @override
  String toString() {
    return 'BagReportEntity(title: $title, description: $description, pathsToFiles: $pathsToFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BagReportEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._pathsToFiles, _pathsToFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_pathsToFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BagReportEntityImplCopyWith<_$BagReportEntityImpl> get copyWith =>
      __$$BagReportEntityImplCopyWithImpl<_$BagReportEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BagReportEntityImplToJson(
      this,
    );
  }
}

abstract class _BagReportEntity implements BagReportEntity {
  const factory _BagReportEntity(
      {required final String title,
      required final String description,
      required final List<String> pathsToFiles}) = _$BagReportEntityImpl;

  factory _BagReportEntity.fromJson(Map<String, dynamic> json) =
      _$BagReportEntityImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get pathsToFiles;
  @override
  @JsonKey(ignore: true)
  _$$BagReportEntityImplCopyWith<_$BagReportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
