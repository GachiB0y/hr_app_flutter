// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shedule_bus_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SheduleBus _$SheduleBusFromJson(Map<String, dynamic> json) {
  return _SheduleBus.fromJson(json);
}

/// @nodoc
mixin _$SheduleBus {
  List<City> get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SheduleBusCopyWith<SheduleBus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheduleBusCopyWith<$Res> {
  factory $SheduleBusCopyWith(
          SheduleBus value, $Res Function(SheduleBus) then) =
      _$SheduleBusCopyWithImpl<$Res, SheduleBus>;
  @useResult
  $Res call({List<City> city});
}

/// @nodoc
class _$SheduleBusCopyWithImpl<$Res, $Val extends SheduleBus>
    implements $SheduleBusCopyWith<$Res> {
  _$SheduleBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SheduleBusCopyWith<$Res>
    implements $SheduleBusCopyWith<$Res> {
  factory _$$_SheduleBusCopyWith(
          _$_SheduleBus value, $Res Function(_$_SheduleBus) then) =
      __$$_SheduleBusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<City> city});
}

/// @nodoc
class __$$_SheduleBusCopyWithImpl<$Res>
    extends _$SheduleBusCopyWithImpl<$Res, _$_SheduleBus>
    implements _$$_SheduleBusCopyWith<$Res> {
  __$$_SheduleBusCopyWithImpl(
      _$_SheduleBus _value, $Res Function(_$_SheduleBus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
  }) {
    return _then(_$_SheduleBus(
      city: null == city
          ? _value._city
          : city // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SheduleBus implements _SheduleBus {
  const _$_SheduleBus({required final List<City> city}) : _city = city;

  factory _$_SheduleBus.fromJson(Map<String, dynamic> json) =>
      _$$_SheduleBusFromJson(json);

  final List<City> _city;
  @override
  List<City> get city {
    if (_city is EqualUnmodifiableListView) return _city;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_city);
  }

  @override
  String toString() {
    return 'SheduleBus(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SheduleBus &&
            const DeepCollectionEquality().equals(other._city, _city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_city));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SheduleBusCopyWith<_$_SheduleBus> get copyWith =>
      __$$_SheduleBusCopyWithImpl<_$_SheduleBus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SheduleBusToJson(
      this,
    );
  }
}

abstract class _SheduleBus implements SheduleBus {
  const factory _SheduleBus({required final List<City> city}) = _$_SheduleBus;

  factory _SheduleBus.fromJson(Map<String, dynamic> json) =
      _$_SheduleBus.fromJson;

  @override
  List<City> get city;
  @override
  @JsonKey(ignore: true)
  _$$_SheduleBusCopyWith<_$_SheduleBus> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  String get nameCity => throw _privateConstructorUsedError;
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
  $Res call({String nameCity, List<Destination> destinations});
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
    Object? nameCity = null,
    Object? destinations = null,
  }) {
    return _then(_value.copyWith(
      nameCity: null == nameCity
          ? _value.nameCity
          : nameCity // ignore: cast_nullable_to_non_nullable
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
  $Res call({String nameCity, List<Destination> destinations});
}

/// @nodoc
class __$$_CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res, _$_City>
    implements _$$_CityCopyWith<$Res> {
  __$$_CityCopyWithImpl(_$_City _value, $Res Function(_$_City) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameCity = null,
    Object? destinations = null,
  }) {
    return _then(_$_City(
      nameCity: null == nameCity
          ? _value.nameCity
          : nameCity // ignore: cast_nullable_to_non_nullable
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
      {required this.nameCity, required final List<Destination> destinations})
      : _destinations = destinations;

  factory _$_City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);

  @override
  final String nameCity;
  final List<Destination> _destinations;
  @override
  List<Destination> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  String toString() {
    return 'City(nameCity: $nameCity, destinations: $destinations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_City &&
            (identical(other.nameCity, nameCity) ||
                other.nameCity == nameCity) &&
            const DeepCollectionEquality()
                .equals(other._destinations, _destinations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameCity,
      const DeepCollectionEquality().hash(_destinations));

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
      {required final String nameCity,
      required final List<Destination> destinations}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  String get nameCity;
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
  int get id => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'name_path') String namePath, String link, int id});
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
    Object? id = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({@JsonKey(name: 'name_path') String namePath, String link, int id});
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
    Object? id = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Destination implements _Destination {
  const _$_Destination(
      {@JsonKey(name: 'name_path') required this.namePath,
      required this.link,
      required this.id});

  factory _$_Destination.fromJson(Map<String, dynamic> json) =>
      _$$_DestinationFromJson(json);

  @override
  @JsonKey(name: 'name_path')
  final String namePath;
  @override
  final String link;
  @override
  final int id;

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
      required final int id}) = _$_Destination;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$_Destination.fromJson;

  @override
  @JsonKey(name: 'name_path')
  String get namePath;
  @override
  String get link;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DestinationCopyWith<_$_Destination> get copyWith =>
      throw _privateConstructorUsedError;
}
