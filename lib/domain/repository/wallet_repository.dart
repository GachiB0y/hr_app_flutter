import 'package:hr_app_flutter/domain/api_client/wallet_api_client.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_info/coins_info.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_reward/coins_reward.dart';

import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';

abstract class WalletRepository {
  Future<Wallet> getWallet({required String accessToken});
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken});
  Future<List<CoinsReward>> getInfoCoinsReward({required String userToken});
  Future<int> sendCoinsToOtherUser(
      {required String accessToken,
      required int amount,
      required int userId,
      required String message});
}

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({
    required WalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  final WalletProvider _walletProvider;

  @override
  Future<Wallet> getWallet({required String accessToken}) async {
    final int balance =
        await _walletProvider.getBalance(userToken: accessToken);
    final List<Transaction> transactions =
        await _walletProvider.getTransactions(userToken: accessToken);
    final Wallet wallet = Wallet(balance: balance, transactions: transactions);
    return wallet;
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required String accessToken,
      required int amount,
      required int userId,
      required String message}) async {
    final int newBalance = await _walletProvider.sendCoinsToOtherUser(
      userToken: accessToken,
      amount: amount,
      userId: userId,
      message: message,
    );
    return newBalance;
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken}) async {
    final List<CoinsInfo> listCoinsinfo = await _walletProvider.getCoinsInfo(
      userToken: userToken,
    );
    return listCoinsinfo;
  }

  @override
  Future<List<CoinsReward>> getInfoCoinsReward(
      {required String userToken}) async {
    final List<CoinsReward> listCoinsReward =
        await _walletProvider.getInfoCoinsReward(
      userToken: userToken,
    );
    return listCoinsReward;
  }
}
