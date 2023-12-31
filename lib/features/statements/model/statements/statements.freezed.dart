// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatementViewModel _$StatementViewModelFromJson(Map<String, dynamic> json) {
  return _StatementViewModel.fromJson(json);
}

/// @nodoc
mixin _$StatementViewModel {
  StatementTempalteEntity? get tempalteEntity =>
      throw _privateConstructorUsedError;
  bool get isSmsApprove => throw _privateConstructorUsedError;
  bool get isSigningStatment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementViewModelCopyWith<StatementViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementViewModelCopyWith<$Res> {
  factory $StatementViewModelCopyWith(
          StatementViewModel value, $Res Function(StatementViewModel) then) =
      _$StatementViewModelCopyWithImpl<$Res, StatementViewModel>;
  @useResult
  $Res call(
      {StatementTempalteEntity? tempalteEntity,
      bool isSmsApprove,
      bool isSigningStatment});

  $StatementTempalteEntityCopyWith<$Res>? get tempalteEntity;
}

/// @nodoc
class _$StatementViewModelCopyWithImpl<$Res, $Val extends StatementViewModel>
    implements $StatementViewModelCopyWith<$Res> {
  _$StatementViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempalteEntity = freezed,
    Object? isSmsApprove = null,
    Object? isSigningStatment = null,
  }) {
    return _then(_value.copyWith(
      tempalteEntity: freezed == tempalteEntity
          ? _value.tempalteEntity
          : tempalteEntity // ignore: cast_nullable_to_non_nullable
              as StatementTempalteEntity?,
      isSmsApprove: null == isSmsApprove
          ? _value.isSmsApprove
          : isSmsApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      isSigningStatment: null == isSigningStatment
          ? _value.isSigningStatment
          : isSigningStatment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatementTempalteEntityCopyWith<$Res>? get tempalteEntity {
    if (_value.tempalteEntity == null) {
      return null;
    }

    return $StatementTempalteEntityCopyWith<$Res>(_value.tempalteEntity!,
        (value) {
      return _then(_value.copyWith(tempalteEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StatementViewModelCopyWith<$Res>
    implements $StatementViewModelCopyWith<$Res> {
  factory _$$_StatementViewModelCopyWith(_$_StatementViewModel value,
          $Res Function(_$_StatementViewModel) then) =
      __$$_StatementViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatementTempalteEntity? tempalteEntity,
      bool isSmsApprove,
      bool isSigningStatment});

  @override
  $StatementTempalteEntityCopyWith<$Res>? get tempalteEntity;
}

/// @nodoc
class __$$_StatementViewModelCopyWithImpl<$Res>
    extends _$StatementViewModelCopyWithImpl<$Res, _$_StatementViewModel>
    implements _$$_StatementViewModelCopyWith<$Res> {
  __$$_StatementViewModelCopyWithImpl(
      _$_StatementViewModel _value, $Res Function(_$_StatementViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempalteEntity = freezed,
    Object? isSmsApprove = null,
    Object? isSigningStatment = null,
  }) {
    return _then(_$_StatementViewModel(
      tempalteEntity: freezed == tempalteEntity
          ? _value.tempalteEntity
          : tempalteEntity // ignore: cast_nullable_to_non_nullable
              as StatementTempalteEntity?,
      isSmsApprove: null == isSmsApprove
          ? _value.isSmsApprove
          : isSmsApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      isSigningStatment: null == isSigningStatment
          ? _value.isSigningStatment
          : isSigningStatment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementViewModel implements _StatementViewModel {
  const _$_StatementViewModel(
      {required this.tempalteEntity,
      this.isSmsApprove = false,
      this.isSigningStatment = false});

  factory _$_StatementViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_StatementViewModelFromJson(json);

  @override
  final StatementTempalteEntity? tempalteEntity;
  @override
  @JsonKey()
  final bool isSmsApprove;
  @override
  @JsonKey()
  final bool isSigningStatment;

  @override
  String toString() {
    return 'StatementViewModel(tempalteEntity: $tempalteEntity, isSmsApprove: $isSmsApprove, isSigningStatment: $isSigningStatment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementViewModel &&
            (identical(other.tempalteEntity, tempalteEntity) ||
                other.tempalteEntity == tempalteEntity) &&
            (identical(other.isSmsApprove, isSmsApprove) ||
                other.isSmsApprove == isSmsApprove) &&
            (identical(other.isSigningStatment, isSigningStatment) ||
                other.isSigningStatment == isSigningStatment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tempalteEntity, isSmsApprove, isSigningStatment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementViewModelCopyWith<_$_StatementViewModel> get copyWith =>
      __$$_StatementViewModelCopyWithImpl<_$_StatementViewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementViewModelToJson(
      this,
    );
  }
}

abstract class _StatementViewModel implements StatementViewModel {
  const factory _StatementViewModel(
      {required final StatementTempalteEntity? tempalteEntity,
      final bool isSmsApprove,
      final bool isSigningStatment}) = _$_StatementViewModel;

  factory _StatementViewModel.fromJson(Map<String, dynamic> json) =
      _$_StatementViewModel.fromJson;

  @override
  StatementTempalteEntity? get tempalteEntity;
  @override
  bool get isSmsApprove;
  @override
  bool get isSigningStatment;
  @override
  @JsonKey(ignore: true)
  _$$_StatementViewModelCopyWith<_$_StatementViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StatementTempalteEntity _$StatementTempalteEntityFromJson(
    Map<String, dynamic> json) {
  return _StatementTempalteEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementTempalteEntity {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'select_participants')
  bool? get isParticipants => throw _privateConstructorUsedError;
  List<TemplateField> get template => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementTempalteEntityCopyWith<StatementTempalteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementTempalteEntityCopyWith<$Res> {
  factory $StatementTempalteEntityCopyWith(StatementTempalteEntity value,
          $Res Function(StatementTempalteEntity) then) =
      _$StatementTempalteEntityCopyWithImpl<$Res, StatementTempalteEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'select_participants') bool? isParticipants,
      List<TemplateField> template});
}

/// @nodoc
class _$StatementTempalteEntityCopyWithImpl<$Res,
        $Val extends StatementTempalteEntity>
    implements $StatementTempalteEntityCopyWith<$Res> {
  _$StatementTempalteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? isParticipants = freezed,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      isParticipants: freezed == isParticipants
          ? _value.isParticipants
          : isParticipants // ignore: cast_nullable_to_non_nullable
              as bool?,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatementTempalteEntityCopyWith<$Res>
    implements $StatementTempalteEntityCopyWith<$Res> {
  factory _$$_StatementTempalteEntityCopyWith(_$_StatementTempalteEntity value,
          $Res Function(_$_StatementTempalteEntity) then) =
      __$$_StatementTempalteEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'select_participants') bool? isParticipants,
      List<TemplateField> template});
}

/// @nodoc
class __$$_StatementTempalteEntityCopyWithImpl<$Res>
    extends _$StatementTempalteEntityCopyWithImpl<$Res,
        _$_StatementTempalteEntity>
    implements _$$_StatementTempalteEntityCopyWith<$Res> {
  __$$_StatementTempalteEntityCopyWithImpl(_$_StatementTempalteEntity _value,
      $Res Function(_$_StatementTempalteEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? isParticipants = freezed,
    Object? template = null,
  }) {
    return _then(_$_StatementTempalteEntity(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      isParticipants: freezed == isParticipants
          ? _value.isParticipants
          : isParticipants // ignore: cast_nullable_to_non_nullable
              as bool?,
      template: null == template
          ? _value._template
          : template // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementTempalteEntity implements _StatementTempalteEntity {
  const _$_StatementTempalteEntity(
      {@JsonKey(name: 'document_type') required this.documentType,
      @JsonKey(name: 'select_participants') required this.isParticipants,
      required final List<TemplateField> template})
      : _template = template;

  factory _$_StatementTempalteEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementTempalteEntityFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  @override
  @JsonKey(name: 'select_participants')
  final bool? isParticipants;
  final List<TemplateField> _template;
  @override
  List<TemplateField> get template {
    if (_template is EqualUnmodifiableListView) return _template;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_template);
  }

  @override
  String toString() {
    return 'StatementTempalteEntity(documentType: $documentType, isParticipants: $isParticipants, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementTempalteEntity &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.isParticipants, isParticipants) ||
                other.isParticipants == isParticipants) &&
            const DeepCollectionEquality().equals(other._template, _template));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, documentType, isParticipants,
      const DeepCollectionEquality().hash(_template));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementTempalteEntityCopyWith<_$_StatementTempalteEntity>
      get copyWith =>
          __$$_StatementTempalteEntityCopyWithImpl<_$_StatementTempalteEntity>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementTempalteEntityToJson(
      this,
    );
  }
}

abstract class _StatementTempalteEntity implements StatementTempalteEntity {
  const factory _StatementTempalteEntity(
      {@JsonKey(name: 'document_type') required final String documentType,
      @JsonKey(name: 'select_participants') required final bool? isParticipants,
      required final List<TemplateField>
          template}) = _$_StatementTempalteEntity;

  factory _StatementTempalteEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementTempalteEntity.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  @JsonKey(name: 'select_participants')
  bool? get isParticipants;
  @override
  List<TemplateField> get template;
  @override
  @JsonKey(ignore: true)
  _$$_StatementTempalteEntityCopyWith<_$_StatementTempalteEntity>
      get copyWith => throw _privateConstructorUsedError;
}

StatementFieldTypeEntity _$StatementFieldTypeEntityFromJson(
    Map<String, dynamic> json) {
  return _StatementFieldTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementFieldTypeEntity {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_body')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFieldTypeEntityCopyWith<StatementFieldTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFieldTypeEntityCopyWith<$Res> {
  factory $StatementFieldTypeEntityCopyWith(StatementFieldTypeEntity value,
          $Res Function(StatementFieldTypeEntity) then) =
      _$StatementFieldTypeEntityCopyWithImpl<$Res, StatementFieldTypeEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'field_body') String name});
}

/// @nodoc
class _$StatementFieldTypeEntityCopyWithImpl<$Res,
        $Val extends StatementFieldTypeEntity>
    implements $StatementFieldTypeEntityCopyWith<$Res> {
  _$StatementFieldTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatementFieldTypeEntityCopyWith<$Res>
    implements $StatementFieldTypeEntityCopyWith<$Res> {
  factory _$$_StatementFieldTypeEntityCopyWith(
          _$_StatementFieldTypeEntity value,
          $Res Function(_$_StatementFieldTypeEntity) then) =
      __$$_StatementFieldTypeEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'field_body') String name});
}

/// @nodoc
class __$$_StatementFieldTypeEntityCopyWithImpl<$Res>
    extends _$StatementFieldTypeEntityCopyWithImpl<$Res,
        _$_StatementFieldTypeEntity>
    implements _$$_StatementFieldTypeEntityCopyWith<$Res> {
  __$$_StatementFieldTypeEntityCopyWithImpl(_$_StatementFieldTypeEntity _value,
      $Res Function(_$_StatementFieldTypeEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? name = null,
  }) {
    return _then(_$_StatementFieldTypeEntity(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementFieldTypeEntity implements _StatementFieldTypeEntity {
  const _$_StatementFieldTypeEntity(
      {@JsonKey(name: 'document_type') required this.documentType,
      @JsonKey(name: 'field_body') required this.name});

  factory _$_StatementFieldTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFieldTypeEntityFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  @override
  @JsonKey(name: 'field_body')
  final String name;

  @override
  String toString() {
    return 'StatementFieldTypeEntity(documentType: $documentType, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFieldTypeEntity &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, documentType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementFieldTypeEntityCopyWith<_$_StatementFieldTypeEntity>
      get copyWith => __$$_StatementFieldTypeEntityCopyWithImpl<
          _$_StatementFieldTypeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFieldTypeEntityToJson(
      this,
    );
  }
}

abstract class _StatementFieldTypeEntity implements StatementFieldTypeEntity {
  const factory _StatementFieldTypeEntity(
          {@JsonKey(name: 'document_type') required final String documentType,
          @JsonKey(name: 'field_body') required final String name}) =
      _$_StatementFieldTypeEntity;

  factory _StatementFieldTypeEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementFieldTypeEntity.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  @JsonKey(name: 'field_body')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFieldTypeEntityCopyWith<_$_StatementFieldTypeEntity>
      get copyWith => throw _privateConstructorUsedError;
}

StatementFormInfoToSubmit _$StatementFormInfoToSubmitFromJson(
    Map<String, dynamic> json) {
  return _StatementFormInfoToSubmit.fromJson(json);
}

/// @nodoc
mixin _$StatementFormInfoToSubmit {
  @JsonKey(name: 'document_type')
  String get documentType =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'participants_to')
  String get participantsTo => throw _privateConstructorUsedError;
  TemplateFormStatementsEntity get template =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFormInfoToSubmitCopyWith<StatementFormInfoToSubmit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFormInfoToSubmitCopyWith<$Res> {
  factory $StatementFormInfoToSubmitCopyWith(StatementFormInfoToSubmit value,
          $Res Function(StatementFormInfoToSubmit) then) =
      _$StatementFormInfoToSubmitCopyWithImpl<$Res, StatementFormInfoToSubmit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      String participantsTo,
      TemplateFormStatementsEntity template});

  $TemplateFormStatementsEntityCopyWith<$Res> get template;
}

/// @nodoc
class _$StatementFormInfoToSubmitCopyWithImpl<$Res,
        $Val extends StatementFormInfoToSubmit>
    implements $StatementFormInfoToSubmitCopyWith<$Res> {
  _$StatementFormInfoToSubmitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? participantsTo = null,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      participantsTo: null == participantsTo
          ? _value.participantsTo
          : participantsTo // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateFormStatementsEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateFormStatementsEntityCopyWith<$Res> get template {
    return $TemplateFormStatementsEntityCopyWith<$Res>(_value.template,
        (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StatementFormInfoToSubmitCopyWith<$Res>
    implements $StatementFormInfoToSubmitCopyWith<$Res> {
  factory _$$_StatementFormInfoToSubmitCopyWith(
          _$_StatementFormInfoToSubmit value,
          $Res Function(_$_StatementFormInfoToSubmit) then) =
      __$$_StatementFormInfoToSubmitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      String participantsTo,
      TemplateFormStatementsEntity template});

  @override
  $TemplateFormStatementsEntityCopyWith<$Res> get template;
}

/// @nodoc
class __$$_StatementFormInfoToSubmitCopyWithImpl<$Res>
    extends _$StatementFormInfoToSubmitCopyWithImpl<$Res,
        _$_StatementFormInfoToSubmit>
    implements _$$_StatementFormInfoToSubmitCopyWith<$Res> {
  __$$_StatementFormInfoToSubmitCopyWithImpl(
      _$_StatementFormInfoToSubmit _value,
      $Res Function(_$_StatementFormInfoToSubmit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? participantsTo = null,
    Object? template = null,
  }) {
    return _then(_$_StatementFormInfoToSubmit(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      participantsTo: null == participantsTo
          ? _value.participantsTo
          : participantsTo // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as TemplateFormStatementsEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementFormInfoToSubmit implements _StatementFormInfoToSubmit {
  const _$_StatementFormInfoToSubmit(
      {@JsonKey(name: 'document_type') required this.documentType,
      required this.participantsTo,
      required this.template});

  factory _$_StatementFormInfoToSubmit.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFormInfoToSubmitFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
// @JsonKey(name: 'participants_to')
  @override
  final String participantsTo;
  @override
  final TemplateFormStatementsEntity template;

  @override
  String toString() {
    return 'StatementFormInfoToSubmit(documentType: $documentType, participantsTo: $participantsTo, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFormInfoToSubmit &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.participantsTo, participantsTo) ||
                other.participantsTo == participantsTo) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, documentType, participantsTo, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementFormInfoToSubmitCopyWith<_$_StatementFormInfoToSubmit>
      get copyWith => __$$_StatementFormInfoToSubmitCopyWithImpl<
          _$_StatementFormInfoToSubmit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFormInfoToSubmitToJson(
      this,
    );
  }
}

abstract class _StatementFormInfoToSubmit implements StatementFormInfoToSubmit {
  const factory _StatementFormInfoToSubmit(
          {@JsonKey(name: 'document_type') required final String documentType,
          required final String participantsTo,
          required final TemplateFormStatementsEntity template}) =
      _$_StatementFormInfoToSubmit;

  factory _StatementFormInfoToSubmit.fromJson(Map<String, dynamic> json) =
      _$_StatementFormInfoToSubmit.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override // @JsonKey(name: 'participants_to')
  String get participantsTo;
  @override
  TemplateFormStatementsEntity get template;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFormInfoToSubmitCopyWith<_$_StatementFormInfoToSubmit>
      get copyWith => throw _privateConstructorUsedError;
}

TemplateFormStatementsEntity _$TemplateFormStatementsEntityFromJson(
    Map<String, dynamic> json) {
  return _TemplateFormStatementsEntity.fromJson(json);
}

/// @nodoc
mixin _$TemplateFormStatementsEntity {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get patronymic => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_days')
  String? get workDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_trip_place')
  String? get businessTripPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'purpose_trip')
  String? get purposeTrip => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_travel_expenses')
  String? get expensesTravelExpenses => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_daily_money')
  String? get expensesDailyMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_living_place')
  String? get expensesLivingPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'result_rub')
  String? get resultRub => throw _privateConstructorUsedError;
  @JsonKey(name: 'result_kop')
  String? get resultKop => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_expenditure')
  String? get itemExpenditure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateFormStatementsEntityCopyWith<TemplateFormStatementsEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateFormStatementsEntityCopyWith<$Res> {
  factory $TemplateFormStatementsEntityCopyWith(
          TemplateFormStatementsEntity value,
          $Res Function(TemplateFormStatementsEntity) then) =
      _$TemplateFormStatementsEntityCopyWithImpl<$Res,
          TemplateFormStatementsEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? patronymic,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'work_days') String? workDays,
      @JsonKey(name: 'business_trip_place') String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') String? expensesTravelExpenses,
      String? reason,
      @JsonKey(name: 'expenses_daily_money') String? expensesDailyMoney,
      @JsonKey(name: 'expenses_living_place') String? expensesLivingPlace,
      @JsonKey(name: 'result_rub') String? resultRub,
      @JsonKey(name: 'result_kop') String? resultKop,
      @JsonKey(name: 'item_expenditure') String? itemExpenditure});
}

/// @nodoc
class _$TemplateFormStatementsEntityCopyWithImpl<$Res,
        $Val extends TemplateFormStatementsEntity>
    implements $TemplateFormStatementsEntityCopyWith<$Res> {
  _$TemplateFormStatementsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? workDays = freezed,
    Object? businessTripPlace = freezed,
    Object? purposeTrip = freezed,
    Object? expensesTravelExpenses = freezed,
    Object? reason = freezed,
    Object? expensesDailyMoney = freezed,
    Object? expensesLivingPlace = freezed,
    Object? resultRub = freezed,
    Object? resultKop = freezed,
    Object? itemExpenditure = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: freezed == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as String?,
      businessTripPlace: freezed == businessTripPlace
          ? _value.businessTripPlace
          : businessTripPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeTrip: freezed == purposeTrip
          ? _value.purposeTrip
          : purposeTrip // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesTravelExpenses: freezed == expensesTravelExpenses
          ? _value.expensesTravelExpenses
          : expensesTravelExpenses // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesDailyMoney: freezed == expensesDailyMoney
          ? _value.expensesDailyMoney
          : expensesDailyMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesLivingPlace: freezed == expensesLivingPlace
          ? _value.expensesLivingPlace
          : expensesLivingPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      resultRub: freezed == resultRub
          ? _value.resultRub
          : resultRub // ignore: cast_nullable_to_non_nullable
              as String?,
      resultKop: freezed == resultKop
          ? _value.resultKop
          : resultKop // ignore: cast_nullable_to_non_nullable
              as String?,
      itemExpenditure: freezed == itemExpenditure
          ? _value.itemExpenditure
          : itemExpenditure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateFormStatementsEntityCopyWith<$Res>
    implements $TemplateFormStatementsEntityCopyWith<$Res> {
  factory _$$_TemplateFormStatementsEntityCopyWith(
          _$_TemplateFormStatementsEntity value,
          $Res Function(_$_TemplateFormStatementsEntity) then) =
      __$$_TemplateFormStatementsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? patronymic,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'work_days') String? workDays,
      @JsonKey(name: 'business_trip_place') String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') String? expensesTravelExpenses,
      String? reason,
      @JsonKey(name: 'expenses_daily_money') String? expensesDailyMoney,
      @JsonKey(name: 'expenses_living_place') String? expensesLivingPlace,
      @JsonKey(name: 'result_rub') String? resultRub,
      @JsonKey(name: 'result_kop') String? resultKop,
      @JsonKey(name: 'item_expenditure') String? itemExpenditure});
}

/// @nodoc
class __$$_TemplateFormStatementsEntityCopyWithImpl<$Res>
    extends _$TemplateFormStatementsEntityCopyWithImpl<$Res,
        _$_TemplateFormStatementsEntity>
    implements _$$_TemplateFormStatementsEntityCopyWith<$Res> {
  __$$_TemplateFormStatementsEntityCopyWithImpl(
      _$_TemplateFormStatementsEntity _value,
      $Res Function(_$_TemplateFormStatementsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? workDays = freezed,
    Object? businessTripPlace = freezed,
    Object? purposeTrip = freezed,
    Object? expensesTravelExpenses = freezed,
    Object? reason = freezed,
    Object? expensesDailyMoney = freezed,
    Object? expensesLivingPlace = freezed,
    Object? resultRub = freezed,
    Object? resultKop = freezed,
    Object? itemExpenditure = freezed,
  }) {
    return _then(_$_TemplateFormStatementsEntity(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: freezed == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as String?,
      businessTripPlace: freezed == businessTripPlace
          ? _value.businessTripPlace
          : businessTripPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeTrip: freezed == purposeTrip
          ? _value.purposeTrip
          : purposeTrip // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesTravelExpenses: freezed == expensesTravelExpenses
          ? _value.expensesTravelExpenses
          : expensesTravelExpenses // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesDailyMoney: freezed == expensesDailyMoney
          ? _value.expensesDailyMoney
          : expensesDailyMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesLivingPlace: freezed == expensesLivingPlace
          ? _value.expensesLivingPlace
          : expensesLivingPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      resultRub: freezed == resultRub
          ? _value.resultRub
          : resultRub // ignore: cast_nullable_to_non_nullable
              as String?,
      resultKop: freezed == resultKop
          ? _value.resultKop
          : resultKop // ignore: cast_nullable_to_non_nullable
              as String?,
      itemExpenditure: freezed == itemExpenditure
          ? _value.itemExpenditure
          : itemExpenditure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateFormStatementsEntity implements _TemplateFormStatementsEntity {
  const _$_TemplateFormStatementsEntity(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.patronymic,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'work_days') this.workDays,
      @JsonKey(name: 'business_trip_place') this.businessTripPlace,
      @JsonKey(name: 'purpose_trip') this.purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') this.expensesTravelExpenses,
      this.reason,
      @JsonKey(name: 'expenses_daily_money') this.expensesDailyMoney,
      @JsonKey(name: 'expenses_living_place') this.expensesLivingPlace,
      @JsonKey(name: 'result_rub') this.resultRub,
      @JsonKey(name: 'result_kop') this.resultKop,
      @JsonKey(name: 'item_expenditure') this.itemExpenditure});

  factory _$_TemplateFormStatementsEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateFormStatementsEntityFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? patronymic;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey(name: 'work_days')
  final String? workDays;
  @override
  @JsonKey(name: 'business_trip_place')
  final String? businessTripPlace;
  @override
  @JsonKey(name: 'purpose_trip')
  final String? purposeTrip;
  @override
  @JsonKey(name: 'expenses_travel_expenses')
  final String? expensesTravelExpenses;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'expenses_daily_money')
  final String? expensesDailyMoney;
  @override
  @JsonKey(name: 'expenses_living_place')
  final String? expensesLivingPlace;
  @override
  @JsonKey(name: 'result_rub')
  final String? resultRub;
  @override
  @JsonKey(name: 'result_kop')
  final String? resultKop;
  @override
  @JsonKey(name: 'item_expenditure')
  final String? itemExpenditure;

  @override
  String toString() {
    return 'TemplateFormStatementsEntity(firstName: $firstName, lastName: $lastName, patronymic: $patronymic, startDate: $startDate, endDate: $endDate, workDays: $workDays, businessTripPlace: $businessTripPlace, purposeTrip: $purposeTrip, expensesTravelExpenses: $expensesTravelExpenses, reason: $reason, expensesDailyMoney: $expensesDailyMoney, expensesLivingPlace: $expensesLivingPlace, resultRub: $resultRub, resultKop: $resultKop, itemExpenditure: $itemExpenditure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateFormStatementsEntity &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.workDays, workDays) ||
                other.workDays == workDays) &&
            (identical(other.businessTripPlace, businessTripPlace) ||
                other.businessTripPlace == businessTripPlace) &&
            (identical(other.purposeTrip, purposeTrip) ||
                other.purposeTrip == purposeTrip) &&
            (identical(other.expensesTravelExpenses, expensesTravelExpenses) ||
                other.expensesTravelExpenses == expensesTravelExpenses) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.expensesDailyMoney, expensesDailyMoney) ||
                other.expensesDailyMoney == expensesDailyMoney) &&
            (identical(other.expensesLivingPlace, expensesLivingPlace) ||
                other.expensesLivingPlace == expensesLivingPlace) &&
            (identical(other.resultRub, resultRub) ||
                other.resultRub == resultRub) &&
            (identical(other.resultKop, resultKop) ||
                other.resultKop == resultKop) &&
            (identical(other.itemExpenditure, itemExpenditure) ||
                other.itemExpenditure == itemExpenditure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      patronymic,
      startDate,
      endDate,
      workDays,
      businessTripPlace,
      purposeTrip,
      expensesTravelExpenses,
      reason,
      expensesDailyMoney,
      expensesLivingPlace,
      resultRub,
      resultKop,
      itemExpenditure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateFormStatementsEntityCopyWith<_$_TemplateFormStatementsEntity>
      get copyWith => __$$_TemplateFormStatementsEntityCopyWithImpl<
          _$_TemplateFormStatementsEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateFormStatementsEntityToJson(
      this,
    );
  }
}

abstract class _TemplateFormStatementsEntity
    implements TemplateFormStatementsEntity {
  const factory _TemplateFormStatementsEntity(
      {@JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? patronymic,
      @JsonKey(name: 'start_date') final String? startDate,
      @JsonKey(name: 'end_date') final String? endDate,
      @JsonKey(name: 'work_days') final String? workDays,
      @JsonKey(name: 'business_trip_place') final String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') final String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses')
      final String? expensesTravelExpenses,
      final String? reason,
      @JsonKey(name: 'expenses_daily_money') final String? expensesDailyMoney,
      @JsonKey(name: 'expenses_living_place') final String? expensesLivingPlace,
      @JsonKey(name: 'result_rub') final String? resultRub,
      @JsonKey(name: 'result_kop') final String? resultKop,
      @JsonKey(name: 'item_expenditure')
      final String? itemExpenditure}) = _$_TemplateFormStatementsEntity;

  factory _TemplateFormStatementsEntity.fromJson(Map<String, dynamic> json) =
      _$_TemplateFormStatementsEntity.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get patronymic;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  @JsonKey(name: 'work_days')
  String? get workDays;
  @override
  @JsonKey(name: 'business_trip_place')
  String? get businessTripPlace;
  @override
  @JsonKey(name: 'purpose_trip')
  String? get purposeTrip;
  @override
  @JsonKey(name: 'expenses_travel_expenses')
  String? get expensesTravelExpenses;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'expenses_daily_money')
  String? get expensesDailyMoney;
  @override
  @JsonKey(name: 'expenses_living_place')
  String? get expensesLivingPlace;
  @override
  @JsonKey(name: 'result_rub')
  String? get resultRub;
  @override
  @JsonKey(name: 'result_kop')
  String? get resultKop;
  @override
  @JsonKey(name: 'item_expenditure')
  String? get itemExpenditure;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateFormStatementsEntityCopyWith<_$_TemplateFormStatementsEntity>
      get copyWith => throw _privateConstructorUsedError;
}

TemplateField _$TemplateFieldFromJson(Map<String, dynamic> json) {
  return _TemplateField.fromJson(json);
}

/// @nodoc
mixin _$TemplateField {
  @JsonKey(name: 'field_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_body')
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_data_type')
  String get dataType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateFieldCopyWith<TemplateField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateFieldCopyWith<$Res> {
  factory $TemplateFieldCopyWith(
          TemplateField value, $Res Function(TemplateField) then) =
      _$TemplateFieldCopyWithImpl<$Res, TemplateField>;
  @useResult
  $Res call(
      {@JsonKey(name: 'field_name') String name,
      @JsonKey(name: 'field_body') String body,
      @JsonKey(name: 'field_data_type') String dataType});
}

/// @nodoc
class _$TemplateFieldCopyWithImpl<$Res, $Val extends TemplateField>
    implements $TemplateFieldCopyWith<$Res> {
  _$TemplateFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? body = null,
    Object? dataType = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateFieldCopyWith<$Res>
    implements $TemplateFieldCopyWith<$Res> {
  factory _$$_TemplateFieldCopyWith(
          _$_TemplateField value, $Res Function(_$_TemplateField) then) =
      __$$_TemplateFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'field_name') String name,
      @JsonKey(name: 'field_body') String body,
      @JsonKey(name: 'field_data_type') String dataType});
}

/// @nodoc
class __$$_TemplateFieldCopyWithImpl<$Res>
    extends _$TemplateFieldCopyWithImpl<$Res, _$_TemplateField>
    implements _$$_TemplateFieldCopyWith<$Res> {
  __$$_TemplateFieldCopyWithImpl(
      _$_TemplateField _value, $Res Function(_$_TemplateField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? body = null,
    Object? dataType = null,
  }) {
    return _then(_$_TemplateField(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateField implements _TemplateField {
  const _$_TemplateField(
      {@JsonKey(name: 'field_name') required this.name,
      @JsonKey(name: 'field_body') required this.body,
      @JsonKey(name: 'field_data_type') required this.dataType});

  factory _$_TemplateField.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateFieldFromJson(json);

  @override
  @JsonKey(name: 'field_name')
  final String name;
  @override
  @JsonKey(name: 'field_body')
  final String body;
  @override
  @JsonKey(name: 'field_data_type')
  final String dataType;

  @override
  String toString() {
    return 'TemplateField(name: $name, body: $body, dataType: $dataType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateField &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, body, dataType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateFieldCopyWith<_$_TemplateField> get copyWith =>
      __$$_TemplateFieldCopyWithImpl<_$_TemplateField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateFieldToJson(
      this,
    );
  }
}

abstract class _TemplateField implements TemplateField {
  const factory _TemplateField(
          {@JsonKey(name: 'field_name') required final String name,
          @JsonKey(name: 'field_body') required final String body,
          @JsonKey(name: 'field_data_type') required final String dataType}) =
      _$_TemplateField;

  factory _TemplateField.fromJson(Map<String, dynamic> json) =
      _$_TemplateField.fromJson;

  @override
  @JsonKey(name: 'field_name')
  String get name;
  @override
  @JsonKey(name: 'field_body')
  String get body;
  @override
  @JsonKey(name: 'field_data_type')
  String get dataType;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateFieldCopyWith<_$_TemplateField> get copyWith =>
      throw _privateConstructorUsedError;
}
