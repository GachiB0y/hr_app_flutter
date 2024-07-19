// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileViewModelImpl _$$UserProfileViewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileViewModelImpl(
      authUser: UserInfo.fromJson(json['authUser'] as Map<String, dynamic>),
      currentProfileUser: json['currentProfileUser'] == null
          ? null
          : UserInfo.fromJson(
              json['currentProfileUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileViewModelImplToJson(
        _$UserProfileViewModelImpl instance) =>
    <String, dynamic>{
      'authUser': instance.authUser,
      'currentProfileUser': instance.currentProfileUser,
    };
