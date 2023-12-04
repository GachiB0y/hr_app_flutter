// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileViewModel _$$_UserProfileViewModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserProfileViewModel(
      authUser: User.fromJson(json['authUser'] as Map<String, dynamic>),
      currentProfileUser: json['currentProfileUser'] == null
          ? null
          : User.fromJson(json['currentProfileUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileViewModelToJson(
        _$_UserProfileViewModel instance) =>
    <String, dynamic>{
      'authUser': instance.authUser,
      'currentProfileUser': instance.currentProfileUser,
    };
