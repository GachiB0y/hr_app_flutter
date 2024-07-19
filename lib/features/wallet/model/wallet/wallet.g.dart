// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      balance: (json['balance'] as num).toInt(),
      avarageCoins: (json['avarage_coins'] as num).toInt(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'avarage_coins': instance.avarageCoins,
      'transactions': instance.transactions,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      recipient: json['recipient'] as String,
      recipientId: (json['recipient_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      createAt: (json['createAt'] as num).toInt(),
      typeTtransaction: (json['type_transaction'] as num).toInt(),
      sender: json['sender'] as String,
      senderId: (json['sender_id'] as num).toInt(),
      coinsReward: (json['coins_reward'] as num).toInt(),
      team: (json['team'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'recipient': instance.recipient,
      'recipient_id': instance.recipientId,
      'amount': instance.amount,
      'id': instance.id,
      'createAt': instance.createAt,
      'type_transaction': instance.typeTtransaction,
      'sender': instance.sender,
      'sender_id': instance.senderId,
      'coins_reward': instance.coinsReward,
      'team': instance.team,
      'message': instance.message,
    };
