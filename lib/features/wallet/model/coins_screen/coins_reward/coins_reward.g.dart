// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinsRewardImpl _$$CoinsRewardImplFromJson(Map<String, dynamic> json) =>
    _$CoinsRewardImpl(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CoinsRewardImplToJson(_$CoinsRewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
    };
