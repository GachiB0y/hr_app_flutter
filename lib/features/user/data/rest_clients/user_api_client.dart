import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import '../../../services/model/birth_day_info/birth_day_info.dart';
import '../../../services/model/rookies_entity/rookies.dart';
import '../../model/user/user_info.dart';

abstract interface class IUserProvider {
  Future<UserInfo> getUserInfo();
  Future<bool> saveTagsToSend(
      {required List<String> tags, required int userId});
  Future<UserInfo> getUserInfoById({required String userId});
  Future<List<UserInfo>> findUser({required String findText});
  Future<BirthDayInfoEntity> getBirthDayInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<Rookies> getRookiesInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  });
  Future<List<UserInfo>> getUserByPhoneNumber({required String phoneNumber});
  Future<bool> sendAvatarWithProfile({
    required List<String> paths,
  });
}

class UserProviderImpl implements IUserProvider {
  final RestClient _httpService;

  UserProviderImpl(this._httpService);

  @override
  Future<UserInfo> getUserInfo() async {
    final response = await _httpService.get(
      '/auth/profile',
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final UserInfo result = UserInfo.fromJson(data);
      return result;
    }
    throw Exception('Error fetching User Info');
  }

  @override
  Future<List<UserInfo>> getUserByPhoneNumber(
      {required String phoneNumber}) async {
    final response = await _httpService.get(
      '/auth/find_by_phone/$phoneNumber',
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final UserInfo result = UserInfo.fromJson(data);
      final listUser = <UserInfo>[];
      listUser.add(result);
      return listUser;
    }
    throw Exception('Error fetching User Info by phone');
  }

  @override
  Future<BirthDayInfoEntity> getBirthDayInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    final queryParams = (startDate == null && endDate == null)
        ? null
        : {"start_date": startDate.toString(), "end_date": endDate.toString()};

    final response = await _httpService.get(
      '/auth/birthday-list',
      queryParams: queryParams,
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final BirthDayInfoEntity result = BirthDayInfoEntity.fromJson(data);

      return result;
    }
    throw Exception('Error fetching User Info Birthday List');
  }

  @override
  Future<Rookies> getRookiesInfo({
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    final queryParams = (startDate == null && endDate == null)
        ? null
        : {"start_date": startDate.toString(), "end_date": endDate.toString()};

    final response =
        await _httpService.get('/auth/rookies', queryParams: queryParams);
    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final Rookies result = Rookies.fromJson(data);

      return result;
    }
    throw Exception('Error fetching Info Rookies');
  }

  @override
  Future<UserInfo> getUserInfoById({required String userId}) async {
    final response = await _httpService.get(
      '/auth/find_by_id/$userId',
    );
    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final UserInfo result = UserInfo.fromJson(data);

      return result;
    }
    throw const FormatException('Error fetching User Info By Id User');
  }

  @override
  Future<List<UserInfo>> findUser({required String findText}) async {
    final response = await _httpService.get(
      '/auth/find_user',
      queryParams: {'name': findText},
    );
    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final List<UserInfo> result =
          data.map((item) => UserInfo.fromJson(item)).toList();
      return result;
    }
    throw const FormatException('Error fetching findUser User');
  }

  @override
  Future<bool> saveTagsToSend(
      {required List<String> tags, required int userId}) async {
    final response = await _httpService.post(
      '/auth/add_tags_to_user',
      body: {
        "user_id": userId,
        "tags": tags,
      },
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      if (data['success'] == true) {
        return true;
      }
    }
    throw Exception('Error Add Tags');

    // if (response.statusCode == 200) {
    //   return true;
    // } else if (response.statusCode == 400) {
    //   throw ApiClientException(ApiClientExceptionType.addTags);
    // } else {
    //   throw Exception('Error Add Tags');
    // }
  }

  @override
  Future<bool> sendAvatarWithProfile({
    required List<String> paths,
  }) async {
    final response = await _httpService.post(
      '/auth/set_avatar',
      pathsToFiles: paths,
      body: {},
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      if (data['status'] == "ok") {
        return true;
      }
    }
    throw Exception('Error Save Avatar');

    // if (response.statusCode == 201) {
    //   return true;
    // } else if (response.statusCode == 400) {
    //   throw ApiClientException(ApiClientExceptionType.addTags);
    // } else {
    //   throw Exception('Error Add Tags');
    // }
  }
}
