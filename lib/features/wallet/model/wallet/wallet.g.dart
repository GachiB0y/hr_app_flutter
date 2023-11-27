// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      balance: json['balance'] as int,
      avarageCoins: json['avarage_coins'] as int,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'balance': instance.balance,
      'avarage_coins': instance.avarageCoins,
      'transactions': instance.transactions,
    };

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      recipient: json['recipient'] as String,
      recipientId: json['recipient_id'] as int,
      amount: json['amount'] as int,
      id: json['id'] as int,
      createAt: json['createAt'] as int,
      typeTtransaction: json['type_transaction'] as int,
      sender: json['sender'] as String,
      senderId: json['sender_id'] as int,
      coinsReward: json['coins_reward'] as int,
      team: json['team'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
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
