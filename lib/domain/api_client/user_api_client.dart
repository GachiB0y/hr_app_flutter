import 'dart:convert';

import 'package:hr_app_flutter/domain/entity/user/user.dart';

import 'package:http/http.dart' as http;

abstract class UserProvider {
  Future<User> getUserInfo({required String userToken});
}

class UserProviderImpl implements UserProvider {
  UserProviderImpl();

  @override
  Future<User> getUserInfo({required String userToken}) async {
    // final result = User(
    //     firstName: 'Vasya',
    //     lastName: 'Pupkin',
    //     position: 'Менеджер по работе\nc клиентами');
    // // ЗАГЛУШКА НА ВРЕМЯ ТЕСТА

    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request =
        http.Request('GET', Uri.parse('http://10.3.29.20:9115/auth/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final User result = User.fromJson(jsonData);
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
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
