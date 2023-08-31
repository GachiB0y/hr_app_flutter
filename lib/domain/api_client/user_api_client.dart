import 'dart:convert';

import 'package:hr_app_flutter/domain/entity/user/user.dart';

import 'package:http/http.dart' as http;

abstract class UserProvider {
  Future<User> getBalance({required String userToken});
}

class UserProviderImpl implements UserProvider {
  UserProviderImpl();

  @override
  Future<User> getBalance({required String userToken}) async {
    final result = User(
        firstName: 'Vasya',
        lastName: 'Pupkin',
        position: 'Менеджер по работе\nc клиентами');
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
