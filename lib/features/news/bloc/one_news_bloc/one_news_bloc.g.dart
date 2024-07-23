// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_news_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OneNewsStateLoadingImpl _$$OneNewsStateLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$OneNewsStateLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateLoadingImplToJson(
        _$OneNewsStateLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OneNewsStateLoadedImpl _$$OneNewsStateLoadedImplFromJson(
        Map<String, dynamic> json) =>
    _$OneNewsStateLoadedImpl(
      oneNewsLoaded:
          EventEntity.fromJson(json['oneNewsLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateLoadedImplToJson(
        _$OneNewsStateLoadedImpl instance) =>
    <String, dynamic>{
      'oneNewsLoaded': instance.oneNewsLoaded,
      'runtimeType': instance.$type,
    };

_$OneNewsStateErrorImpl _$$OneNewsStateErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$OneNewsStateErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneNewsStateErrorImplToJson(
        _$OneNewsStateErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
