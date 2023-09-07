import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

abstract class UserRepository {
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
    return _userProvider.getUserInfo(userToken: userToken);
  }

  @override
  Future<List<User>> getUserByPhoneNumber(
      {required String userToken, required String phoneNumber}) {
    return _userProvider.getUserByPhoneNumber(
        userToken: userToken, phoneNumber: phoneNumber);
  }
}
