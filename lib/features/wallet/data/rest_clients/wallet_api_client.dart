import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';

import '../../model/coins_screen/coins_info/coins_info.dart';
import '../../model/coins_screen/coins_reward/coins_reward.dart';
import '../../model/wallet/wallet.dart';

abstract interface class IWalletProvider {
  Future<({int balance, int avarageCoins})> getBalance();
  Future<List<CoinsInfo>> getCoinsInfo();
  Future<List<CoinsReward>> getInfoCoinsReward();
  Future<List<Transaction>?> getTransactions();
  Future<int> sendCoinsToOtherUser(
      {required int amount, required int userId, required String message});
  Future<int> sendCoinsToBracer({
    required int amount,
  });
}

class WalletProviderImpl implements IWalletProvider {
  final RestClient _httpService;
  WalletProviderImpl(this._httpService);

  @override
  Future<({int balance, int avarageCoins})> getBalance() async {
    final response = await _httpService.get('/coins/balance');

    if (response case {'result': final Map<String, Object?> data}) {
      final int balance = data['coins'] as int;
      final int avarageCoins = data['avarage_coins'] as int;
      return (balance: balance, avarageCoins: avarageCoins);
    }
    throw Exception('Error fetching Balance');
  }

  @override
  Future<List<Transaction>?> getTransactions() async {
    // final response = await _httpService.get('/coins/transactions');
    //
    // if (response case {'result': final data}) {
    //   final List<Transaction> result = (data as List<dynamic>)
    //       .map((item) => Transaction.fromJson(item))
    //       .toList();
    //
    //   return result;
    // }
    // throw Exception('Error fetching Transactions');
    return [];
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required int amount,
      required int userId,
      required String message}) async {
    final body = {"recipient": userId, "amount": amount, "message": message};
    final response =
        await _httpService.post('/coins/transfer-to-friend', body: body);
    if (response case {'result': final Map<String, Object?> data}) {
      final int result = data['coins'] as int;
      return result;
    }
    throw Exception('Error send Coins!!!');
  }

  @override
  Future<int> sendCoinsToBracer({
    required int amount,
  }) async {
    final body = {"amount": amount};
    final response =
        await _httpService.post('/coins/transfer-to-bracer', body: body);

    if (response case {'result': final Map<String, Object?> data}) {
      final int result = data['coins'] as int;
      return result;
    }
    throw Exception('Error send to Bracer Coins!!!');
  }

  @override
  Future<List<CoinsReward>> getInfoCoinsReward() async {
    final response = await _httpService.get('/coins/coins_reward');

    if (response case {'result': final data}) {
      final List<CoinsReward> result = (data as List<dynamic>)
          .map((item) => CoinsReward.fromJson(item))
          .toList();

      return result;
    }
    throw Exception('Error fetching get Info Coins Reward');
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo() async {
    final response = await _httpService.get('/coins/info');

    if (response case {'result': final data}) {
      final List<CoinsInfo> result = (data as List<dynamic>)
          .map((item) => CoinsInfo.fromJson(item))
          .toList();

      return result;
    }
    throw Exception('Error fetching get Coins Info');
  }
}
