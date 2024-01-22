import 'dart:io' as io;
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';

import '../../../services/model/birth_day_info/birth_day_info.dart';
import '../../../services/model/rookies_entity/rookies.dart';
import '../../model/user/user_info.dart';

abstract interface class IUserRepository {
  Future<Rookies> getRookiesInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<bool> saveTagsToSend(
      {required List<TagUser> tags, required int userId});
  Future<UserInfo> getUserInfoById({required String userId});
  Future<BirthDayInfoEntity> getBirthDayInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<List<UserInfo>> findUser({required String findText});
  Future<UserInfo> getUserInfo();
  Future<List<UserInfo>> getUserByPhoneNumber({required String phoneNumber});
  Future<bool> sendAvatarWithProfile({required io.File imageFile});
}

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl({
    required IUserProvider userProvider,
  }) : _userProvider = userProvider;

  final IUserProvider _userProvider;

  @override
  Future<UserInfo> getUserInfo() async {
    try {
      final UserInfo result = await _userProvider.getUserInfo();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserInfo>> getUserByPhoneNumber(
      {required String phoneNumber}) async {
    try {
      final List<UserInfo> result =
          await _userProvider.getUserByPhoneNumber(phoneNumber: phoneNumber);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    try {
      final BirthDayInfoEntity result = await _userProvider.getBirthDayInfo(
          startDate: startDate, endDate: endDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Rookies> getRookiesInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    try {
      final Rookies result = await _userProvider.getRookiesInfo(
          startDate: startDate, endDate: endDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserInfo> getUserInfoById({required String userId}) async {
    try {
      final UserInfo result =
          await _userProvider.getUserInfoById(userId: userId);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserInfo>> findUser({required String findText}) async {
    try {
      final List<UserInfo> result =
          await _userProvider.findUser(findText: findText);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveTagsToSend(
      {required List<TagUser> tags, required int userId}) async {
    try {
      List<String> newListTags = [];
      for (var element in tags) {
        newListTags.add(element.name);
      }
      final result =
          await _userProvider.saveTagsToSend(tags: newListTags, userId: userId);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendAvatarWithProfile({required io.File imageFile}) async {
    try {
      final List<String> pathsNew = [];
      pathsNew.add(imageFile.path);
      final bool result = await _userProvider.sendAvatarWithProfile(
        paths: pathsNew,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
