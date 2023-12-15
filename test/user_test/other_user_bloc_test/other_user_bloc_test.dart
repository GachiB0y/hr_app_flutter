import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/user/bloc/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/user/model/user/user.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../statements_test/statements_test.mocks.dart';
import '../user_bloc_test.dart/user_test.mocks.dart';

void main() {
  group('StatementsBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IUserRepository mockUserRepository;

    // Создайте экземпляр вашего BLoC
    late OtherUsersBloc otherUserBloc;

    // Создаем список тэгов
    List<TagUser> tags = [
      const TagUser(id: 19, name: "Официальный спонсор ГИБДД"),
      const TagUser(id: 25, name: "Vagodrocher🇩🇪")
    ];
    //Создаем пользователя
    User user = User(
      autoCard: 4761,
      name: 'Минаев',
      nameI: 'Дмитрий',
      nameO: 'Владимирович',
      staffPosition: 'Специалист',
      avatar:
          'http://grass-app-files.grass.su/files/avatars/user_02304761/c3e005773adc.webp',
      tags: tags,
      self: true,
    );

    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      mockUserRepository = MockIUserRepository();

      otherUserBloc = OtherUsersBloc(
          authRepository: mockAuthRepository, userRepo: mockUserRepository);
    });

    tearDown(() {
      otherUserBloc.close();
    });

    test('initial state is  data null', () {
      expect(otherUserBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(otherUserBloc.state, idleState);
    });

    blocTest<OtherUsersBloc, OtherUsersState>(
        'emits [processing, error, idle] when fetch user Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockUserRepository.getUserByPhoneNumber(
                  accessToken: accessToken, phoneNumber: 'fakePhoneNumber'))
              .thenThrow(Exception('oops'));
        },
        build: () => OtherUsersBloc(
            authRepository: mockAuthRepository, userRepo: mockUserRepository),
        act: (bloc) => bloc.add(const OtherUsersEvent.gethUsersByPhoneNumber(
            phoneNumber: 'fakePhoneNumber')),
        errors: () => [isA<Exception>()]);

    blocTest<OtherUsersBloc, OtherUsersState>(
      'emits otherUserState.successful when Get user by phone number event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockUserRepository.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: 'fakePhoneNumber'))
            .thenAnswer((_) async => [user]);
      },
      build: () => otherUserBloc,
      act: (bloc) => bloc.add(const OtherUsersEvent.gethUsersByPhoneNumber(
          phoneNumber: 'fakePhoneNumber')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'user',
          [user],
        ),
        idleState
      ],
    );

    blocTest<OtherUsersBloc, OtherUsersState>(
      'emits otherUserState.successful when Get user by phone number event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockUserRepository.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: 'fakePhoneNumber'))
            .thenAnswer((_) async => [user]);
      },
      build: () => otherUserBloc,
      act: (bloc) => bloc.add(const OtherUsersEvent.gethUsersByPhoneNumber(
          phoneNumber: 'fakePhoneNumber')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          ' list user',
          [user],
        ),
        idleState
      ],
    );

    blocTest<OtherUsersBloc, OtherUsersState>(
      'emits otherUserState.successful when Clear list event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockUserRepository.getUserByPhoneNumber(
                accessToken: accessToken, phoneNumber: 'fakePhoneNumber'))
            .thenAnswer((_) async => [user]);
      },
      seed: () => OtherUsersState$Idle(data: [user]),
      build: () => otherUserBloc,
      act: (bloc) => bloc.add(const OtherUsersEvent.clearList()),
      expect: () => <dynamic>[
        idleState.having(
          (state) => state.data,
          ' clear list user',
          [],
        ),
      ],
    );

    blocTest<OtherUsersBloc, OtherUsersState>(
      'emits otherUserState.successful when Find user event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockUserRepository.findUser(
                accessToken: accessToken, findText: 'fakeName'))
            .thenAnswer((_) async => [user]);
      },
      build: () => otherUserBloc,
      act: (bloc) =>
          bloc.add(const OtherUsersEvent.findUsers(findText: 'fakeName')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          ' list user',
          [user],
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<OtherUsersState>();
const errorState = TypeMatcher<OtherUsersState$Error>();
const processingState = TypeMatcher<OtherUsersState$Processing>();
const successfulState = TypeMatcher<OtherUsersState$Successful>();
