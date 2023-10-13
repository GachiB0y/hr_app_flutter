// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rookies_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RookiesStateLoading _$$RookiesStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$RookiesStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RookiesStateLoadingToJson(
        _$RookiesStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RookiesStateLoaded _$$RookiesStateLoadedFromJson(Map<String, dynamic> json) =>
    _$RookiesStateLoaded(
      rookiesLoaded:
          Rookies.fromJson(json['rookiesLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RookiesStateLoadedToJson(
        _$RookiesStateLoaded instance) =>
    <String, dynamic>{
      'rookiesLoaded': instance.rookiesLoaded,
      'runtimeType': instance.$type,
    };

_$RookiesStateError _$$RookiesStateErrorFromJson(Map<String, dynamic> json) =>
    _$RookiesStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RookiesStateErrorToJson(_$RookiesStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
