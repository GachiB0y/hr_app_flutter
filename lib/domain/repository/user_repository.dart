import 'dart:io' as io;

import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/entity/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

abstract class UserRepository {
  Future<Rookies> getRookiesInfo({required String userToken});
  Future<bool> saveTagsToSend(
      {required String userToken,
      required List<TagUser> tags,
      required int userId});
  Future<User> getUserInfoById(
      {required String userToken, required String userID});
  Future<BirthDayInfoEntity> getBirthDayInfo({required String userToken});
  Future<List<User>> findUser(
      {required String userToken, required String findText});
  Future<User> getUserInfo({required String userToken});
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber});
  Future<bool> sendAvatarWithProfile(
      {required String userToken, required io.File imageFile});
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserProvider userProvider,
  }) : _userProvider = userProvider;

  final UserProvider _userProvider;

  @override
  Future<User> getUserInfo({required String userToken}) {
    try {
      return _userProvider.getUserInfo(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber}) {
    try {
      return _userProvider.getUserByPhoneNumber(
          userToken: userToken, phoneNumber: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({required String userToken}) {
    try {
      return _userProvider.getBirthDayInfo(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Rookies> getRookiesInfo({required String userToken}) {
    try {
      return _userProvider.getRookiesInfo(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUserInfoById(
      {required String userToken, required String userID}) {
    try {
      return _userProvider.getUserInfoById(
          userToken: userToken, userID: userID);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<User>> findUser(
      {required String userToken, required String findText}) {
    try {
      return _userProvider.findUser(userToken: userToken, findText: findText);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required String userToken,
      required List<TagUser> tags,
      required int userId}) {
    try {
      List<String> newListTags = [];
      for (var element in tags) {
        newListTags.add(element.name);
      }
      return _userProvider.saveTagsToSend(
          userToken: userToken, tags: newListTags, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendAvatarWithProfile(
      {required String userToken, required io.File imageFile}) {
    try {
      return _userProvider.sendAvatarWithProfile(
        userToken: userToken,
        imageFile: imageFile,
      );
    } catch (e) {
      rethrow;
    }
  }
}
