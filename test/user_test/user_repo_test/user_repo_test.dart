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
          await userRepository.getUserInfo();
        } catch (_) {}
        verify(userApiClient.getUserInfo()).called(1);
      });
      test('throws when getUserInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserInfo()).thenThrow(exception);

        expect(
          () async => userRepository.getUserInfo(),
          throwsA(exception),
        );
      });

      test('succesfull when getUserInfo get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();

        when(userApiClient.getUserInfo()).thenAnswer((_) async => userMock);

        final actual = await userRepository.getUserInfo();
        expect(actual, userMock);
      });
    });

//getUserByPhoneNumber
    group('getUserByPhoneNumber', () {
      test('calls getUserByPhoneNumber with correct', () async {
        try {
          await userRepository.getUserByPhoneNumber(phoneNumber: '');
        } catch (_) {}
        verify(userApiClient.getUserByPhoneNumber(phoneNumber: '')).called(1);
      });
      test('throws when getUserByPhoneNumber fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserByPhoneNumber(phoneNumber: ''))
            .thenThrow(exception);

        expect(
          () async => userRepository.getUserByPhoneNumber(phoneNumber: ''),
          throwsA(exception),
        );
      });

      test('succesfull when getUserByPhoneNumber get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();
// Созадем list Users
        final List<UserInfo> listUser = [userMock];
        when(userApiClient.getUserByPhoneNumber(phoneNumber: ''))
            .thenAnswer((_) async => listUser);

        final actual =
            await userRepository.getUserByPhoneNumber(phoneNumber: '');
        expect(actual, listUser);
      });
    });
//getBirthDayInfo
    group('getBirthDayInfo', () {
      test('calls getBirthDayInfo with correct', () async {
        try {
          await userRepository.getBirthDayInfo();
        } catch (_) {}
        verify(userApiClient.getBirthDayInfo()).called(1);
      });
      test('throws when getBirthDayInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getBirthDayInfo()).thenThrow(exception);

        expect(
          () async => userRepository.getBirthDayInfo(),
          throwsA(exception),
        );
      });

      test('succesfull when getBirthDayInfo get', () async {
//Создаем BirthDayInfoEntity
        final BirthDayInfoEntity birthDayInfoEntity = MockBirthDayInfoEntity();

        when(userApiClient.getBirthDayInfo())
            .thenAnswer((_) async => birthDayInfoEntity);

        final actual = await userRepository.getBirthDayInfo();
        expect(actual, birthDayInfoEntity);
      });
    });
//getRookiesInfo
    group('getRookiesInfo', () {
      test('calls getRookiesInfo with correct', () async {
        try {
          await userRepository.getRookiesInfo();
        } catch (_) {}
        verify(userApiClient.getRookiesInfo()).called(1);
      });
      test('throws when getRookiesInfo fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getRookiesInfo()).thenThrow(exception);

        expect(
          () async => userRepository.getRookiesInfo(),
          throwsA(exception),
        );
      });

      test('succesfull when getRookiesInfo get', () async {
//Создаем Rookies
        final Rookies rookies = MockRookies();

        when(userApiClient.getRookiesInfo()).thenAnswer((_) async => rookies);

        final actual = await userRepository.getRookiesInfo();
        expect(actual, rookies);
      });
    });

//getUserInfoById
    group('getUserInfoById', () {
      test('calls getUserInfoById with correct', () async {
        try {
          await userRepository.getUserInfoById(
            userId: '',
          );
        } catch (_) {}
        verify(userApiClient.getUserInfoById(userId: '')).called(1);
      });
      test('throws when getUserInfoById fails', () async {
        final exception = Exception('oops');

        when(userApiClient.getUserInfoById(userId: '')).thenThrow(exception);

        expect(
          () async => userRepository.getUserInfoById(userId: ''),
          throwsA(exception),
        );
      });

      test('succesfull when getUserInfoById get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();

        when(userApiClient.getUserInfoById(userId: ''))
            .thenAnswer((_) async => userMock);

        final actual = await userRepository.getUserInfoById(userId: '');
        expect(actual, userMock);
      });
    });
//findUser
    group('findUser', () {
      test('calls findUser with correct', () async {
        try {
          await userRepository.findUser(
            findText: '',
          );
        } catch (_) {}
        verify(userApiClient.findUser(findText: '')).called(1);
      });
      test('throws when findUser fails', () async {
        final exception = Exception('oops');

        when(userApiClient.findUser(findText: '')).thenThrow(exception);

        expect(
          () async => userRepository.findUser(findText: ''),
          throwsA(exception),
        );
      });

      test('succesfull when findUser get', () async {
//Создаем User
        final UserInfo userMock = MockUserInfo();
// Созадем list Users
        final List<UserInfo> listUser = [userMock];
        when(userApiClient.findUser(findText: ''))
            .thenAnswer((_) async => listUser);

        final actual = await userRepository.findUser(findText: '');
        expect(actual, listUser);
      });
    });
//saveTagsToSend
    group('saveTagsToSend', () {
      const int userId = 8900;
      test('calls saveTagsToSend with correct', () async {
        try {
          await userRepository.saveTagsToSend(
            userId: userId,
            tags: [],
          );
        } catch (_) {}
        verify(userApiClient.saveTagsToSend(userId: userId, tags: []))
            .called(1);
      });
      test('throws when saveTagsToSend fails', () async {
        final exception = Exception('oops');

        when(userApiClient.saveTagsToSend(userId: userId, tags: []))
            .thenThrow(exception);

        expect(
          () async => userRepository.saveTagsToSend(userId: userId, tags: []),
          throwsA(exception),
        );
      });

      test('succesfull when saveTagsToSend get', () async {
        when(userApiClient.saveTagsToSend(userId: userId, tags: []))
            .thenAnswer((_) async => true);

        final actual =
            await userRepository.saveTagsToSend(userId: userId, tags: []);
        expect(actual, true);
      });
    });
//sendAvatarWithProfile
    group('sendAvatarWithProfile', () {
      final File file = MockFile();
      test('calls sendAvatarWithProfile with correct', () async {
        try {
          await userRepository.sendAvatarWithProfile(
            imageFile: file,
          );
        } catch (_) {}
        verifyNever(userApiClient.sendAvatarWithProfile(
          paths: ['path'],
        )).called(0);
      });
      // test('throws when sendAvatarWithProfile fails', () async {
      //   final exception = Exception('oops');

      //   when(userApiClient.sendAvatarWithProfile(
      //        paths: [])).thenThrow(Exception('oops'));

      //   expect(
      //     () async => userRepository.sendAvatarWithProfile(
      //          imageFile: file),
      //     throwsA(exception),
      //   );
      // });
      test('succesfull when sendAvatarWithProfile get', () async {
        when(userApiClient.sendAvatarWithProfile(
          paths: ['path'],
        )).thenAnswer((_) async => false);

        final actual = await userRepository.sendAvatarWithProfile(
          imageFile: file,
        );
        expect(actual, false);
      });
    });
  });
}
