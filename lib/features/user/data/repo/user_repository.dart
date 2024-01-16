import 'dart:io' as io;
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';

import '../../../services/model/birth_day_info/birth_day_info.dart';
import '../../../services/model/rookies_entity/rookies.dart';
import '../../model/user/user_info.dart';

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
  Future<UserInfo> getUserInfoById(
      {required String accessToken, required String userId});
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<List<UserInfo>> findUser(
      {required String accessToken, required String findText});
  Future<UserInfo> getUserInfo({required String accessToken});
  Future<List<UserInfo>> getUserByPhoneNumber(
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
  Future<UserInfo> getUserInfo({required String accessToken}) async {
    try {
      final UserInfo result =
          await _userProvider.getUserInfo(accessToken: accessToken);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserInfo>> getUserByPhoneNumber(
      {required String accessToken, required String phoneNumber}) async {
    try {
      final List<UserInfo> result = await _userProvider.getUserByPhoneNumber(
          accessToken: accessToken, phoneNumber: phoneNumber);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    try {
      final BirthDayInfoEntity result = await _userProvider.getBirthDayInfo(
          accessToken: accessToken, startDate: startDate, endDate: endDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Rookies> getRookiesInfo({
    required String accessToken,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    try {
      final Rookies result = await _userProvider.getRookiesInfo(
          accessToken: accessToken, startDate: startDate, endDate: endDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserInfo> getUserInfoById(
      {required String accessToken, required String userId}) async {
    try {
      final UserInfo result = await _userProvider.getUserInfoById(
          accessToken: accessToken, userId: userId);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserInfo>> findUser(
      {required String accessToken, required String findText}) async {
    try {
      final List<UserInfo> result = await _userProvider.findUser(
          accessToken: accessToken, findText: findText);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required String accessToken,
      required List<TagUser> tags,
      required int userId}) async {
    try {
      List<String> newListTags = [];
      for (var element in tags) {
        newListTags.add(element.name);
      }
      final result = await _userProvider.saveTagsToSend(
          accessToken: accessToken, tags: newListTags, userId: userId);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendAvatarWithProfile(
      {required String accessToken, required io.File imageFile}) async {
    try {
      final List<String> pathsNew = [];
      pathsNew.add(imageFile.path);
      final bool result = await _userProvider.sendAvatarWithProfile(
        accessToken: accessToken,
        paths: pathsNew,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
