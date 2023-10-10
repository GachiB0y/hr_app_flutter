// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletStateLoading _$$WalletStateLoadingFromJson(Map<String, dynamic> json) =>
    _$WalletStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletStateLoadingToJson(
        _$WalletStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WalletStateLoaded _$$WalletStateLoadedFromJson(Map<String, dynamic> json) =>
    _$WalletStateLoaded(
      walletLoaded:
          Wallet.fromJson(json['walletLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletStateLoadedToJson(_$WalletStateLoaded instance) =>
    <String, dynamic>{
      'walletLoaded': instance.walletLoaded,
      'runtimeType': instance.$type,
    };

_$WalletStateError _$$WalletStateErrorFromJson(Map<String, dynamic> json) =>
    _$WalletStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WalletStateErrorToJson(_$WalletStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
