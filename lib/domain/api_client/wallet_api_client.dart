import 'dart:convert';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:http/http.dart' as http;

abstract class WalletProvider {
  Future<int> getBalance({required String userToken});
  Future<List<Transaction>> getTransactions({required String userToken});
  Future<int> sendCoinsToOtherUser(
      {required String userToken,
      required int amount,
      required int userId,
      required String message});
}

class WalletProviderImpl implements WalletProvider {
  WalletProviderImpl();

  @override
  Future<int> getBalance({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request =
        http.Request('GET', Uri.parse('http://10.3.29.20:9115/coins/balance'));

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
  Future<List<Transaction>> getTransactions({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request(
        'GET', Uri.parse('http://10.3.29.20:9115/coins/transactions'));

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
    var request = http.Request(
        'POST', Uri.parse('http://10.3.29.20:9115/coins/transfer-to-friend'));
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
}
