import 'package:hr_app_flutter/features/services/bloc/rookies_bloc/rookies_bloc.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../user_test/user_bloc_test.dart/user_test.mocks.dart';
import 'rookies_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<RookiesEntity>(),
  ],
)
void main() {
  group('user Rookies BLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IUserRepository userRepository;

    // Создайте экземпляр вашего BLoC
    late RookiesBLoC rookiesBloc;

    //Создаем объект новички
    late RookiesEntity rookiesEntity;

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      userRepository = MockIUserRepository();
      rookiesBloc = RookiesBLoC(
        userRepo: userRepository,
      );
      rookiesEntity = MockRookiesEntity();
    });

    tearDown(() {
      rookiesBloc.close();
    });

    test('initial state is  data null', () {
      expect(rookiesBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(rookiesBloc.state, idleState);
    });

    blocTest<RookiesBLoC, RookiesState>(
        'emits [processing, error, idle] when get BirthDay Info form Exception throws',
        setUp: () {
          when(userRepository.getRookiesInfo()).thenThrow(Exception('oops'));
        },
        build: () => RookiesBLoC(
              userRepo: userRepository,
            ),
        act: (bloc) => bloc.add(const RookiesEventFetch()),
        errors: () => [isA<Exception>()]);

    blocTest<RookiesBLoC, RookiesState>(
      'emits RookiesState.successful when get BirthDay Info form event is added',
      setUp: () {
        when(userRepository.getRookiesInfo())
            .thenAnswer((_) async => rookiesEntity);
      },
      build: () => rookiesBloc,
      act: (bloc) => bloc.add(const RookiesEventFetch()),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'RookiesEntity',
          rookiesEntity,
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<RookiesState$Idle>();
const errorState = TypeMatcher<RookiesState$Error>();
const processingState = TypeMatcher<RookiesState$Processing>();
const successfulState = TypeMatcher<RookiesState$Successful>();
