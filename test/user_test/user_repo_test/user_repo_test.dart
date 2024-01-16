import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/services/model/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/features/services/model/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';
import 'package:hr_app_flutter/features/user/model/user/user_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../user_bloc_test.dart/user_test.mocks.dart';
import 'user_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IUserProvider>(),
    MockSpec<UserInfo>(),
    MockSpec<BirthDayInfoEntity>(),
    MockSpec<Rookies>(),
  ],
)
void main() {
  group('UserRepository', () {
    late IUserProvider userApiClient;
    late IUserRepository userRepository;
    const String accessToken = 'test_access_token';

    setUp(() {
// Создаем экземпляры мок-объектов
      userApiClient = MockIUserProvider();
// Создаем репозиторий
      userRepository = UserRepositoryImpl(
        userProvider: userApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal statements api client when not injected', () {
        expect(userRepository, isNotNull);
      });
    });
//getUserInfo
    group('getUserInfo', () {
      test('calls getUserInfo with correct', () async {
        try {
          await userRepository.getUserInfo(accessToken: accessToken);
        } catch (_) {}
        verify(userApiClient.getUserInfo(accessToken: accessToken)).called(1);
      });
      test('throws when getUserInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserInfo(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => userRepository.getUserInfo(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getUserInfo get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();

        when(userApiClient.getUserInfo(accessToken: accessToken))
            .thenAnswer((_) async => userMock);

        final actual =
            await userRepository.getUserInfo(accessToken: accessToken);
        expect(actual, userMock);
      });
    });

//getUserByPhoneNumber
    group('getUserByPhoneNumber', () {
      test('calls getUserByPhoneNumber with correct', () async {
        try {
          await userRepository.getUserByPhoneNumber(
              accessToken: accessToken, phoneNumber: '');
        } catch (_) {}
        verify(userApiClient.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: ''))
            .called(1);
      });
      test('throws when getUserByPhoneNumber fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: ''))
            .thenThrow(exception);

        expect(
          () async => userRepository.getUserByPhoneNumber(
              accessToken: accessToken, phoneNumber: ''),
          throwsA(exception),
        );
      });

      test('succesfull when getUserByPhoneNumber get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();
// Созадем list Users
        final List<UserInfo> listUser = [userMock];
        when(userApiClient.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: ''))
            .thenAnswer((_) async => listUser);

        final actual = await userRepository.getUserByPhoneNumber(
            accessToken: accessToken, phoneNumber: '');
        expect(actual, listUser);
      });
    });
//getBirthDayInfo
    group('getBirthDayInfo', () {
      test('calls getBirthDayInfo with correct', () async {
        try {
          await userRepository.getBirthDayInfo(
            accessToken: accessToken,
          );
        } catch (_) {}
        verify(userApiClient.getBirthDayInfo(
          accessToken: accessToken,
        )).called(1);
      });
      test('throws when getBirthDayInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getBirthDayInfo(
          accessToken: accessToken,
        )).thenThrow(exception);

        expect(
          () async => userRepository.getBirthDayInfo(
            accessToken: accessToken,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when getBirthDayInfo get', () async {
//Создаем BirthDayInfoEntity
        final BirthDayInfoEntity birthDayInfoEntity = MockBirthDayInfoEntity();

        when(userApiClient.getBirthDayInfo(
          accessToken: accessToken,
        )).thenAnswer((_) async => birthDayInfoEntity);

        final actual = await userRepository.getBirthDayInfo(
          accessToken: accessToken,
        );
        expect(actual, birthDayInfoEntity);
      });
    });
//getRookiesInfo
    group('getRookiesInfo', () {
      test('calls getRookiesInfo with correct', () async {
        try {
          await userRepository.getRookiesInfo(
            accessToken: accessToken,
          );
        } catch (_) {}
        verify(userApiClient.getRookiesInfo(
          accessToken: accessToken,
        )).called(1);
      });
      test('throws when getRookiesInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getRookiesInfo(
          accessToken: accessToken,
        )).thenThrow(exception);

        expect(
          () async => userRepository.getRookiesInfo(
            accessToken: accessToken,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when getRookiesInfo get', () async {
//Создаем Rookies
        final Rookies rookies = MockRookies();

        when(userApiClient.getRookiesInfo(
          accessToken: accessToken,
        )).thenAnswer((_) async => rookies);

        final actual = await userRepository.getRookiesInfo(
          accessToken: accessToken,
        );
        expect(actual, rookies);
      });
    });

//getUserInfoById
    group('getUserInfoById', () {
      test('calls getUserInfoById with correct', () async {
        try {
          await userRepository.getUserInfoById(
            accessToken: accessToken,
            userId: '',
          );
        } catch (_) {}
        verify(userApiClient.getUserInfoById(
                accessToken: accessToken, userId: ''))
            .called(1);
      });
      test('throws when getUserInfoById fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserInfoById(
                accessToken: accessToken, userId: ''))
            .thenThrow(exception);

        expect(
          () async => userRepository.getUserInfoById(
              accessToken: accessToken, userId: ''),
          throwsA(exception),
        );
      });

      test('succesfull when getUserInfoById get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();

        when(userApiClient.getUserInfoById(
                accessToken: accessToken, userId: ''))
            .thenAnswer((_) async => userMock);

        final actual = await userRepository.getUserInfoById(
            accessToken: accessToken, userId: '');
        expect(actual, userMock);
      });
    });
//findUser
    group('findUser', () {
      test('calls findUser with correct', () async {
        try {
          await userRepository.findUser(
            accessToken: accessToken,
            findText: '',
          );
        } catch (_) {}
        verify(userApiClient.findUser(accessToken: accessToken, findText: ''))
            .called(1);
      });
      test('throws when findUser fails', () async {
        final exception = Exception('oops');

        when(userApiClient.findUser(accessToken: accessToken, findText: ''))
            .thenThrow(exception);

        expect(
          () async =>
              userRepository.findUser(accessToken: accessToken, findText: ''),
          throwsA(exception),
        );
      });

      test('succesfull when findUser get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();
// Созадем list Users
        final List<UserInfo> listUser = [userMock];
        when(userApiClient.findUser(accessToken: accessToken, findText: ''))
            .thenAnswer((_) async => listUser);

        final actual = await userRepository.findUser(
            accessToken: accessToken, findText: '');
        expect(actual, listUser);
      });
    });
//saveTagsToSend
    group('saveTagsToSend', () {
      const int userId = 8900;
      test('calls saveTagsToSend with correct', () async {
        try {
          await userRepository.saveTagsToSend(
            accessToken: accessToken,
            userId: userId,
            tags: [],
          );
        } catch (_) {}
        verify(userApiClient.saveTagsToSend(
            accessToken: accessToken, userId: userId, tags: [])).called(1);
      });
      test('throws when saveTagsToSend fails', () async {
        final exception = Exception('oops');

        when(userApiClient.saveTagsToSend(
            accessToken: accessToken,
            userId: userId,
            tags: [])).thenThrow(exception);

        expect(
          () async => userRepository.saveTagsToSend(
              accessToken: accessToken, userId: userId, tags: []),
          throwsA(exception),
        );
      });

      test('succesfull when saveTagsToSend get', () async {
        when(userApiClient.saveTagsToSend(
            accessToken: accessToken,
            userId: userId,
            tags: [])).thenAnswer((_) async => true);

        final actual = await userRepository
            .saveTagsToSend(accessToken: accessToken, userId: userId, tags: []);
        expect(actual, true);
      });
    });
//sendAvatarWithProfile
    group('sendAvatarWithProfile', () {
      final File file = MockFile();
      test('calls sendAvatarWithProfile with correct', () async {
        try {
          await userRepository.sendAvatarWithProfile(
            accessToken: accessToken,
            imageFile: file,
          );
        } catch (_) {}
        verifyNever(userApiClient.sendAvatarWithProfile(
          accessToken: accessToken,
          paths: ['path'],
        )).called(0);
      });
      // test('throws when sendAvatarWithProfile fails', () async {
      //   final exception = Exception('oops');

      //   when(userApiClient.sendAvatarWithProfile(
      //       accessToken: accessToken, paths: [])).thenThrow(Exception('oops'));

      //   expect(
      //     () async => userRepository.sendAvatarWithProfile(
      //         accessToken: accessToken, imageFile: file),
      //     throwsA(exception),
      //   );
      // });
      test('succesfull when sendAvatarWithProfile get', () async {
        when(userApiClient.sendAvatarWithProfile(
          accessToken: accessToken,
          paths: ['path'],
        )).thenAnswer((_) async => false);

        final actual = await userRepository.sendAvatarWithProfile(
          accessToken: accessToken,
          imageFile: file,
        );
        expect(actual, false);
      });
    });
  });
}
