import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const factory Wallet(
      {required int balance,
      required List<Transaction> transactions}) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int recipient,
    required int amount,
    required int id,
    required int createAt,
    required int type,
    required int sender,
    @JsonKey(name: 'coins_reward') required int coinsReward,
    required int team,
    required String message,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
