// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_users_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherUserStateLoading _$$OtherUserStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$OtherUserStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OtherUserStateLoadingToJson(
        _$OtherUserStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OtherUserStateLoaded _$$OtherUserStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$OtherUserStateLoaded(
      listUsersLoaded: (json['listUsersLoaded'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OtherUserStateLoadedToJson(
        _$OtherUserStateLoaded instance) =>
    <String, dynamic>{
      'listUsersLoaded': instance.listUsersLoaded,
      'runtimeType': instance.$type,
    };

_$OtherUserStateError _$$OtherUserStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$OtherUserStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OtherUserStateErrorToJson(
        _$OtherUserStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };