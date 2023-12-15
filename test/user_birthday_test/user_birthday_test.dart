import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/features/services/model/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../statements_test/statements_test.mocks.dart';
import '../user_test/user_bloc_test.dart/user_test.mocks.dart';
import 'user_birthday_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<BirthDayInfoEntity>(),
  ],
)
void main() {
  group('user BirthDay BLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IUserRepository userRepository;

    // Создайте экземпляр вашего BLoC
    late UserBirthDayInfoBLoc userBirthdayBloc;

    //Создаем объект пользователя день рождение инфо
    late BirthDayInfoEntity birthDayInfoEntity;
    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      userRepository = MockIUserRepository();
      userBirthdayBloc = UserBirthDayInfoBLoc(
        authRepository: mockAuthRepository,
        userRepo: userRepository,
      );
      birthDayInfoEntity = MockBirthDayInfoEntity();
    });

    tearDown(() {
      userBirthdayBloc.close();
    });

    test('initial state is  data null', () {
      expect(userBirthdayBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(userBirthdayBloc.state, idleState);
    });

    blocTest<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
        'emits [processing, error, idle] when get BirthDay Info form Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(userRepository.getBirthDayInfo(
            accessToken: accessToken,
          )).thenThrow(Exception('oops'));
        },
        build: () => UserBirthDayInfoBLoc(
              authRepository: mockAuthRepository,
              userRepo: userRepository,
            ),
        act: (bloc) => bloc.add(const UserBirthDayInfoEventFetch()),
        errors: () => [isA<Exception>()]);

    blocTest<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
      'emits UserBirthDayInfoState.successful when get BirthDay Info form event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(userRepository.getBirthDayInfo(
          accessToken: accessToken,
        )).thenAnswer((_) async => birthDayInfoEntity);
      },
      build: () => userBirthdayBloc,
      act: (bloc) => bloc.add(const UserBirthDayInfoEventFetch()),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'birthDayInfoEntity',
          birthDayInfoEntity,
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<UserBirthDayInfoState$Idle>();
const errorState = TypeMatcher<UserBirthDayInfoState$Error>();
const processingState = TypeMatcher<UserBirthDayInfoState$Processing>();
const successfulState = TypeMatcher<UserBirthDayInfoState$Successful>();
