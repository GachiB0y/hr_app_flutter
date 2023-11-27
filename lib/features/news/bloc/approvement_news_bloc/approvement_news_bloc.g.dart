// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvement_news_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovementNewsStateLoading _$$ApprovementNewsStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$ApprovementNewsStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApprovementNewsStateLoadingToJson(
        _$ApprovementNewsStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ApprovementNewsStateLoaded _$$ApprovementNewsStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$ApprovementNewsStateLoaded(
      listApprovmentEventEntityLoaded:
          (json['listApprovmentEventEntityLoaded'] as List<dynamic>)
              .map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApprovementNewsStateLoadedToJson(
        _$ApprovementNewsStateLoaded instance) =>
    <String, dynamic>{
      'listApprovmentEventEntityLoaded':
          instance.listApprovmentEventEntityLoaded,
      'runtimeType': instance.$type,
    };

_$ApprovementNewsStateError _$$ApprovementNewsStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$ApprovementNewsStateError(
      errorText: json['errorText'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApprovementNewsStateErrorToJson(
        _$ApprovementNewsStateError instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'runtimeType': instance.$type,
    };
