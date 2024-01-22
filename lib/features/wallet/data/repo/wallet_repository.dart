import 'package:hr_app_flutter/features/wallet/data/rest_clients/wallet_api_client.dart';

import '../../model/coins_screen/coins_info/coins_info.dart';
import '../../model/coins_screen/coins_reward/coins_reward.dart';
import '../../model/wallet/wallet.dart';

abstract interface class IWalletRepository {
  Future<Wallet> getWallet();
  Future<List<CoinsInfo>> getCoinsInfo();
  Future<List<CoinsReward>> getInfoCoinsReward();
  Future<int> sendCoinsToOtherUser(
      {required int amount, required int userId, required String message});
  Future<int> sendCoinsToBracer({
    required int amount,
  });
}

class WalletRepositoryImpl implements IWalletRepository {
  WalletRepositoryImpl({
    required IWalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  final IWalletProvider _walletProvider;

  @override
  Future<Wallet> getWallet() async {
    try {
      final ({int balance, int avarageCoins}) result =
          await _walletProvider.getBalance();

      final int balance = result.balance;
      final int avarageCoins = result.avarageCoins;
      final List<Transaction>? transactions =
          await _walletProvider.getTransactions();
      final Wallet wallet = Wallet(
          balance: balance,
          transactions: transactions,
          avarageCoins: avarageCoins);
      return wallet;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required int amount,
      required int userId,
      required String message}) async {
    try {
      final int newBalance = await _walletProvider.sendCoinsToOtherUser(
        amount: amount,
        userId: userId,
        message: message,
      );
      return newBalance;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> sendCoinsToBracer({
    required int amount,
  }) async {
    try {
      final int newBalance = await _walletProvider.sendCoinsToBracer(
        amount: amount,
      );
      return newBalance;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo() async {
    try {
      final List<CoinsInfo> listCoinsinfo =
          await _walletProvider.getCoinsInfo();
      return listCoinsinfo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CoinsReward>> getInfoCoinsReward() async {
    try {
      final List<CoinsReward> listCoinsReward =
          await _walletProvider.getInfoCoinsReward();
      return listCoinsReward;
    } catch (e) {
      rethrow;
    }
  }
}
