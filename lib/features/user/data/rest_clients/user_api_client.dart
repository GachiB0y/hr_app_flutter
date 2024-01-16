import 'dart:convert';
import 'package:hr_app_flutter/core/components/rest_clients/api_client.dart';
import 'package:hr_app_flutter/core/components/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';

import '../../../services/model/birth_day_info/birth_day_info.dart';
import '../../../services/model/rookies_entity/rookies.dart';
import '../../model/user/user_info.dart';

abstract interface class IUserProvider {
  Future<UserInfo> getUserInfo({required String accessToken});
  Future<bool> saveTagsToSend(
      {required String accessToken,
      required List<String> tags,
      required int userId});
  Future<UserInfo> getUserInfoById(
      {required String accessToken, required String userId});
  Future<List<UserInfo>> findUser(
      {required String accessToken, required String findText});
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<Rookies> getRookiesInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<List<UserInfo>> getUserByPhoneNumber(
      {required String accessToken, required String phoneNumber});
  Future<bool> sendAvatarWithProfile({
    required String accessToken,
    required List<String> paths,
  });
}

class UserProviderImpl implements IUserProvider {
  final IHTTPService _httpService;

  UserProviderImpl(this._httpService);

  @override
  Future<UserInfo> getUserInfo({required String accessToken}) async {
    String uri = '$urlAdress/auth/profile';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final UserInfo result = UserInfo.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<List<UserInfo>> getUserByPhoneNumber(
      {required String accessToken, required String phoneNumber}) async {
    String uri = '$urlAdress/auth/find_by_phone/$phoneNumber';
    final response = await _httpService.get(uri: uri, userToken: accessToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final UserInfo result = UserInfo.fromJson(jsonData['result']);
      final listUser = <UserInfo>[];
      listUser.add(result);
      return listUser;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    late final String uri;
    if (startDate == null && endDate == null) {
      uri = '$urlAdress/auth/birthday-list';
    } else {
      uri =
          '$urlAdress/auth/birthday-list?start_date=$startDate&end_date=$endDate';
    }

    final response = await _httpService.get(uri: uri, userToken: accessToken);
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
  Future<Rookies> getRookiesInfo({
    required final String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    late final String uri;
    if (startDate == null && endDate == null) {
      uri = '$urlAdress/auth/rookies';
    } else {
      uri = '$urlAdress/auth/rookies?start_date=$startDate&end_date=$endDate';
    }
    final response = await _httpService.get(uri: uri, userToken: accessToken);
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
  Future<UserInfo> getUserInfoById(
      {required String accessToken, required String userId}) async {
    String uri = '$urlAdress/auth/find_by_id/$userId';
    final response = await _httpService.get(uri: uri, userToken: accessToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final UserInfo result = UserInfo.fromJson(jsonData['result']);
      return result;
    } else {
      throw Exception('Error fetching User Info By Id User');
    }
  }

  @override
  Future<List<UserInfo>> findUser(
      {required String accessToken, required String findText}) async {
    String uri = '$urlAdress/auth/find_user?name=$findText';
    final response = await _httpService.get(uri: uri, userToken: accessToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final List<UserInfo> result = (jsonData as List<dynamic>)
          .map((item) => UserInfo.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error find User');
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required String accessToken,
      required List<String> tags,
      required int userId}) async {
    String uri = '$urlAdress/auth/add_tags_to_user';
    final String body = json.encode({
      "user_id": userId,
      "tags": tags,
    });
    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      throw ApiClientException(ApiClientExceptionType.addTags);
    } else {
      throw Exception('Error Add Tags');
    }
  }

  @override
  Future<bool> sendAvatarWithProfile({
    required String accessToken,
    required List<String> paths,
  }) async {
    String uri = '$urlAdress/auth/set_avatar';

    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: accessToken,
      paths: paths,
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
