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
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_publish')
  bool get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  List<Category> get category_id => throw _privateConstructorUsedError;
  Writer get write => throw _privateConstructorUsedError;

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
      String content,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_publish') bool isPublish,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'category_id') List<Category> category_id,
      Writer write});

  $WriterCopyWith<$Res> get write;
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
    Object? content = null,
    Object? imageUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPublish = null,
    Object? isArchived = null,
    Object? category_id = null,
    Object? write = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      category_id: null == category_id
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      write: null == write
          ? _value.write
          : write // ignore: cast_nullable_to_non_nullable
              as Writer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WriterCopyWith<$Res> get write {
    return $WriterCopyWith<$Res>(_value.write, (value) {
      return _then(_value.copyWith(write: value) as $Val);
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
      String content,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_publish') bool isPublish,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'category_id') List<Category> category_id,
      Writer write});

  @override
  $WriterCopyWith<$Res> get write;
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
    Object? content = null,
    Object? imageUrl = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPublish = null,
    Object? isArchived = null,
    Object? category_id = null,
    Object? write = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      category_id: null == category_id
          ? _value._category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      write: null == write
          ? _value.write
          : write // ignore: cast_nullable_to_non_nullable
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
      required this.content,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_publish') required this.isPublish,
      @JsonKey(name: 'is_archived') required this.isArchived,
      @JsonKey(name: 'category_id') required final List<Category> category_id,
      required this.write})
      : _category_id = category_id;

  factory _$_EventEntity.fromJson(Map<String, dynamic> json) =>
      _$$_EventEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
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
  final List<Category> _category_id;
  @override
  @JsonKey(name: 'category_id')
  List<Category> get category_id {
    if (_category_id is EqualUnmodifiableListView) return _category_id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category_id);
  }

  @override
  final Writer write;

  @override
  String toString() {
    return 'EventEntity(id: $id, title: $title, content: $content, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isPublish: $isPublish, isArchived: $isArchived, category_id: $category_id, write: $write)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            const DeepCollectionEquality()
                .equals(other._category_id, _category_id) &&
            (identical(other.write, write) || other.write == write));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      imageUrl,
      createdAt,
      updatedAt,
      isPublish,
      isArchived,
      const DeepCollectionEquality().hash(_category_id),
      write);

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
      required final String content,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'is_publish') required final bool isPublish,
      @JsonKey(name: 'is_archived') required final bool isArchived,
      @JsonKey(name: 'category_id') required final List<Category> category_id,
      required final Writer write}) = _$_EventEntity;

  factory _EventEntity.fromJson(Map<String, dynamic> json) =
      _$_EventEntity.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
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
  @JsonKey(name: 'category_id')
  List<Category> get category_id;
  @override
  Writer get write;
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
  String get title => throw _privateConstructorUsedError;

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
  $Res call({int id, String title});
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
    Object? title = null,
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
  $Res call({int id, String title});
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
    Object? title = null,
  }) {
    return _then(_$_Category(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category({required this.id, required this.title});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'Category(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

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
  const factory _Category(
      {required final int id, required final String title}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get id;
  @override
  String get title;
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
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
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
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'middle_name') String middleName,
      @JsonKey(name: 'last_name') String lastName});
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
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'middle_name') String middleName,
      @JsonKey(name: 'last_name') String lastName});
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
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'middle_name') required this.middleName,
      @JsonKey(name: 'last_name') required this.lastName});

  factory _$_Writer.fromJson(Map<String, dynamic> json) =>
      _$$_WriterFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'middle_name')
  final String middleName;
  @override
  @JsonKey(name: 'last_name')
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
      {required final int id,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'middle_name') required final String middleName,
      @JsonKey(name: 'last_name') required final String lastName}) = _$_Writer;

  factory _Writer.fromJson(Map<String, dynamic> json) = _$_Writer.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'middle_name')
  String get middleName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      throw _privateConstructorUsedError;
}
