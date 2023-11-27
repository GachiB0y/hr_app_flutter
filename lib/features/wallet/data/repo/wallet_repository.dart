import 'package:hr_app_flutter/features/wallet/data/rest_clients/wallet_api_client.dart';

import '../../model/coins_screen/coins_info/coins_info.dart';
import '../../model/coins_screen/coins_reward/coins_reward.dart';
import '../../model/wallet/wallet.dart';

abstract interface class IWalletRepository {
  Future<Wallet> getWallet({required String accessToken});
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken});
  Future<List<CoinsReward>> getInfoCoinsReward({required String userToken});
  Future<int> sendCoinsToOtherUser(
      {required String accessToken,
      required int amount,
      required int userId,
      required String message});
  Future<int> sendCoinsToBracer({
    required String accessToken,
    required int amount,
  });
}

class WalletRepositoryImpl implements IWalletRepository {
  WalletRepositoryImpl({
    required IWalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  final IWalletProvider _walletProvider;

  @override
  Future<Wallet> getWallet({required String accessToken}) async {
    try {
      final ({int balance, int avarageCoins}) result =
          await _walletProvider.getBalance(userToken: accessToken);

      final int balance = result.balance;
      final int avarageCoins = result.avarageCoins;
      final List<Transaction>? transactions =
          await _walletProvider.getTransactions(userToken: accessToken);
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
      {required String accessToken,
      required int amount,
      required int userId,
      required String message}) async {
    try {
      final int newBalance = await _walletProvider.sendCoinsToOtherUser(
        userToken: accessToken,
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
    required String accessToken,
    required int amount,
  }) async {
    try {
      final int newBalance = await _walletProvider.sendCoinsToBracer(
        userToken: accessToken,
        amount: amount,
      );
      return newBalance;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken}) async {
    try {
      final List<CoinsInfo> listCoinsinfo = await _walletProvider.getCoinsInfo(
        userToken: userToken,
      );
      return listCoinsinfo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CoinsReward>> getInfoCoinsReward(
      {required String userToken}) async {
    try {
      final List<CoinsReward> listCoinsReward =
          await _walletProvider.getInfoCoinsReward(
        userToken: userToken,
      );
      return listCoinsReward;
    } catch (e) {
      rethrow;
    }
  }
}
