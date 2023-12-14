import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../service_repo_test/service_repo_test.mocks.dart';
import 'lean_production_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<LeanProductionFormEntity>(),
    MockSpec<MyLeanProductionsEntity>(),
  ],
)
void main() {
  group('LeanProduction Repository', () {
    late IServiceProvider serviceApiClient;
    late ILeanProductionRepository leanProductionRepository;
    const String accessToken = 'test_access_token';
    setUp(() {
// Создаем экземпляры мок-объектов
      serviceApiClient = MockIServiceProvider();
// Создаем репозиторий
      leanProductionRepository = LeanProductionRepositoryImpl(
        serviceProvider: serviceApiClient,
      );
    });
//submitForm
    group('submitForm', () {
      final form = MockLeanProductionFormEntity();
      test('calls submitForm with correct', () async {
        try {
          await leanProductionRepository.submitForm(
            accessToken: accessToken,
            formEntity: form,
          );
        } catch (_) {}
        verify(serviceApiClient.sendFormLeanProduction(
                accessToken: accessToken, formEntity: form))
            .called(1);
      });
      test('throws when submitForm fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.sendFormLeanProduction(
                accessToken: accessToken, formEntity: form))
            .thenThrow(exception);

        expect(
          () async => leanProductionRepository.submitForm(
              accessToken: accessToken, formEntity: form),
          throwsA(exception),
        );
      });

      test('succesfull when submitForm get', () async {
        when(serviceApiClient.sendFormLeanProduction(
                accessToken: accessToken, formEntity: form))
            .thenAnswer((_) async => false);

        final actual = await leanProductionRepository.submitForm(
            accessToken: accessToken, formEntity: form);
        expect(actual, false);
      });
    });

//getMyLeanProductions
    group('getMyLeanProductions', () {
      test('calls getMyLeanProductions with correct', () async {
        try {
          await leanProductionRepository.getMyLeanProductions(
            accessToken: accessToken,
          );
        } catch (_) {}
        verify(serviceApiClient.getMyLeanProductions(
          accessToken: accessToken,
        )).called(1);
      });
      test('throws when getMyLeanProductions fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.getMyLeanProductions(
          accessToken: accessToken,
        )).thenThrow(exception);

        expect(
          () async => leanProductionRepository.getMyLeanProductions(
            accessToken: accessToken,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when getMyLeanProductions get', () async {
//Создаем MyLeanProductionsEntity
        final MyLeanProductionsEntity myLeanProductionsEntity =
            MockMyLeanProductionsEntity();
//Создаем  List MyLeanProductionsEntity
        final List<MyLeanProductionsEntity> data = [myLeanProductionsEntity];
        when(serviceApiClient.getMyLeanProductions(
          accessToken: accessToken,
        )).thenAnswer((anser) async => data);

        final actual = await leanProductionRepository.getMyLeanProductions(
          accessToken: accessToken,
        );
        expect(actual, data);
      });
    });

//downloadFileWithLeanProduction
    group('downloadFileWithLeanProduction', () {
      test('calls downloadFileWithLeanProduction with correct', () async {
        try {
          await leanProductionRepository.downloadFileWithLeanProduction(
            accessToken: accessToken,
            url: '',
          );
        } catch (_) {}
        verify(serviceApiClient.downloadFileWithLeanProduction(
          accessToken: accessToken,
          url: '',
        )).called(1);
      });
      test('throws when downloadFileWithLeanProduction fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.downloadFileWithLeanProduction(
          accessToken: accessToken,
          url: '',
        )).thenThrow(exception);

        expect(
          () async => leanProductionRepository.downloadFileWithLeanProduction(
            accessToken: accessToken,
            url: '',
          ),
          throwsA(exception),
        );
      });

      test('succesfull when downloadFileWithLeanProduction get', () async {
        when(serviceApiClient.downloadFileWithLeanProduction(
          accessToken: accessToken,
          url: '',
        ));

        final actual =
            await leanProductionRepository.downloadFileWithLeanProduction(
          accessToken: accessToken,
          url: '',
        );
        expect(
          () => actual,
          isA<void>(),
        );
      });
    });
  });
}
