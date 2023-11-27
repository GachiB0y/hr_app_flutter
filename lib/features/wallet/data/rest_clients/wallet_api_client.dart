import 'dart:convert';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';

import '../../model/coins_screen/coins_info/coins_info.dart';
import '../../model/coins_screen/coins_reward/coins_reward.dart';
import '../../model/wallet/wallet.dart';

abstract interface class IWalletProvider {
  Future<({int balance, int avarageCoins})> getBalance(
      {required String userToken});
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken});
  Future<List<CoinsReward>> getInfoCoinsReward({required String userToken});
  Future<List<Transaction>?> getTransactions({required String userToken});
  Future<int> sendCoinsToOtherUser(
      {required String userToken,
      required int amount,
      required int userId,
      required String message});
  Future<int> sendCoinsToBracer({
    required String userToken,
    required int amount,
  });
}

class WalletProviderImpl implements IWalletProvider {
  final IHTTPService _httpService;
  WalletProviderImpl(this._httpService);

  @override
  Future<({int balance, int avarageCoins})> getBalance(
      {required String userToken}) async {
    String uri = '$urlAdress/coins/balance';
    final response = await _httpService.get(uri: uri, userToken: userToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final int balance = jsonData['result']['coins'];
      final int avarageCoins = jsonData['result']['avarage_coins'];
      return (balance: balance, avarageCoins: avarageCoins);
    } else {
      throw Exception('Error fetching Balance');
    }
  }

  @override
  Future<List<Transaction>?> getTransactions(
      {required String userToken}) async {
    String uri = '$urlAdress/coins/transactions';
    final response = await _httpService.get(uri: uri, userToken: userToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Transaction> result = (jsonData['result'] as List<dynamic>)
          .map((item) => Transaction.fromJson(item))
          .toList();

      return result;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Error fetching Transactions');
    }
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required String userToken,
      required int amount,
      required int userId,
      required String message}) async {
    String uri = '$urlAdress/coins/transfer-to-friend';
    final String body = json
        .encode({"recipient": userId, "amount": amount, "message": message});
    final response =
        await _httpService.post(uri: uri, userToken: userToken, body: body);
    if (response.statusCode == 201) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final int result = jsonData['result']['coins'];
      return result;
    } else {
      throw Exception('Error send Coins!!!');
    }
  }

  @override
  Future<int> sendCoinsToBracer({
    required String userToken,
    required int amount,
  }) async {
    String uri = '$urlAdress/coins/transfer-to-bracer';
    final String body = json.encode({"amount": amount});
    final response =
        await _httpService.post(uri: uri, userToken: userToken, body: body);

    if (response.statusCode == 201) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final int result = jsonData['result']['coins'];
      return result;
    } else {
      throw Exception('Error send to Bracer Coins!!!');
    }
  }

  @override
  Future<List<CoinsReward>> getInfoCoinsReward(
      {required String userToken}) async {
    String uri = '$urlAdress/coins/coins_reward';
    final response = await _httpService.get(uri: uri, userToken: userToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<CoinsReward> result = (jsonData['result'] as List<dynamic>)
          .map((item) => CoinsReward.fromJson(item))
          .toList();

      return result;
    } else {
      throw Exception('Error fetching get Info Coins Reward');
    }
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken}) async {
    String uri = '$urlAdress/coins/info';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<CoinsInfo> result = (jsonData['result'] as List<dynamic>)
          .map((item) => CoinsInfo.fromJson(item))
          .toList();

      return result;
    } else {
      throw Exception('Error fetching get Coins Info');
    }
  }
}
