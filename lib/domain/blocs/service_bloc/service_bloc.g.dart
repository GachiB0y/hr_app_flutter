// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceStateLoading _$$ServiceStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$ServiceStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ServiceStateLoadingToJson(
        _$ServiceStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ServiceStateLoaded _$$ServiceStateLoadedFromJson(Map<String, dynamic> json) =>
    _$ServiceStateLoaded(
      servicesLoaded: (json['servicesLoaded'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      loeadedServiceWidgets: json['loeadedServiceWidgets'] as List<dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ServiceStateLoadedToJson(
        _$ServiceStateLoaded instance) =>
    <String, dynamic>{
      'servicesLoaded': instance.servicesLoaded,
      'loeadedServiceWidgets': instance.loeadedServiceWidgets,
      'runtimeType': instance.$type,
    };

_$ServiceStateError _$$ServiceStateErrorFromJson(Map<String, dynamic> json) =>
    _$ServiceStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ServiceStateErrorToJson(_$ServiceStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
