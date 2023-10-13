// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_birth_day_info_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBirthDayInfoStateLoading _$$UserBirthDayInfoStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$UserBirthDayInfoStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserBirthDayInfoStateLoadingToJson(
        _$UserBirthDayInfoStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UserBirthDayInfoStateLoaded _$$UserBirthDayInfoStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$UserBirthDayInfoStateLoaded(
      birthDayInfoLoaded: BirthDayInfoEntity.fromJson(
          json['birthDayInfoLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserBirthDayInfoStateLoadedToJson(
        _$UserBirthDayInfoStateLoaded instance) =>
    <String, dynamic>{
      'birthDayInfoLoaded': instance.birthDayInfoLoaded,
      'runtimeType': instance.$type,
    };

_$UserBirthDayInfoStateError _$$UserBirthDayInfoStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$UserBirthDayInfoStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserBirthDayInfoStateErrorToJson(
        _$UserBirthDayInfoStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
