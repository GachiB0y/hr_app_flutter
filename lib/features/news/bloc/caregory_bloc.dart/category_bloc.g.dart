// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryStateLoading _$$CategoryStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$CategoryStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CategoryStateLoadingToJson(
        _$CategoryStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CategoryStateLoaded _$$CategoryStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$CategoryStateLoaded(
      listCategoryLoaded: (json['listCategoryLoaded'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CategoryStateLoadedToJson(
        _$CategoryStateLoaded instance) =>
    <String, dynamic>{
      'listCategoryLoaded': instance.listCategoryLoaded,
      'runtimeType': instance.$type,
    };

_$CategoryStateError _$$CategoryStateErrorFromJson(Map<String, dynamic> json) =>
    _$CategoryStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CategoryStateErrorToJson(
        _$CategoryStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
