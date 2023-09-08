// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_screen_view_model_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinsScreenViewModelStateLoading _$$CoinsScreenViewModelStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$CoinsScreenViewModelStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CoinsScreenViewModelStateLoadingToJson(
        _$CoinsScreenViewModelStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CoinsScreenViewModelStateLoaded _$$CoinsScreenViewModelStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$CoinsScreenViewModelStateLoaded(
      listCoinsInfoLoaded: (json['listCoinsInfoLoaded'] as List<dynamic>)
          .map((e) => CoinsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      listCoinsRewardLoaded: (json['listCoinsRewardLoaded'] as List<dynamic>)
          .map((e) => CoinsReward.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CoinsScreenViewModelStateLoadedToJson(
        _$CoinsScreenViewModelStateLoaded instance) =>
    <String, dynamic>{
      'listCoinsInfoLoaded': instance.listCoinsInfoLoaded,
      'listCoinsRewardLoaded': instance.listCoinsRewardLoaded,
      'runtimeType': instance.$type,
    };

_$CoinsScreenViewModelStateError _$$CoinsScreenViewModelStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$CoinsScreenViewModelStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CoinsScreenViewModelStateErrorToJson(
        _$CoinsScreenViewModelStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
