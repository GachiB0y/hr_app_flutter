// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const factory Wallet(
      {required int balance,
      @JsonKey(name: 'avarage_coins') required int avarageCoins,
      required List<Transaction>? transactions}) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String recipient,
    @JsonKey(name: 'recipient_id') required int recipientId,
    required int amount,
    required int id,
    required int createAt,
    @JsonKey(name: 'type_transaction') required int typeTtransaction,
    required String sender,
    @JsonKey(name: 'sender_id') required int senderId,
    @JsonKey(name: 'coins_reward') required int coinsReward,
    required int team,
    required String message,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
