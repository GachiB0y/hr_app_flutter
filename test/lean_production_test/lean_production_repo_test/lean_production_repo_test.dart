import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../service_test/service_repo_test/service_repo_test.mocks.dart';
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
            formEntity: form,
          );
        } catch (_) {}
        verify(serviceApiClient.sendFormLeanProduction(formEntity: form))
            .called(1);
      });
      test('throws when submitForm fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.sendFormLeanProduction(formEntity: form))
            .thenThrow(exception);

        expect(
          () async => leanProductionRepository.submitForm(formEntity: form),
          throwsA(exception),
        );
      });

      test('succesfull when submitForm get', () async {
        when(serviceApiClient.sendFormLeanProduction(formEntity: form))
            .thenAnswer((_) async => false);

        final actual =
            await leanProductionRepository.submitForm(formEntity: form);
        expect(actual, false);
      });
    });

//getMyLeanProductions
    group('getMyLeanProductions', () {
      test('calls getMyLeanProductions with correct', () async {
        try {
          await leanProductionRepository.getMyLeanProductions();
        } catch (_) {}
        verify(serviceApiClient.getMyLeanProductions()).called(1);
      });
      test('throws when getMyLeanProductions fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.getMyLeanProductions()).thenThrow(exception);

        expect(
          () async => leanProductionRepository.getMyLeanProductions(),
          throwsA(exception),
        );
      });

      test('succesfull when getMyLeanProductions get', () async {
//Создаем MyLeanProductionsEntity
        final MyLeanProductionsEntity myLeanProductionsEntity =
            MockMyLeanProductionsEntity();
//Создаем  List MyLeanProductionsEntity
        final List<MyLeanProductionsEntity> data = [myLeanProductionsEntity];
        when(serviceApiClient.getMyLeanProductions())
            .thenAnswer((anser) async => data);

        final actual = await leanProductionRepository.getMyLeanProductions();
        expect(actual, data);
      });
    });

//downloadFileWithLeanProduction
    group('downloadFileWithLeanProduction', () {
      test('calls downloadFileWithLeanProduction with correct', () async {
        try {
          await leanProductionRepository.downloadFileWithLeanProduction(
            url: '',
          );
        } catch (_) {}
        verify(serviceApiClient.downloadFileWithLeanProduction(
          url: '',
        )).called(1);
      });
      test('throws when downloadFileWithLeanProduction fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.downloadFileWithLeanProduction(
          url: '',
        )).thenThrow(exception);

        expect(
          () async => leanProductionRepository.downloadFileWithLeanProduction(
            url: '',
          ),
          throwsA(exception),
        );
      });

      test('succesfull when downloadFileWithLeanProduction get', () async {
        when(serviceApiClient.downloadFileWithLeanProduction(
          url: '',
        ));

        final actual =
            await leanProductionRepository.downloadFileWithLeanProduction(
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
