import 'dart:convert';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_info/coins_info.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_reward/coins_reward.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:http/http.dart' as http;

abstract interface class WalletProvider {
  Future<int> getBalance({required String userToken});
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

class WalletProviderImpl implements WalletProvider {
  final IHTTPService _httpService;
  WalletProviderImpl(this._httpService);

  @override
  Future<int> getBalance({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request('GET', Uri.parse('$urlAdress/coins/balance'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final int result = jsonData['result']['coins'];
      return result;
    } else {
      throw Exception('Error fetching Balance');
    }
  }

  @override
  Future<List<Transaction>?> getTransactions(
      {required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request =
        http.Request('GET', Uri.parse('$urlAdress/coins/transactions'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Transaction> result = (jsonData['result']
              as List<dynamic>) // Добавить ключ ['result'] если вотевет будет
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
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('$urlAdress/coins/transfer-to-friend'));
    request.body = json
        .encode({"recipient": userId, "amount": amount, "message": message});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

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
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('$urlAdress/coins/transfer-to-bracer'));
    request.body = json.encode({"amount": amount});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

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
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request =
        http.Request('GET', Uri.parse('$urlAdress/coins/coins_reward'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<CoinsReward> result = (jsonData['result']
              as List<dynamic>) // Добавить ключ ['result'] если вотевет будет
          .map((item) => CoinsReward.fromJson(item))
          .toList();

      return result;
    } else {
      throw Exception('Error fetching getInfoCoinsReward');
    }
  }

  @override
  Future<List<CoinsInfo>> getCoinsInfo({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
    var request = http.Request('GET', Uri.parse('$urlAdress/coins/info'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<CoinsInfo> result = (jsonData['result'] as List<dynamic>)
          .map((item) => CoinsInfo.fromJson(item))
          .toList();

      return result;
    } else {
      throw Exception('Error fetching getCoinsInfo');
    }
  }
}
