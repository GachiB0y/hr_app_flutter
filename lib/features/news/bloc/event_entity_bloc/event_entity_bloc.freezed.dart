// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventEntityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            String startDate,
            String? endDate,
            File imageFile,
            List<String> categories)
        create,
    required TResult Function() fetch,
    required TResult Function(int idTab) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult? Function()? fetch,
    TResult? Function(int idTab)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult Function()? fetch,
    TResult Function(int idTab)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventCreate value) create,
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventCreate value)? create,
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventCreate value)? create,
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityEventCopyWith<$Res> {
  factory $EventEntityEventCopyWith(
          EventEntityEvent value, $Res Function(EventEntityEvent) then) =
      _$EventEntityEventCopyWithImpl<$Res, EventEntityEvent>;
}

/// @nodoc
class _$EventEntityEventCopyWithImpl<$Res, $Val extends EventEntityEvent>
    implements $EventEntityEventCopyWith<$Res> {
  _$EventEntityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventEntityEventCreateImplCopyWith<$Res> {
  factory _$$EventEntityEventCreateImplCopyWith(
          _$EventEntityEventCreateImpl value,
          $Res Function(_$EventEntityEventCreateImpl) then) =
      __$$EventEntityEventCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String description,
      String startDate,
      String? endDate,
      File imageFile,
      List<String> categories});
}

/// @nodoc
class __$$EventEntityEventCreateImplCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventCreateImpl>
    implements _$$EventEntityEventCreateImplCopyWith<$Res> {
  __$$EventEntityEventCreateImplCopyWithImpl(
      _$EventEntityEventCreateImpl _value,
      $Res Function(_$EventEntityEventCreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? imageFile = null,
    Object? categories = null,
  }) {
    return _then(_$EventEntityEventCreateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$EventEntityEventCreateImpl extends EventEntityEventCreate {
  const _$EventEntityEventCreateImpl(
      {required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.imageFile,
      required final List<String> categories})
      : _categories = categories,
        super._();

  @override
  final String title;
  @override
  final String description;
  @override
  final String startDate;
  @override
  final String? endDate;
  @override
  final File imageFile;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'EventEntityEvent.create(title: $title, description: $description, startDate: $startDate, endDate: $endDate, imageFile: $imageFile, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityEventCreateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, startDate,
      endDate, imageFile, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityEventCreateImplCopyWith<_$EventEntityEventCreateImpl>
      get copyWith => __$$EventEntityEventCreateImplCopyWithImpl<
          _$EventEntityEventCreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            String startDate,
            String? endDate,
            File imageFile,
            List<String> categories)
        create,
    required TResult Function() fetch,
    required TResult Function(int idTab) update,
  }) {
    return create(
        title, description, startDate, endDate, imageFile, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult? Function()? fetch,
    TResult? Function(int idTab)? update,
  }) {
    return create?.call(
        title, description, startDate, endDate, imageFile, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult Function()? fetch,
    TResult Function(int idTab)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          title, description, startDate, endDate, imageFile, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventCreate value) create,
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventUpdate value) update,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventCreate value)? create,
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventUpdate value)? update,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventCreate value)? create,
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventCreate extends EventEntityEvent {
  const factory EventEntityEventCreate(
      {required final String title,
      required final String description,
      required final String startDate,
      required final String? endDate,
      required final File imageFile,
      required final List<String> categories}) = _$EventEntityEventCreateImpl;
  const EventEntityEventCreate._() : super._();

  String get title;
  String get description;
  String get startDate;
  String? get endDate;
  File get imageFile;
  List<String> get categories;
  @JsonKey(ignore: true)
  _$$EventEntityEventCreateImplCopyWith<_$EventEntityEventCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventEntityEventFetchImplCopyWith<$Res> {
  factory _$$EventEntityEventFetchImplCopyWith(
          _$EventEntityEventFetchImpl value,
          $Res Function(_$EventEntityEventFetchImpl) then) =
      __$$EventEntityEventFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityEventFetchImplCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventFetchImpl>
    implements _$$EventEntityEventFetchImplCopyWith<$Res> {
  __$$EventEntityEventFetchImplCopyWithImpl(_$EventEntityEventFetchImpl _value,
      $Res Function(_$EventEntityEventFetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventEntityEventFetchImpl extends EventEntityEventFetch {
  const _$EventEntityEventFetchImpl() : super._();

  @override
  String toString() {
    return 'EventEntityEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityEventFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            String startDate,
            String? endDate,
            File imageFile,
            List<String> categories)
        create,
    required TResult Function() fetch,
    required TResult Function(int idTab) update,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult? Function()? fetch,
    TResult? Function(int idTab)? update,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult Function()? fetch,
    TResult Function(int idTab)? update,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventCreate value) create,
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventUpdate value) update,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventCreate value)? create,
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventUpdate value)? update,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventCreate value)? create,
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventFetch extends EventEntityEvent {
  const factory EventEntityEventFetch() = _$EventEntityEventFetchImpl;
  const EventEntityEventFetch._() : super._();
}

/// @nodoc
abstract class _$$EventEntityEventUpdateImplCopyWith<$Res> {
  factory _$$EventEntityEventUpdateImplCopyWith(
          _$EventEntityEventUpdateImpl value,
          $Res Function(_$EventEntityEventUpdateImpl) then) =
      __$$EventEntityEventUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int idTab});
}

/// @nodoc
class __$$EventEntityEventUpdateImplCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventUpdateImpl>
    implements _$$EventEntityEventUpdateImplCopyWith<$Res> {
  __$$EventEntityEventUpdateImplCopyWithImpl(
      _$EventEntityEventUpdateImpl _value,
      $Res Function(_$EventEntityEventUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTab = null,
  }) {
    return _then(_$EventEntityEventUpdateImpl(
      idTab: null == idTab
          ? _value.idTab
          : idTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EventEntityEventUpdateImpl extends EventEntityEventUpdate {
  const _$EventEntityEventUpdateImpl({required this.idTab}) : super._();

  @override
  final int idTab;

  @override
  String toString() {
    return 'EventEntityEvent.update(idTab: $idTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityEventUpdateImpl &&
            (identical(other.idTab, idTab) || other.idTab == idTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityEventUpdateImplCopyWith<_$EventEntityEventUpdateImpl>
      get copyWith => __$$EventEntityEventUpdateImplCopyWithImpl<
          _$EventEntityEventUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            String startDate,
            String? endDate,
            File imageFile,
            List<String> categories)
        create,
    required TResult Function() fetch,
    required TResult Function(int idTab) update,
  }) {
    return update(idTab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult? Function()? fetch,
    TResult? Function(int idTab)? update,
  }) {
    return update?.call(idTab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, String startDate,
            String? endDate, File imageFile, List<String> categories)?
        create,
    TResult Function()? fetch,
    TResult Function(int idTab)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(idTab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventCreate value) create,
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventCreate value)? create,
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventCreate value)? create,
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventUpdate extends EventEntityEvent {
  const factory EventEntityEventUpdate({required final int idTab}) =
      _$EventEntityEventUpdateImpl;
  const EventEntityEventUpdate._() : super._();

  int get idTab;
  @JsonKey(ignore: true)
  _$$EventEntityEventUpdateImplCopyWith<_$EventEntityEventUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
