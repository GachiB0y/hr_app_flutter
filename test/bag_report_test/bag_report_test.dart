import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/bloc/bag_report_bloc/bag_report_bloc.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/model/bag_report_entity/bag_report_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../statements_test/statements_test.mocks.dart';
import 'bag_report_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IServiceRepository>(),
    MockSpec<BagReportEntity>(),
  ],
)
void main() {
  group('bagReportBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IServiceRepository serviceRepository;

    // Создайте экземпляр вашего BLoC
    late BagReportBLoC bagReportBloc;
    //Создаем форму баг репорта
    late BagReportEntity bagReportEntity;

    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      serviceRepository = MockIServiceRepository();
      bagReportBloc = BagReportBLoC(
        authRepository: mockAuthRepository,
        repositoryService: serviceRepository,
      );
      bagReportEntity = MockBagReportEntity();
    });

    tearDown(() {
      bagReportBloc.close();
    });

    test('initial state is  data null', () {
      expect(bagReportBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(bagReportBloc.state, idleState);
    });

    blocTest<BagReportBLoC, BagReportState>(
        'emits [processing, error, idle] when Create form Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(serviceRepository.submitBagReportForm(
                  accessToken: accessToken, bagReportEntity: bagReportEntity))
              .thenThrow(Exception('oops'));
        },
        build: () => BagReportBLoC(
              authRepository: mockAuthRepository,
              repositoryService: serviceRepository,
            ),
        act: (bloc) =>
            bloc.add(BagReportEventCreate(formInfo: bagReportEntity)),
        errors: () => [isA<Exception>()]);

    blocTest<BagReportBLoC, BagReportState>(
      'emits BagReportState.successful when Create form event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(serviceRepository.submitBagReportForm(
                accessToken: accessToken, bagReportEntity: bagReportEntity))
            .thenAnswer((_) async => true);
      },
      build: () => bagReportBloc,
      act: (bloc) => bloc.add(BagReportEventCreate(formInfo: bagReportEntity)),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'send bag report true',
          null,
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<BagReportState$Idle>();
const errorState = TypeMatcher<BagReportState$Error>();
const processingState = TypeMatcher<BagReportState$Processing>();
const successfulState = TypeMatcher<BagReportState$Successful>();
