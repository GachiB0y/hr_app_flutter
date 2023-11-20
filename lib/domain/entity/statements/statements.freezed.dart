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

StatementEntity _$StatementEntityFromJson(Map<String, dynamic> json) {
  return _StatementEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementEntity {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  List<TemplateField> get template => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementEntityCopyWith<StatementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementEntityCopyWith<$Res> {
  factory $StatementEntityCopyWith(
          StatementEntity value, $Res Function(StatementEntity) then) =
      _$StatementEntityCopyWithImpl<$Res, StatementEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      List<TemplateField> template});
}

/// @nodoc
class _$StatementEntityCopyWithImpl<$Res, $Val extends StatementEntity>
    implements $StatementEntityCopyWith<$Res> {
  _$StatementEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatementEntityCopyWith<$Res>
    implements $StatementEntityCopyWith<$Res> {
  factory _$$_StatementEntityCopyWith(
          _$_StatementEntity value, $Res Function(_$_StatementEntity) then) =
      __$$_StatementEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      List<TemplateField> template});
}

/// @nodoc
class __$$_StatementEntityCopyWithImpl<$Res>
    extends _$StatementEntityCopyWithImpl<$Res, _$_StatementEntity>
    implements _$$_StatementEntityCopyWith<$Res> {
  __$$_StatementEntityCopyWithImpl(
      _$_StatementEntity _value, $Res Function(_$_StatementEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? template = null,
  }) {
    return _then(_$_StatementEntity(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value._template
          : template // ignore: cast_nullable_to_non_nullable
              as List<TemplateField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatementEntity implements _StatementEntity {
  const _$_StatementEntity(
      {@JsonKey(name: 'document_type') required this.documentType,
      required final List<TemplateField> template})
      : _template = template;

  factory _$_StatementEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementEntityFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  final List<TemplateField> _template;
  @override
  List<TemplateField> get template {
    if (_template is EqualUnmodifiableListView) return _template;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_template);
  }

  @override
  String toString() {
    return 'StatementEntity(documentType: $documentType, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementEntity &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            const DeepCollectionEquality().equals(other._template, _template));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, documentType,
      const DeepCollectionEquality().hash(_template));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementEntityCopyWith<_$_StatementEntity> get copyWith =>
      __$$_StatementEntityCopyWithImpl<_$_StatementEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementEntityToJson(
      this,
    );
  }
}

abstract class _StatementEntity implements StatementEntity {
  const factory _StatementEntity(
      {@JsonKey(name: 'document_type') required final String documentType,
      required final List<TemplateField> template}) = _$_StatementEntity;

  factory _StatementEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementEntity.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  List<TemplateField> get template;
  @override
  @JsonKey(ignore: true)
  _$$_StatementEntityCopyWith<_$_StatementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

StatementFielTypedEntity _$StatementFielTypedEntityFromJson(
    Map<String, dynamic> json) {
  return _StatementFielTypedEntity.fromJson(json);
}

/// @nodoc
mixin _$StatementFielTypedEntity {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_body')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFielTypedEntityCopyWith<StatementFielTypedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFielTypedEntityCopyWith<$Res> {
  factory $StatementFielTypedEntityCopyWith(StatementFielTypedEntity value,
          $Res Function(StatementFielTypedEntity) then) =
      _$StatementFielTypedEntityCopyWithImpl<$Res, StatementFielTypedEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'field_body') String name});
}

/// @nodoc
class _$StatementFielTypedEntityCopyWithImpl<$Res,
        $Val extends StatementFielTypedEntity>
    implements $StatementFielTypedEntityCopyWith<$Res> {
  _$StatementFielTypedEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_StatementFielTypedEntityCopyWith<$Res>
    implements $StatementFielTypedEntityCopyWith<$Res> {
  factory _$$_StatementFielTypedEntityCopyWith(
          _$_StatementFielTypedEntity value,
          $Res Function(_$_StatementFielTypedEntity) then) =
      __$$_StatementFielTypedEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'field_body') String name});
}

/// @nodoc
class __$$_StatementFielTypedEntityCopyWithImpl<$Res>
    extends _$StatementFielTypedEntityCopyWithImpl<$Res,
        _$_StatementFielTypedEntity>
    implements _$$_StatementFielTypedEntityCopyWith<$Res> {
  __$$_StatementFielTypedEntityCopyWithImpl(_$_StatementFielTypedEntity _value,
      $Res Function(_$_StatementFielTypedEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? name = null,
  }) {
    return _then(_$_StatementFielTypedEntity(
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
class _$_StatementFielTypedEntity implements _StatementFielTypedEntity {
  const _$_StatementFielTypedEntity(
      {@JsonKey(name: 'document_type') required this.documentType,
      @JsonKey(name: 'field_body') required this.name});

  factory _$_StatementFielTypedEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFielTypedEntityFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  @override
  @JsonKey(name: 'field_body')
  final String name;

  @override
  String toString() {
    return 'StatementFielTypedEntity(documentType: $documentType, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFielTypedEntity &&
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
  _$$_StatementFielTypedEntityCopyWith<_$_StatementFielTypedEntity>
      get copyWith => __$$_StatementFielTypedEntityCopyWithImpl<
          _$_StatementFielTypedEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFielTypedEntityToJson(
      this,
    );
  }
}

abstract class _StatementFielTypedEntity implements StatementFielTypedEntity {
  const factory _StatementFielTypedEntity(
          {@JsonKey(name: 'document_type') required final String documentType,
          @JsonKey(name: 'field_body') required final String name}) =
      _$_StatementFielTypedEntity;

  factory _StatementFielTypedEntity.fromJson(Map<String, dynamic> json) =
      _$_StatementFielTypedEntity.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  @JsonKey(name: 'field_body')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFielTypedEntityCopyWith<_$_StatementFielTypedEntity>
      get copyWith => throw _privateConstructorUsedError;
}

StatementFormInfo _$StatementFormInfoFromJson(Map<String, dynamic> json) {
  return _StatementFormInfo.fromJson(json);
}

/// @nodoc
mixin _$StatementFormInfo {
  @JsonKey(name: 'document_type')
  String get documentType => throw _privateConstructorUsedError;
  TemplateFormStatementsEntity get template =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementFormInfoCopyWith<StatementFormInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementFormInfoCopyWith<$Res> {
  factory $StatementFormInfoCopyWith(
          StatementFormInfo value, $Res Function(StatementFormInfo) then) =
      _$StatementFormInfoCopyWithImpl<$Res, StatementFormInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      TemplateFormStatementsEntity template});

  $TemplateFormStatementsEntityCopyWith<$Res> get template;
}

/// @nodoc
class _$StatementFormInfoCopyWithImpl<$Res, $Val extends StatementFormInfo>
    implements $StatementFormInfoCopyWith<$Res> {
  _$StatementFormInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_StatementFormInfoCopyWith<$Res>
    implements $StatementFormInfoCopyWith<$Res> {
  factory _$$_StatementFormInfoCopyWith(_$_StatementFormInfo value,
          $Res Function(_$_StatementFormInfo) then) =
      __$$_StatementFormInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_type') String documentType,
      TemplateFormStatementsEntity template});

  @override
  $TemplateFormStatementsEntityCopyWith<$Res> get template;
}

/// @nodoc
class __$$_StatementFormInfoCopyWithImpl<$Res>
    extends _$StatementFormInfoCopyWithImpl<$Res, _$_StatementFormInfo>
    implements _$$_StatementFormInfoCopyWith<$Res> {
  __$$_StatementFormInfoCopyWithImpl(
      _$_StatementFormInfo _value, $Res Function(_$_StatementFormInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? template = null,
  }) {
    return _then(_$_StatementFormInfo(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
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
class _$_StatementFormInfo implements _StatementFormInfo {
  const _$_StatementFormInfo(
      {@JsonKey(name: 'document_type') required this.documentType,
      required this.template});

  factory _$_StatementFormInfo.fromJson(Map<String, dynamic> json) =>
      _$$_StatementFormInfoFromJson(json);

  @override
  @JsonKey(name: 'document_type')
  final String documentType;
  @override
  final TemplateFormStatementsEntity template;

  @override
  String toString() {
    return 'StatementFormInfo(documentType: $documentType, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatementFormInfo &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, documentType, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatementFormInfoCopyWith<_$_StatementFormInfo> get copyWith =>
      __$$_StatementFormInfoCopyWithImpl<_$_StatementFormInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementFormInfoToJson(
      this,
    );
  }
}

abstract class _StatementFormInfo implements StatementFormInfo {
  const factory _StatementFormInfo(
          {@JsonKey(name: 'document_type') required final String documentType,
          required final TemplateFormStatementsEntity template}) =
      _$_StatementFormInfo;

  factory _StatementFormInfo.fromJson(Map<String, dynamic> json) =
      _$_StatementFormInfo.fromJson;

  @override
  @JsonKey(name: 'document_type')
  String get documentType;
  @override
  TemplateFormStatementsEntity get template;
  @override
  @JsonKey(ignore: true)
  _$$_StatementFormInfoCopyWith<_$_StatementFormInfo> get copyWith =>
      throw _privateConstructorUsedError;
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
  @JsonKey(name: 'weekend_days')
  String? get weekendDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_trip_place')
  String? get businessTripPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'purpose_trip')
  String? get purposeTrip => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_travel_expenses')
  String? get expensesTravelExpenses => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_aily_money')
  String? get expensesAilyMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_living_place')
  String? get expensesLivingPlace => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'weekend_days') String? weekendDays,
      @JsonKey(name: 'business_trip_place') String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') String? expensesTravelExpenses,
      @JsonKey(name: 'expenses_aily_money') String? expensesAilyMoney,
      @JsonKey(name: 'expenses_living_place') String? expensesLivingPlace});
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
    Object? weekendDays = freezed,
    Object? businessTripPlace = freezed,
    Object? purposeTrip = freezed,
    Object? expensesTravelExpenses = freezed,
    Object? expensesAilyMoney = freezed,
    Object? expensesLivingPlace = freezed,
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
      weekendDays: freezed == weekendDays
          ? _value.weekendDays
          : weekendDays // ignore: cast_nullable_to_non_nullable
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
      expensesAilyMoney: freezed == expensesAilyMoney
          ? _value.expensesAilyMoney
          : expensesAilyMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesLivingPlace: freezed == expensesLivingPlace
          ? _value.expensesLivingPlace
          : expensesLivingPlace // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'weekend_days') String? weekendDays,
      @JsonKey(name: 'business_trip_place') String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') String? expensesTravelExpenses,
      @JsonKey(name: 'expenses_aily_money') String? expensesAilyMoney,
      @JsonKey(name: 'expenses_living_place') String? expensesLivingPlace});
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
    Object? weekendDays = freezed,
    Object? businessTripPlace = freezed,
    Object? purposeTrip = freezed,
    Object? expensesTravelExpenses = freezed,
    Object? expensesAilyMoney = freezed,
    Object? expensesLivingPlace = freezed,
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
      weekendDays: freezed == weekendDays
          ? _value.weekendDays
          : weekendDays // ignore: cast_nullable_to_non_nullable
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
      expensesAilyMoney: freezed == expensesAilyMoney
          ? _value.expensesAilyMoney
          : expensesAilyMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      expensesLivingPlace: freezed == expensesLivingPlace
          ? _value.expensesLivingPlace
          : expensesLivingPlace // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'weekend_days') this.weekendDays,
      @JsonKey(name: 'business_trip_place') this.businessTripPlace,
      @JsonKey(name: 'purpose_trip') this.purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses') this.expensesTravelExpenses,
      @JsonKey(name: 'expenses_aily_money') this.expensesAilyMoney,
      @JsonKey(name: 'expenses_living_place') this.expensesLivingPlace});

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
  @JsonKey(name: 'weekend_days')
  final String? weekendDays;
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
  @JsonKey(name: 'expenses_aily_money')
  final String? expensesAilyMoney;
  @override
  @JsonKey(name: 'expenses_living_place')
  final String? expensesLivingPlace;

  @override
  String toString() {
    return 'TemplateFormStatementsEntity(firstName: $firstName, lastName: $lastName, patronymic: $patronymic, startDate: $startDate, endDate: $endDate, weekendDays: $weekendDays, businessTripPlace: $businessTripPlace, purposeTrip: $purposeTrip, expensesTravelExpenses: $expensesTravelExpenses, expensesAilyMoney: $expensesAilyMoney, expensesLivingPlace: $expensesLivingPlace)';
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
            (identical(other.weekendDays, weekendDays) ||
                other.weekendDays == weekendDays) &&
            (identical(other.businessTripPlace, businessTripPlace) ||
                other.businessTripPlace == businessTripPlace) &&
            (identical(other.purposeTrip, purposeTrip) ||
                other.purposeTrip == purposeTrip) &&
            (identical(other.expensesTravelExpenses, expensesTravelExpenses) ||
                other.expensesTravelExpenses == expensesTravelExpenses) &&
            (identical(other.expensesAilyMoney, expensesAilyMoney) ||
                other.expensesAilyMoney == expensesAilyMoney) &&
            (identical(other.expensesLivingPlace, expensesLivingPlace) ||
                other.expensesLivingPlace == expensesLivingPlace));
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
      weekendDays,
      businessTripPlace,
      purposeTrip,
      expensesTravelExpenses,
      expensesAilyMoney,
      expensesLivingPlace);

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
      @JsonKey(name: 'weekend_days') final String? weekendDays,
      @JsonKey(name: 'business_trip_place') final String? businessTripPlace,
      @JsonKey(name: 'purpose_trip') final String? purposeTrip,
      @JsonKey(name: 'expenses_travel_expenses')
      final String? expensesTravelExpenses,
      @JsonKey(name: 'expenses_aily_money') final String? expensesAilyMoney,
      @JsonKey(name: 'expenses_living_place')
      final String? expensesLivingPlace}) = _$_TemplateFormStatementsEntity;

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
  @JsonKey(name: 'weekend_days')
  String? get weekendDays;
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
  @JsonKey(name: 'expenses_aily_money')
  String? get expensesAilyMoney;
  @override
  @JsonKey(name: 'expenses_living_place')
  String? get expensesLivingPlace;
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
  String get value => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'field_body') String value});
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
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'field_body') String value});
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
    Object? value = null,
  }) {
    return _then(_$_TemplateField(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateField implements _TemplateField {
  const _$_TemplateField(
      {@JsonKey(name: 'field_name') required this.name,
      @JsonKey(name: 'field_body') required this.value});

  factory _$_TemplateField.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateFieldFromJson(json);

  @override
  @JsonKey(name: 'field_name')
  final String name;
  @override
  @JsonKey(name: 'field_body')
  final String value;

  @override
  String toString() {
    return 'TemplateField(name: $name, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateField &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

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
          @JsonKey(name: 'field_body') required final String value}) =
      _$_TemplateField;

  factory _TemplateField.fromJson(Map<String, dynamic> json) =
      _$_TemplateField.fromJson;

  @override
  @JsonKey(name: 'field_name')
  String get name;
  @override
  @JsonKey(name: 'field_body')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateFieldCopyWith<_$_TemplateField> get copyWith =>
      throw _privateConstructorUsedError;
}
