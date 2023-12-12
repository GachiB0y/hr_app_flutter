import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/services/model/bag_report_entity/bag_report_entity.dart';
import 'package:hr_app_flutter/features/services/model/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'service_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IServiceProvider>(),
    MockSpec<Service>(),
    MockSpec<ScheduleBus>(),
    MockSpec<BagReportEntity>(),
  ],
)
void main() {
  group('Service Repository', () {
    late IServiceProvider serviceApiClient;
    late IServiceRepository serviceRepository;
    const String accessToken = 'test_access_token';
    setUp(() {
// Создаем экземпляры мок-объектов
      serviceApiClient = MockIServiceProvider();
// Создаем репозиторий
      serviceRepository = ServiceRepositoryImpl(
        serviceProvider: serviceApiClient,
      );
    });

//getServices
    group('getServices', () {
      test('calls getServices with correct', () async {
        try {
          await serviceRepository.getServices(accessToken: accessToken);
        } catch (_) {}
        verify(serviceApiClient.getServices(accessToken: accessToken))
            .called(1);
      });
      test('throws when getServices fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.getServices(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => serviceRepository.getServices(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getServices get', () async {
//Создаем Service
        final Service serviceMock = MockService();
//Создаем  list Service
        final List<Service> listServices = [serviceMock];

        when(serviceApiClient.getServices(accessToken: accessToken))
            .thenAnswer((_) async => listServices);

        final actual =
            await serviceRepository.getServices(accessToken: accessToken);
        expect(actual, listServices);
      });
    });

//getScheduleBus
    group('getScheduleBus', () {
      test('calls getScheduleBus with correct', () async {
        try {
          await serviceRepository.getScheduleBus(accessToken: accessToken);
        } catch (_) {}
        verify(serviceApiClient.getScheduleBus(accessToken: accessToken))
            .called(1);
      });
      test('throws when getScheduleBus fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.getScheduleBus(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async =>
              serviceRepository.getScheduleBus(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getScheduleBus get', () async {
//Создаем ScheduleBus
        final ScheduleBus scheduleBusMock = MockScheduleBus();

        when(serviceApiClient.getScheduleBus(accessToken: accessToken))
            .thenAnswer((_) async => scheduleBusMock);

        final actual =
            await serviceRepository.getScheduleBus(accessToken: accessToken);
        expect(actual, scheduleBusMock);
      });
    });
//submitBagReportForm
    group('submitBagReportForm', () {
      final form = MockBagReportEntity();
      test('calls submitBagReportForm with correct', () async {
        try {
          await serviceRepository.submitBagReportForm(
              accessToken: accessToken, bagReportEntity: form);
        } catch (_) {}
        verify(serviceApiClient.submitBagReportForm(
                accessToken: accessToken, bagReportEntity: form))
            .called(1);
      });
      test('throws when submitBagReportForm fails', () async {
        final exception = Exception('oops');

        when(serviceApiClient.submitBagReportForm(
                accessToken: accessToken, bagReportEntity: form))
            .thenThrow(exception);

        expect(
          () async => serviceRepository.submitBagReportForm(
              accessToken: accessToken, bagReportEntity: form),
          throwsA(exception),
        );
      });

      test('succesfull when submitBagReportForm get', () async {
        when(serviceApiClient.submitBagReportForm(
                accessToken: accessToken, bagReportEntity: form))
            .thenAnswer((_) async => false);

        final actual = await serviceRepository.submitBagReportForm(
            accessToken: accessToken, bagReportEntity: form);
        expect(actual, false);
      });
    });
  });
}
