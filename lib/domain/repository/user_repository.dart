import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/entity/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

abstract class UserRepository {
  Future<Rookies> getRookiesInfo({required String userToken});
  Future<BirthDayInfoEntity> getBirthDayInfo({required String userToken});
  Future<User> getUserInfo({required String userToken});
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber});
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
}
