import 'dart:convert';

import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:http/http.dart' as http;

abstract class WalletProvider {
  Future<Wallet> getBalance({required String userToken});
}

class WalletProviderImpl implements WalletProvider {
  WalletProviderImpl();

  @override
  Future<Wallet> getBalance({required String userToken}) async {
    final result = Wallet(balance: 2007);
    return result; // ЗАГЛУШКА НА ВРЕМЯ ТЕСТА
    // var url = 'http://domain/get_balance_user/';
    // final response = await http.get(Uri.parse(url + '$userToken'));
    // if (response.statusCode == 200) {
    //   // final Wallet result = jsonDecode(response.body);

    //   return result;
    // } else {
    //   throw Exception('Error fetching EventEntity');
    // }
  }
}
