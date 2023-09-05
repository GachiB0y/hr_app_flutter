import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

abstract class UserRepository {
  Future<User> getUserInfo({required String userToken});
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
}
