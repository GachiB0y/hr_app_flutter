// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_bus_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleBusStateLoading _$$ScheduleBusStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleBusStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScheduleBusStateLoadingToJson(
        _$ScheduleBusStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ScheduleBusStateLoaded _$$ScheduleBusStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleBusStateLoaded(
      scheduleBusLoaded: ScheduleBus.fromJson(
          json['scheduleBusLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScheduleBusStateLoadedToJson(
        _$ScheduleBusStateLoaded instance) =>
    <String, dynamic>{
      'scheduleBusLoaded': instance.scheduleBusLoaded,
      'runtimeType': instance.$type,
    };

_$ScheduleBusStateError _$$ScheduleBusStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleBusStateError(
      errorText: json['errorText'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScheduleBusStateErrorToJson(
        _$ScheduleBusStateError instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'runtimeType': instance.$type,
    };
