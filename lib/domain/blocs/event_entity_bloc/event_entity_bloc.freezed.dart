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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventEntityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(
            String title,
            String description,
            String startDate,
            String endDate,
            File imageFile,
            List<String> categories)
        createNewEventEntity,
    required TResult Function(
            int idTab, List<EventEntity> listEventEntityLoaded)
        filterNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult? Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventCreateNewEventEntity value)
        createNewEventEntity,
    required TResult Function(EventEntityEventFilterNews value) filterNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult? Function(EventEntityEventFilterNews value)? filterNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult Function(EventEntityEventFilterNews value)? filterNews,
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
abstract class _$$EventEntityEventFetchCopyWith<$Res> {
  factory _$$EventEntityEventFetchCopyWith(_$EventEntityEventFetch value,
          $Res Function(_$EventEntityEventFetch) then) =
      __$$EventEntityEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityEventFetchCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventFetch>
    implements _$$EventEntityEventFetchCopyWith<$Res> {
  __$$EventEntityEventFetchCopyWithImpl(_$EventEntityEventFetch _value,
      $Res Function(_$EventEntityEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventEntityEventFetch implements EventEntityEventFetch {
  const _$EventEntityEventFetch();

  @override
  String toString() {
    return 'EventEntityEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventEntityEventFetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(
            String title,
            String description,
            String startDate,
            String endDate,
            File imageFile,
            List<String> categories)
        createNewEventEntity,
    required TResult Function(
            int idTab, List<EventEntity> listEventEntityLoaded)
        filterNews,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult? Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
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
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventCreateNewEventEntity value)
        createNewEventEntity,
    required TResult Function(EventEntityEventFilterNews value) filterNews,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult? Function(EventEntityEventFilterNews value)? filterNews,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult Function(EventEntityEventFilterNews value)? filterNews,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventFetch implements EventEntityEvent {
  const factory EventEntityEventFetch() = _$EventEntityEventFetch;
}

/// @nodoc
abstract class _$$EventEntityEventCreateNewEventEntityCopyWith<$Res> {
  factory _$$EventEntityEventCreateNewEventEntityCopyWith(
          _$EventEntityEventCreateNewEventEntity value,
          $Res Function(_$EventEntityEventCreateNewEventEntity) then) =
      __$$EventEntityEventCreateNewEventEntityCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String description,
      String startDate,
      String endDate,
      File imageFile,
      List<String> categories});
}

/// @nodoc
class __$$EventEntityEventCreateNewEventEntityCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res,
        _$EventEntityEventCreateNewEventEntity>
    implements _$$EventEntityEventCreateNewEventEntityCopyWith<$Res> {
  __$$EventEntityEventCreateNewEventEntityCopyWithImpl(
      _$EventEntityEventCreateNewEventEntity _value,
      $Res Function(_$EventEntityEventCreateNewEventEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? imageFile = null,
    Object? categories = null,
  }) {
    return _then(_$EventEntityEventCreateNewEventEntity(
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
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$EventEntityEventCreateNewEventEntity
    implements EventEntityEventCreateNewEventEntity {
  const _$EventEntityEventCreateNewEventEntity(
      {required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.imageFile,
      required final List<String> categories})
      : _categories = categories;

  @override
  final String title;
  @override
  final String description;
  @override
  final String startDate;
  @override
  final String endDate;
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
    return 'EventEntityEvent.createNewEventEntity(title: $title, description: $description, startDate: $startDate, endDate: $endDate, imageFile: $imageFile, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityEventCreateNewEventEntity &&
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
  _$$EventEntityEventCreateNewEventEntityCopyWith<
          _$EventEntityEventCreateNewEventEntity>
      get copyWith => __$$EventEntityEventCreateNewEventEntityCopyWithImpl<
          _$EventEntityEventCreateNewEventEntity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(
            String title,
            String description,
            String startDate,
            String endDate,
            File imageFile,
            List<String> categories)
        createNewEventEntity,
    required TResult Function(
            int idTab, List<EventEntity> listEventEntityLoaded)
        filterNews,
  }) {
    return createNewEventEntity(
        title, description, startDate, endDate, imageFile, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult? Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
  }) {
    return createNewEventEntity?.call(
        title, description, startDate, endDate, imageFile, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
    required TResult orElse(),
  }) {
    if (createNewEventEntity != null) {
      return createNewEventEntity(
          title, description, startDate, endDate, imageFile, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventCreateNewEventEntity value)
        createNewEventEntity,
    required TResult Function(EventEntityEventFilterNews value) filterNews,
  }) {
    return createNewEventEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult? Function(EventEntityEventFilterNews value)? filterNews,
  }) {
    return createNewEventEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult Function(EventEntityEventFilterNews value)? filterNews,
    required TResult orElse(),
  }) {
    if (createNewEventEntity != null) {
      return createNewEventEntity(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventCreateNewEventEntity
    implements EventEntityEvent {
  const factory EventEntityEventCreateNewEventEntity(
          {required final String title,
          required final String description,
          required final String startDate,
          required final String endDate,
          required final File imageFile,
          required final List<String> categories}) =
      _$EventEntityEventCreateNewEventEntity;

  String get title;
  String get description;
  String get startDate;
  String get endDate;
  File get imageFile;
  List<String> get categories;
  @JsonKey(ignore: true)
  _$$EventEntityEventCreateNewEventEntityCopyWith<
          _$EventEntityEventCreateNewEventEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventEntityEventFilterNewsCopyWith<$Res> {
  factory _$$EventEntityEventFilterNewsCopyWith(
          _$EventEntityEventFilterNews value,
          $Res Function(_$EventEntityEventFilterNews) then) =
      __$$EventEntityEventFilterNewsCopyWithImpl<$Res>;
  @useResult
  $Res call({int idTab, List<EventEntity> listEventEntityLoaded});
}

/// @nodoc
class __$$EventEntityEventFilterNewsCopyWithImpl<$Res>
    extends _$EventEntityEventCopyWithImpl<$Res, _$EventEntityEventFilterNews>
    implements _$$EventEntityEventFilterNewsCopyWith<$Res> {
  __$$EventEntityEventFilterNewsCopyWithImpl(
      _$EventEntityEventFilterNews _value,
      $Res Function(_$EventEntityEventFilterNews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTab = null,
    Object? listEventEntityLoaded = null,
  }) {
    return _then(_$EventEntityEventFilterNews(
      idTab: null == idTab
          ? _value.idTab
          : idTab // ignore: cast_nullable_to_non_nullable
              as int,
      listEventEntityLoaded: null == listEventEntityLoaded
          ? _value._listEventEntityLoaded
          : listEventEntityLoaded // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
    ));
  }
}

/// @nodoc

class _$EventEntityEventFilterNews implements EventEntityEventFilterNews {
  const _$EventEntityEventFilterNews(
      {required this.idTab,
      required final List<EventEntity> listEventEntityLoaded})
      : _listEventEntityLoaded = listEventEntityLoaded;

  @override
  final int idTab;
  final List<EventEntity> _listEventEntityLoaded;
  @override
  List<EventEntity> get listEventEntityLoaded {
    if (_listEventEntityLoaded is EqualUnmodifiableListView)
      return _listEventEntityLoaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listEventEntityLoaded);
  }

  @override
  String toString() {
    return 'EventEntityEvent.filterNews(idTab: $idTab, listEventEntityLoaded: $listEventEntityLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityEventFilterNews &&
            (identical(other.idTab, idTab) || other.idTab == idTab) &&
            const DeepCollectionEquality()
                .equals(other._listEventEntityLoaded, _listEventEntityLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idTab,
      const DeepCollectionEquality().hash(_listEventEntityLoaded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityEventFilterNewsCopyWith<_$EventEntityEventFilterNews>
      get copyWith => __$$EventEntityEventFilterNewsCopyWithImpl<
          _$EventEntityEventFilterNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(
            String title,
            String description,
            String startDate,
            String endDate,
            File imageFile,
            List<String> categories)
        createNewEventEntity,
    required TResult Function(
            int idTab, List<EventEntity> listEventEntityLoaded)
        filterNews,
  }) {
    return filterNews(idTab, listEventEntityLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult? Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
  }) {
    return filterNews?.call(idTab, listEventEntityLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String title, String description, String startDate,
            String endDate, File imageFile, List<String> categories)?
        createNewEventEntity,
    TResult Function(int idTab, List<EventEntity> listEventEntityLoaded)?
        filterNews,
    required TResult orElse(),
  }) {
    if (filterNews != null) {
      return filterNews(idTab, listEventEntityLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityEventFetch value) fetch,
    required TResult Function(EventEntityEventCreateNewEventEntity value)
        createNewEventEntity,
    required TResult Function(EventEntityEventFilterNews value) filterNews,
  }) {
    return filterNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityEventFetch value)? fetch,
    TResult? Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult? Function(EventEntityEventFilterNews value)? filterNews,
  }) {
    return filterNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityEventFetch value)? fetch,
    TResult Function(EventEntityEventCreateNewEventEntity value)?
        createNewEventEntity,
    TResult Function(EventEntityEventFilterNews value)? filterNews,
    required TResult orElse(),
  }) {
    if (filterNews != null) {
      return filterNews(this);
    }
    return orElse();
  }
}

abstract class EventEntityEventFilterNews implements EventEntityEvent {
  const factory EventEntityEventFilterNews(
          {required final int idTab,
          required final List<EventEntity> listEventEntityLoaded}) =
      _$EventEntityEventFilterNews;

  int get idTab;
  List<EventEntity> get listEventEntityLoaded;
  @JsonKey(ignore: true)
  _$$EventEntityEventFilterNewsCopyWith<_$EventEntityEventFilterNews>
      get copyWith => throw _privateConstructorUsedError;
}

EventEntityState _$EventEntityStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return EventEntityStateLoading.fromJson(json);
    case 'loaded':
      return EventEntityStateLoaded.fromJson(json);
    case 'error':
      return EventEntityStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EventEntityState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EventEntityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityStateCopyWith<$Res> {
  factory $EventEntityStateCopyWith(
          EventEntityState value, $Res Function(EventEntityState) then) =
      _$EventEntityStateCopyWithImpl<$Res, EventEntityState>;
}

/// @nodoc
class _$EventEntityStateCopyWithImpl<$Res, $Val extends EventEntityState>
    implements $EventEntityStateCopyWith<$Res> {
  _$EventEntityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventEntityStateLoadingCopyWith<$Res> {
  factory _$$EventEntityStateLoadingCopyWith(_$EventEntityStateLoading value,
          $Res Function(_$EventEntityStateLoading) then) =
      __$$EventEntityStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityStateLoadingCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateLoading>
    implements _$$EventEntityStateLoadingCopyWith<$Res> {
  __$$EventEntityStateLoadingCopyWithImpl(_$EventEntityStateLoading _value,
      $Res Function(_$EventEntityStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EventEntityStateLoading implements EventEntityStateLoading {
  const _$EventEntityStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$EventEntityStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult Function()? error,
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
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateLoadingToJson(
      this,
    );
  }
}

abstract class EventEntityStateLoading implements EventEntityState {
  const factory EventEntityStateLoading() = _$EventEntityStateLoading;

  factory EventEntityStateLoading.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateLoading.fromJson;
}

/// @nodoc
abstract class _$$EventEntityStateLoadedCopyWith<$Res> {
  factory _$$EventEntityStateLoadedCopyWith(_$EventEntityStateLoaded value,
          $Res Function(_$EventEntityStateLoaded) then) =
      __$$EventEntityStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EventEntity> listEventEntityLoaded,
      List<EventEntity> filteredListEventEntity});
}

/// @nodoc
class __$$EventEntityStateLoadedCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateLoaded>
    implements _$$EventEntityStateLoadedCopyWith<$Res> {
  __$$EventEntityStateLoadedCopyWithImpl(_$EventEntityStateLoaded _value,
      $Res Function(_$EventEntityStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listEventEntityLoaded = null,
    Object? filteredListEventEntity = null,
  }) {
    return _then(_$EventEntityStateLoaded(
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
class _$EventEntityStateLoaded implements EventEntityStateLoaded {
  const _$EventEntityStateLoaded(
      {required final List<EventEntity> listEventEntityLoaded,
      required final List<EventEntity> filteredListEventEntity,
      final String? $type})
      : _listEventEntityLoaded = listEventEntityLoaded,
        _filteredListEventEntity = filteredListEventEntity,
        $type = $type ?? 'loaded';

  factory _$EventEntityStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateLoadedFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.loaded(listEventEntityLoaded: $listEventEntityLoaded, filteredListEventEntity: $filteredListEventEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityStateLoaded &&
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
  _$$EventEntityStateLoadedCopyWith<_$EventEntityStateLoaded> get copyWith =>
      __$$EventEntityStateLoadedCopyWithImpl<_$EventEntityStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(listEventEntityLoaded, filteredListEventEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(listEventEntityLoaded, filteredListEventEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listEventEntityLoaded, filteredListEventEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateLoadedToJson(
      this,
    );
  }
}

abstract class EventEntityStateLoaded implements EventEntityState {
  const factory EventEntityStateLoaded(
          {required final List<EventEntity> listEventEntityLoaded,
          required final List<EventEntity> filteredListEventEntity}) =
      _$EventEntityStateLoaded;

  factory EventEntityStateLoaded.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateLoaded.fromJson;

  List<EventEntity> get listEventEntityLoaded;
  List<EventEntity> get filteredListEventEntity;
  @JsonKey(ignore: true)
  _$$EventEntityStateLoadedCopyWith<_$EventEntityStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventEntityStateErrorCopyWith<$Res> {
  factory _$$EventEntityStateErrorCopyWith(_$EventEntityStateError value,
          $Res Function(_$EventEntityStateError) then) =
      __$$EventEntityStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventEntityStateErrorCopyWithImpl<$Res>
    extends _$EventEntityStateCopyWithImpl<$Res, _$EventEntityStateError>
    implements _$$EventEntityStateErrorCopyWith<$Res> {
  __$$EventEntityStateErrorCopyWithImpl(_$EventEntityStateError _value,
      $Res Function(_$EventEntityStateError) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EventEntityStateError implements EventEntityStateError {
  const _$EventEntityStateError({final String? $type})
      : $type = $type ?? 'error';

  factory _$EventEntityStateError.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityStateErrorFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventEntityState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventEntityStateError);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<EventEntity> listEventEntityLoaded,
            List<EventEntity> filteredListEventEntity)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEntityStateLoading value) loading,
    required TResult Function(EventEntityStateLoaded value) loaded,
    required TResult Function(EventEntityStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventEntityStateLoading value)? loading,
    TResult? Function(EventEntityStateLoaded value)? loaded,
    TResult? Function(EventEntityStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEntityStateLoading value)? loading,
    TResult Function(EventEntityStateLoaded value)? loaded,
    TResult Function(EventEntityStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityStateErrorToJson(
      this,
    );
  }
}

abstract class EventEntityStateError implements EventEntityState {
  const factory EventEntityStateError() = _$EventEntityStateError;

  factory EventEntityStateError.fromJson(Map<String, dynamic> json) =
      _$EventEntityStateError.fromJson;
}
