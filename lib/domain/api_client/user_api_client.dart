import 'dart:convert';

import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

import 'package:http/http.dart' as http;

abstract class UserProvider {
  Future<User> getUserInfo({required String userToken});
  Future<BirthDayInfoEntity> getBirthDayInfo({required String userToken});
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber});
}

class UserProviderImpl implements UserProvider {
  IHTTPService _httpService;

  UserProviderImpl(this._httpService);

  @override
  Future<User> getUserInfo({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request('GET', Uri.parse('$urlAdress/auth/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final User result = User.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request(
        'GET', Uri.parse('$urlAdress/auth/find_by_phone/$phoneNumber'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final User result = User.fromJson(jsonData['result']);
      final listUser = <User>[];
      listUser.add(result);
      return listUser;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo(
      {required String userToken}) async {
    const String uri = '$urlAdress/auth/birthday-list';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final BirthDayInfoEntity result =
          BirthDayInfoEntity.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }
}
