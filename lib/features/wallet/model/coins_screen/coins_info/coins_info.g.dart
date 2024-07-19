// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinsInfoImpl _$$CoinsInfoImplFromJson(Map<String, dynamic> json) =>
    _$CoinsInfoImpl(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$CoinsInfoImplToJson(_$CoinsInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
    };
