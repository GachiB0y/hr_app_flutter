// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityStateLoading _$$EventEntityStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$EventEntityStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EventEntityStateLoadingToJson(
        _$EventEntityStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$EventEntityStateLoaded _$$EventEntityStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$EventEntityStateLoaded(
      listEventEntityLoaded: (json['listEventEntityLoaded'] as List<dynamic>)
          .map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      filteredListEventEntity:
          (json['filteredListEventEntity'] as List<dynamic>)
              .map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EventEntityStateLoadedToJson(
        _$EventEntityStateLoaded instance) =>
    <String, dynamic>{
      'listEventEntityLoaded': instance.listEventEntityLoaded,
      'filteredListEventEntity': instance.filteredListEventEntity,
      'runtimeType': instance.$type,
    };

_$EventEntityStateError _$$EventEntityStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$EventEntityStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EventEntityStateErrorToJson(
        _$EventEntityStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
