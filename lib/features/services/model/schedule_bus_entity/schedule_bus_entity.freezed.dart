// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_bus_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleBus _$ScheduleBusFromJson(Map<String, dynamic> json) {
  return _ScheduleBus.fromJson(json);
}

/// @nodoc
mixin _$ScheduleBus {
  List<City> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleBusCopyWith<ScheduleBus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBusCopyWith<$Res> {
  factory $ScheduleBusCopyWith(
          ScheduleBus value, $Res Function(ScheduleBus) then) =
      _$ScheduleBusCopyWithImpl<$Res, ScheduleBus>;
  @useResult
  $Res call({List<City> result});
}

/// @nodoc
class _$ScheduleBusCopyWithImpl<$Res, $Val extends ScheduleBus>
    implements $ScheduleBusCopyWith<$Res> {
  _$ScheduleBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleBusCopyWith<$Res>
    implements $ScheduleBusCopyWith<$Res> {
  factory _$$_ScheduleBusCopyWith(
          _$_ScheduleBus value, $Res Function(_$_ScheduleBus) then) =
      __$$_ScheduleBusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<City> result});
}

/// @nodoc
class __$$_ScheduleBusCopyWithImpl<$Res>
    extends _$ScheduleBusCopyWithImpl<$Res, _$_ScheduleBus>
    implements _$$_ScheduleBusCopyWith<$Res> {
  __$$_ScheduleBusCopyWithImpl(
      _$_ScheduleBus _value, $Res Function(_$_ScheduleBus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_ScheduleBus(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleBus implements _ScheduleBus {
  const _$_ScheduleBus({required final List<City> result}) : _result = result;

  factory _$_ScheduleBus.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleBusFromJson(json);

  final List<City> _result;
  @override
  List<City> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'ScheduleBus(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleBus &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleBusCopyWith<_$_ScheduleBus> get copyWith =>
      __$$_ScheduleBusCopyWithImpl<_$_ScheduleBus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleBusToJson(
      this,
    );
  }
}

abstract class _ScheduleBus implements ScheduleBus {
  const factory _ScheduleBus({required final List<City> result}) =
      _$_ScheduleBus;

  factory _ScheduleBus.fromJson(Map<String, dynamic> json) =
      _$_ScheduleBus.fromJson;

  @override
  List<City> get result;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleBusCopyWith<_$_ScheduleBus> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  String get country => throw _privateConstructorUsedError;
  List<Destination> get destinations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res, City>;
  @useResult
  $Res call({String country, List<Destination> destinations});
}

/// @nodoc
class _$CityCopyWithImpl<$Res, $Val extends City>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? destinations = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      destinations: null == destinations
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<Destination>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$$_CityCopyWith(_$_City value, $Res Function(_$_City) then) =
      __$$_CityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String country, List<Destination> destinations});
}

/// @nodoc
class __$$_CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res, _$_City>
    implements _$$_CityCopyWith<$Res> {
  __$$_CityCopyWithImpl(_$_City _value, $Res Function(_$_City) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? destinations = null,
  }) {
    return _then(_$_City(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      destinations: null == destinations
          ? _value._destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<Destination>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City implements _City {
  const _$_City(
      {required this.country, required final List<Destination> destinations})
      : _destinations = destinations;

  factory _$_City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);

  @override
  final String country;
  final List<Destination> _destinations;
  @override
  List<Destination> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  String toString() {
    return 'City(country: $country, destinations: $destinations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_City &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality()
                .equals(other._destinations, _destinations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, country, const DeepCollectionEquality().hash(_destinations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityCopyWith<_$_City> get copyWith =>
      __$$_CityCopyWithImpl<_$_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityToJson(
      this,
    );
  }
}

abstract class _City implements City {
  const factory _City(
      {required final String country,
      required final List<Destination> destinations}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  String get country;
  @override
  List<Destination> get destinations;
  @override
  @JsonKey(ignore: true)
  _$$_CityCopyWith<_$_City> get copyWith => throw _privateConstructorUsedError;
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return _Destination.fromJson(json);
}

/// @nodoc
mixin _$Destination {
  @JsonKey(name: 'name_path')
  String get namePath => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name_path') String namePath, String link, int? id});
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namePath = null,
    Object? link = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      namePath: null == namePath
          ? _value.namePath
          : namePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DestinationCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$_DestinationCopyWith(
          _$_Destination value, $Res Function(_$_Destination) then) =
      __$$_DestinationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name_path') String namePath, String link, int? id});
}

/// @nodoc
class __$$_DestinationCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$_Destination>
    implements _$$_DestinationCopyWith<$Res> {
  __$$_DestinationCopyWithImpl(
      _$_Destination _value, $Res Function(_$_Destination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namePath = null,
    Object? link = null,
    Object? id = freezed,
  }) {
    return _then(_$_Destination(
      namePath: null == namePath
          ? _value.namePath
          : namePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Destination implements _Destination {
  const _$_Destination(
      {@JsonKey(name: 'name_path') required this.namePath,
      required this.link,
      this.id});

  factory _$_Destination.fromJson(Map<String, dynamic> json) =>
      _$$_DestinationFromJson(json);

  @override
  @JsonKey(name: 'name_path')
  final String namePath;
  @override
  final String link;
  @override
  final int? id;

  @override
  String toString() {
    return 'Destination(namePath: $namePath, link: $link, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Destination &&
            (identical(other.namePath, namePath) ||
                other.namePath == namePath) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, namePath, link, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DestinationCopyWith<_$_Destination> get copyWith =>
      __$$_DestinationCopyWithImpl<_$_Destination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DestinationToJson(
      this,
    );
  }
}

abstract class _Destination implements Destination {
  const factory _Destination(
      {@JsonKey(name: 'name_path') required final String namePath,
      required final String link,
      final int? id}) = _$_Destination;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$_Destination.fromJson;

  @override
  @JsonKey(name: 'name_path')
  String get namePath;
  @override
  String get link;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DestinationCopyWith<_$_Destination> get copyWith =>
      throw _privateConstructorUsedError;
}
