import 'dart:io' as io;
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';

import '../../../services/model/birth_day_info/birth_day_info.dart';
import '../../../services/model/rookies_entity/rookies.dart';
import '../../model/user/user.dart';

abstract interface class IUserRepository {
  Future<Rookies> getRookiesInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<bool> saveTagsToSend(
      {required String accessToken,
      required List<TagUser> tags,
      required int userId});
  Future<User> getUserInfoById(
      {required String accessToken, required String userID});
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<List<User>> findUser(
      {required String accessToken, required String findText});
  Future<User> getUserInfo({required String accessToken});
  Future<List<User>> getUserByPhoneNumber(
      {required String accessToken, required String phoneNumber});
  Future<bool> sendAvatarWithProfile(
      {required String accessToken, required io.File imageFile});
}

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({
    required IUserProvider userProvider,
  }) : _userProvider = userProvider;

  final IUserProvider _userProvider;

  @override
  Future<User> getUserInfo({required String accessToken}) {
    try {
      return _userProvider.getUserInfo(userToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<User>> getUserByPhoneNumber(
      {required String accessToken, required String phoneNumber}) {
    try {
      return _userProvider.getUserByPhoneNumber(
          userToken: accessToken, phoneNumber: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) {
    try {
      return _userProvider.getBirthDayInfo(
          userToken: accessToken, startDate: startDate, endDate: endDate);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Rookies> getRookiesInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) {
    try {
      return _userProvider.getRookiesInfo(
          userToken: accessToken, startDate: startDate, endDate: endDate);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUserInfoById(
      {required String accessToken, required String userID}) {
    try {
      return _userProvider.getUserInfoById(
          userToken: accessToken, userID: userID);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<User>> findUser(
      {required String accessToken, required String findText}) {
    try {
      return _userProvider.findUser(userToken: accessToken, findText: findText);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required String accessToken,
      required List<TagUser> tags,
      required int userId}) {
    try {
      List<String> newListTags = [];
      for (var element in tags) {
        newListTags.add(element.name);
      }
      return _userProvider.saveTagsToSend(
          userToken: accessToken, tags: newListTags, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendAvatarWithProfile(
      {required String accessToken, required io.File imageFile}) {
    try {
      final List<String> pathsNew = [];
      pathsNew.add(imageFile.path);
      return _userProvider.sendAvatarWithProfile(
        userToken: accessToken,
        paths: pathsNew,
      );
    } catch (e) {
      rethrow;
    }
  }
}
