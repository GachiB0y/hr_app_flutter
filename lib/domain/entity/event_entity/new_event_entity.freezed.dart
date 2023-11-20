// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return _EventEntity.fromJson(json);
}

/// @nodoc
mixin _$EventEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_publish')
  bool get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories')
  List<Category> get categories => throw _privateConstructorUsedError;
  Writer get writer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventEntityCopyWith<EventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
          EventEntity value, $Res Function(EventEntity) then) =
      _$EventEntityCopyWithImpl<$Res, EventEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String image,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_publish') bool isPublish,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'categories') List<Category> categories,
      Writer writer});

  $WriterCopyWith<$Res> get writer;
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res, $Val extends EventEntity>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPublish = null,
    Object? isArchived = null,
    Object? categories = null,
    Object? writer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPublish: null == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as Writer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WriterCopyWith<$Res> get writer {
    return $WriterCopyWith<$Res>(_value.writer, (value) {
      return _then(_value.copyWith(writer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventEntityCopyWith<$Res>
    implements $EventEntityCopyWith<$Res> {
  factory _$$_EventEntityCopyWith(
          _$_EventEntity value, $Res Function(_$_EventEntity) then) =
      __$$_EventEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String image,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_publish') bool isPublish,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'categories') List<Category> categories,
      Writer writer});

  @override
  $WriterCopyWith<$Res> get writer;
}

/// @nodoc
class __$$_EventEntityCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$_EventEntity>
    implements _$$_EventEntityCopyWith<$Res> {
  __$$_EventEntityCopyWithImpl(
      _$_EventEntity _value, $Res Function(_$_EventEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPublish = null,
    Object? isArchived = null,
    Object? categories = null,
    Object? writer = null,
  }) {
    return _then(_$_EventEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPublish: null == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as Writer,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_EventEntity implements _EventEntity {
  const _$_EventEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_publish') required this.isPublish,
      @JsonKey(name: 'is_archived') required this.isArchived,
      @JsonKey(name: 'categories') required final List<Category> categories,
      required this.writer})
      : _categories = categories;

  factory _$_EventEntity.fromJson(Map<String, dynamic> json) =>
      _$$_EventEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_publish')
  final bool isPublish;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  final List<Category> _categories;
  @override
  @JsonKey(name: 'categories')
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final Writer writer;

  @override
  String toString() {
    return 'EventEntity(id: $id, title: $title, description: $description, image: $image, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, isPublish: $isPublish, isArchived: $isArchived, categories: $categories, writer: $writer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.writer, writer) || other.writer == writer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      image,
      startDate,
      endDate,
      createdAt,
      updatedAt,
      isPublish,
      isArchived,
      const DeepCollectionEquality().hash(_categories),
      writer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventEntityCopyWith<_$_EventEntity> get copyWith =>
      __$$_EventEntityCopyWithImpl<_$_EventEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventEntityToJson(
      this,
    );
  }
}

abstract class _EventEntity implements EventEntity {
  const factory _EventEntity(
      {required final int id,
      required final String title,
      required final String description,
      required final String image,
      @JsonKey(name: 'start_date') required final DateTime startDate,
      @JsonKey(name: 'end_date') required final DateTime? endDate,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'is_publish') required final bool isPublish,
      @JsonKey(name: 'is_archived') required final bool isArchived,
      @JsonKey(name: 'categories') required final List<Category> categories,
      required final Writer writer}) = _$_EventEntity;

  factory _EventEntity.fromJson(Map<String, dynamic> json) =
      _$_EventEntity.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'is_publish')
  bool get isPublish;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  @JsonKey(name: 'categories')
  List<Category> get categories;
  @override
  Writer get writer;
  @override
  @JsonKey(ignore: true)
  _$$_EventEntityCopyWith<_$_EventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Category(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category({required this.id, required this.name});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Category(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category({required final int id, required final String name}) =
      _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

Writer _$WriterFromJson(Map<String, dynamic> json) {
  return _Writer.fromJson(json);
}

/// @nodoc
mixin _$Writer {
  @JsonKey(name: 'user_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_i')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_o')
  String get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WriterCopyWith<Writer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriterCopyWith<$Res> {
  factory $WriterCopyWith(Writer value, $Res Function(Writer) then) =
      _$WriterCopyWithImpl<$Res, Writer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int id,
      @JsonKey(name: 'name_i') String firstName,
      @JsonKey(name: 'name') String middleName,
      @JsonKey(name: 'name_o') String lastName});
}

/// @nodoc
class _$WriterCopyWithImpl<$Res, $Val extends Writer>
    implements $WriterCopyWith<$Res> {
  _$WriterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WriterCopyWith<$Res> implements $WriterCopyWith<$Res> {
  factory _$$_WriterCopyWith(_$_Writer value, $Res Function(_$_Writer) then) =
      __$$_WriterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int id,
      @JsonKey(name: 'name_i') String firstName,
      @JsonKey(name: 'name') String middleName,
      @JsonKey(name: 'name_o') String lastName});
}

/// @nodoc
class __$$_WriterCopyWithImpl<$Res>
    extends _$WriterCopyWithImpl<$Res, _$_Writer>
    implements _$$_WriterCopyWith<$Res> {
  __$$_WriterCopyWithImpl(_$_Writer _value, $Res Function(_$_Writer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
  }) {
    return _then(_$_Writer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Writer implements _Writer {
  const _$_Writer(
      {@JsonKey(name: 'user_id') required this.id,
      @JsonKey(name: 'name_i') required this.firstName,
      @JsonKey(name: 'name') required this.middleName,
      @JsonKey(name: 'name_o') required this.lastName});

  factory _$_Writer.fromJson(Map<String, dynamic> json) =>
      _$$_WriterFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int id;
  @override
  @JsonKey(name: 'name_i')
  final String firstName;
  @override
  @JsonKey(name: 'name')
  final String middleName;
  @override
  @JsonKey(name: 'name_o')
  final String lastName;

  @override
  String toString() {
    return 'Writer(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Writer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, middleName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      __$$_WriterCopyWithImpl<_$_Writer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WriterToJson(
      this,
    );
  }
}

abstract class _Writer implements Writer {
  const factory _Writer(
      {@JsonKey(name: 'user_id') required final int id,
      @JsonKey(name: 'name_i') required final String firstName,
      @JsonKey(name: 'name') required final String middleName,
      @JsonKey(name: 'name_o') required final String lastName}) = _$_Writer;

  factory _Writer.fromJson(Map<String, dynamic> json) = _$_Writer.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get id;
  @override
  @JsonKey(name: 'name_i')
  String get firstName;
  @override
  @JsonKey(name: 'name')
  String get middleName;
  @override
  @JsonKey(name: 'name_o')
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      throw _privateConstructorUsedError;
}

EventEntityViewModel _$EventEntityViewModelFromJson(Map<String, dynamic> json) {
  return _EventEntityViewModel.fromJson(json);
}

/// @nodoc
mixin _$EventEntityViewModel {
  List<EventEntity> get listEventEntityLoaded =>
      throw _privateConstructorUsedError;
  List<EventEntity> get filteredListEventEntity =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventEntityViewModelCopyWith<EventEntityViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityViewModelCopyWith<$Res> {
  factory $EventEntityViewModelCopyWith(EventEntityViewModel value,
          $Res Function(EventEntityViewModel) then) =
      _$EventEntityViewModelCopyWithImpl<$Res, EventEntityViewModel>;
  @useResult
  $Res call(
      {List<EventEntity> listEventEntityLoaded,
      List<EventEntity> filteredListEventEntity});
}

/// @nodoc
class _$EventEntityViewModelCopyWithImpl<$Res,
        $Val extends EventEntityViewModel>
    implements $EventEntityViewModelCopyWith<$Res> {
  _$EventEntityViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEventEntityLoaded = null,
    Object? filteredListEventEntity = null,
  }) {
    return _then(_value.copyWith(
      listEventEntityLoaded: null == listEventEntityLoaded
          ? _value.listEventEntityLoaded
          : listEventEntityLoaded // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
      filteredListEventEntity: null == filteredListEventEntity
          ? _value.filteredListEventEntity
          : filteredListEventEntity // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventEntityViewModelCopyWith<$Res>
    implements $EventEntityViewModelCopyWith<$Res> {
  factory _$$_EventEntityViewModelCopyWith(_$_EventEntityViewModel value,
          $Res Function(_$_EventEntityViewModel) then) =
      __$$_EventEntityViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventEntity> listEventEntityLoaded,
      List<EventEntity> filteredListEventEntity});
}

/// @nodoc
class __$$_EventEntityViewModelCopyWithImpl<$Res>
    extends _$EventEntityViewModelCopyWithImpl<$Res, _$_EventEntityViewModel>
    implements _$$_EventEntityViewModelCopyWith<$Res> {
  __$$_EventEntityViewModelCopyWithImpl(_$_EventEntityViewModel _value,
      $Res Function(_$_EventEntityViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEventEntityLoaded = null,
    Object? filteredListEventEntity = null,
  }) {
    return _then(_$_EventEntityViewModel(
      listEventEntityLoaded: null == listEventEntityLoaded
          ? _value._listEventEntityLoaded
          : listEventEntityLoaded // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
      filteredListEventEntity: null == filteredListEventEntity
          ? _value._filteredListEventEntity
          : filteredListEventEntity // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventEntityViewModel implements _EventEntityViewModel {
  const _$_EventEntityViewModel(
      {required final List<EventEntity> listEventEntityLoaded,
      required final List<EventEntity> filteredListEventEntity})
      : _listEventEntityLoaded = listEventEntityLoaded,
        _filteredListEventEntity = filteredListEventEntity;

  factory _$_EventEntityViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventEntityViewModelFromJson(json);

  final List<EventEntity> _listEventEntityLoaded;
  @override
  List<EventEntity> get listEventEntityLoaded {
    if (_listEventEntityLoaded is EqualUnmodifiableListView)
      return _listEventEntityLoaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listEventEntityLoaded);
  }

  final List<EventEntity> _filteredListEventEntity;
  @override
  List<EventEntity> get filteredListEventEntity {
    if (_filteredListEventEntity is EqualUnmodifiableListView)
      return _filteredListEventEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredListEventEntity);
  }

  @override
  String toString() {
    return 'EventEntityViewModel(listEventEntityLoaded: $listEventEntityLoaded, filteredListEventEntity: $filteredListEventEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventEntityViewModel &&
            const DeepCollectionEquality()
                .equals(other._listEventEntityLoaded, _listEventEntityLoaded) &&
            const DeepCollectionEquality().equals(
                other._filteredListEventEntity, _filteredListEventEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listEventEntityLoaded),
      const DeepCollectionEquality().hash(_filteredListEventEntity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventEntityViewModelCopyWith<_$_EventEntityViewModel> get copyWith =>
      __$$_EventEntityViewModelCopyWithImpl<_$_EventEntityViewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventEntityViewModelToJson(
      this,
    );
  }
}

abstract class _EventEntityViewModel implements EventEntityViewModel {
  const factory _EventEntityViewModel(
          {required final List<EventEntity> listEventEntityLoaded,
          required final List<EventEntity> filteredListEventEntity}) =
      _$_EventEntityViewModel;

  factory _EventEntityViewModel.fromJson(Map<String, dynamic> json) =
      _$_EventEntityViewModel.fromJson;

  @override
  List<EventEntity> get listEventEntityLoaded;
  @override
  List<EventEntity> get filteredListEventEntity;
  @override
  @JsonKey(ignore: true)
  _$$_EventEntityViewModelCopyWith<_$_EventEntityViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
