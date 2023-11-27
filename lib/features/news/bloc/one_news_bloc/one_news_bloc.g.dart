// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_news_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OneNewsStateLoading _$$OneNewsStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$OneNewsStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateLoadingToJson(
        _$OneNewsStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OneNewsStateLoaded _$$OneNewsStateLoadedFromJson(Map<String, dynamic> json) =>
    _$OneNewsStateLoaded(
      oneNewsLoaded:
          EventEntity.fromJson(json['oneNewsLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateLoadedToJson(
        _$OneNewsStateLoaded instance) =>
    <String, dynamic>{
      'oneNewsLoaded': instance.oneNewsLoaded,
      'runtimeType': instance.$type,
    };

_$OneNewsStateError _$$OneNewsStateErrorFromJson(Map<String, dynamic> json) =>
    _$OneNewsStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateErrorToJson(_$OneNewsStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
