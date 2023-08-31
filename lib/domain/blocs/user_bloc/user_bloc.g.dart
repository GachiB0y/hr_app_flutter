// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateLoading _$$UserStateLoadingFromJson(Map<String, dynamic> json) =>
    _$UserStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserStateLoadingToJson(_$UserStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UserStateLoaded _$$UserStateLoadedFromJson(Map<String, dynamic> json) =>
    _$UserStateLoaded(
      userLoaded: User.fromJson(json['userLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserStateLoadedToJson(_$UserStateLoaded instance) =>
    <String, dynamic>{
      'userLoaded': instance.userLoaded,
      'runtimeType': instance.$type,
    };

_$UserStateError _$$UserStateErrorFromJson(Map<String, dynamic> json) =>
    _$UserStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserStateErrorToJson(_$UserStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
