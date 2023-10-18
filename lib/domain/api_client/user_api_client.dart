import 'dart:convert';
import 'dart:io' as io;

import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/entity/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

import 'package:http/http.dart' as http;

abstract class UserProvider {
  Future<User> getUserInfo({required String userToken});
  Future<bool> saveTagsToSend(
      {required String userToken,
      required List<String> tags,
      required int userId});
  Future<User> getUserInfoById(
      {required String userToken, required String userID});
  Future<List<User>> findUser(
      {required String userToken, required String findText});
  Future<BirthDayInfoEntity> getBirthDayInfo({required String userToken});
  Future<Rookies> getRookiesInfo({required String userToken});
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber});
  Future<bool> sendAvatarWithProfile({
    required String userToken,
    required io.File imageFile,
  });
}

class UserProviderImpl implements UserProvider {
  final IHTTPService _httpService;

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
      throw Exception('Error fetching User Info Birthday List');
    }
  }

  @override
  Future<Rookies> getRookiesInfo({required String userToken}) async {
    const String uri = '$urlAdress/auth/rookies';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final Rookies result = Rookies.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching Info Rookies');
    }
  }

  @override
  Future<User> getUserInfoById(
      {required String userToken, required String userID}) async {
    String uri = '$urlAdress/auth/find_by_id/$userID';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final User result = User.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching User Info By Id User');
    }
  }

  @override
  Future<List<User>> findUser(
      {required String userToken, required String findText}) async {
    String uri = '$urlAdress/auth/find_user?name=$findText';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final List<User> result = (jsonData as List<dynamic>)
          .map((item) => User.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error find User');
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required String userToken,
      required List<String> tags,
      required int userId}) async {
    String uri = '$urlAdress/auth/add_tags_to_user';
    final String body = json.encode({
      "user_id": userId,
      "tags": tags,
    });
    final response =
        await _httpService.post(uri: uri, userToken: userToken, body: body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      throw ApiClientException(ApiClientExceptionType.addTags);
    } else {
      throw Exception('Error Add Tags');
    }
  }

  @override
  Future<bool> sendAvatarWithProfile(
      {required String userToken, required io.File imageFile}) async {
    String uri = '$urlAdress/auth/set_avatar';

    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: userToken,
      imageFile: imageFile,
    );
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      throw ApiClientException(ApiClientExceptionType.addTags);
    } else {
      throw Exception('Error Add Tags');
    }
  }
}
