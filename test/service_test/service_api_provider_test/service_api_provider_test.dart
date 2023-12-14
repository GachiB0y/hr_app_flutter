import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

import 'package:hr_app_flutter/features/services/model/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../service_repo_test/service_repo_test.mocks.dart';
import '../lean_production_repo_test/lean_production_repo_test.mocks.dart';
import 'service_api_provider_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<HTTPServiceImpl>(),
    // MockSpec<LeanProductionFormEntity>(),
    MockSpec<StreamedResponse>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
  ],
)
void main() {
  late HTTPServiceImpl mockHTTPService; // = MockHTTPServiceImpl();
  late ServiceProviderImpl
      serviceApiClient; // = ServiceProviderImpl(mockHTTPService);
  setUp(() {
// Создаем экземпляры мок-объектов
    mockHTTPService = MockHTTPServiceImpl();
// Создаем репозиторий
    serviceApiClient = ServiceProviderImpl(mockHTTPService);
  });

  group('getServices', () {
    test('fetches services successfully', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/admin/avalible_services_list';

      final jsonData = {
        'result': [
          {
            "id": 22,
            "name": "Новости",
            "permissions": {
              "create_service": true,
              "update_service": true,
              "delete_service": true,
              "approve_service": true
            }
          },
        ]
      };
      final expectedServices = <Service>[
        const Service(
            id: 22,
            name: "Новости",
            permissions: Permissions(
                approveService: true,
                createService: true,
                deleteService: true,
                updateService: true)),
      ];

      final byteStream =
          ByteStream.fromBytes(utf8.encode(json.encode(jsonData)));
      final response = StreamedResponse(
        byteStream,
        200,
        headers: {'content-type': 'application/json'},
      );
      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act
      final services =
          await serviceApiClient.getServices(accessToken: accessToken);

      // Assert
      expect(services, equals(expectedServices));
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });

    test('throws exception when fetching services fails', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/admin/avalible_services_list';
      final response = StreamedResponse(
        const Stream.empty(),
        400,
        headers: {'content-type': 'application/json'},
      );

      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(
        () => serviceApiClient.getServices(accessToken: accessToken),
        throwsException,
      );
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });
  });

  group('getScheduleBus', () {
    test('fetches scheduleBus successfully', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/bus/get_destination';

      final jsonData = {
        'result': [
          {
            "country": "Волгоград",
            "destinations": [
              {
                "name_path": "С ул.Грамши 8:05",
                "link": "https://yandex.ru/maps/-/CCUoMAgcSD"
              },
            ]
          }
        ]
      };
      const expectedSchedule = ScheduleBus(result: <City>[
        City(country: 'Волгоград', destinations: <Destination>[
          Destination(
              namePath: 'С ул.Грамши 8:05',
              link: 'https://yandex.ru/maps/-/CCUoMAgcSD')
        ])
      ]);

      final byteStream =
          ByteStream.fromBytes(utf8.encode(json.encode(jsonData)));
      final response = StreamedResponse(
        byteStream,
        200,
        headers: {'content-type': 'application/json'},
      );
      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act
      final scheduleBus =
          await serviceApiClient.getScheduleBus(accessToken: accessToken);

      // Assert
      expect(scheduleBus, equals(expectedSchedule));
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });

    test('throws exception when fetching scheduleBus fails', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/bus/get_destination';
      final response = StreamedResponse(
        const Stream.empty(),
        400,
        headers: {'content-type': 'application/json'},
      );

      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(
        () => serviceApiClient.getScheduleBus(accessToken: accessToken),
        throwsException,
      );
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });
  });
//sendFormLeanProduction
  group('sendFormLeanProduction', () {
    final formEntity = MockLeanProductionFormEntity();

    test('fetches services successfully', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/lean_fabrication/create_proposal?';
      final Map<String, String> newFields = {
        'issue':
            '{     "realized": ${formEntity.realized},     "first_implementer": ${formEntity.firstImplementer},     "second_implementer": ${formEntity.secondImplementer},     "third_implementer": ${formEntity.thirdImplementer},     "issue": "${formEntity.issue}",     "solution": "${formEntity.solution}",     "expenses": "${formEntity.expenses}",     "benefit": "${formEntity.benefit}" }'
      };
      final response = StreamedResponse(
        const Stream.empty(),
        201,
        headers: {'content-type': 'application/json'},
      );
      when(mockHTTPService.postWithFile(
              uri: uri,
              userToken: accessToken,
              paths: formEntity.paths,
              fieldsNew: newFields))
          .thenAnswer((_) async => response);

      // Act
      final isSend = await serviceApiClient.sendFormLeanProduction(
          accessToken: accessToken, formEntity: formEntity);

      // Assert
      expect(isSend, equals(true));
    });

    test('throws exception when fetching sendFormLeanProduction fails',
        () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/lean_fabrication/create_proposal?';
      final Map<String, String> newFields = {
        'issue':
            '{     "realized": ${formEntity.realized},     "first_implementer": ${formEntity.firstImplementer},     "second_implementer": ${formEntity.secondImplementer},     "third_implementer": ${formEntity.thirdImplementer},     "issue": "${formEntity.issue}",     "solution": "${formEntity.solution}",     "expenses": "${formEntity.expenses}",     "benefit": "${formEntity.benefit}" }'
      };
      final response = StreamedResponse(
        const Stream.empty(),
        400,
        headers: {'content-type': 'application/json'},
      );

      when(mockHTTPService.postWithFile(
              uri: uri,
              userToken: accessToken,
              paths: formEntity.paths,
              fieldsNew: newFields))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(
        () => serviceApiClient.sendFormLeanProduction(
            accessToken: accessToken, formEntity: formEntity),
        throwsException,
      );
    });
  });
//getMyLeanProductions
  group('getMyLeanProductions', () {
    test('fetches MyLeanProductions successfully', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/lean_fabrication/my_proposals';
      const String dateString = '2023-12-14T10:02:01';
      final DateTime dateTime = DateTime.parse(dateString);

      final jsonData = {
        "result": {
          "offers": [
            {
              "realized": false,
              "date": '2023-12-14T10:02:01',
              "number": "000000302",
              "status": "На обработке",
              "issue": "test issue",
              "solution": "test solution",
              "expenses": "test expenses",
              "implementers": [],
              "benefit": "test benefit",
              "files": []
            },
          ]
        }
      };

      final expectedLeanProductions = MyLeanProductionsEntity(
          date: dateTime,
          number: '000000302',
          status: 'На обработке',
          issue: 'test issue',
          solution: 'test solution',
          expenses: 'test expenses',
          benefit: 'test benefit',
          implementers: [],
          files: []);

      final byteStream =
          ByteStream.fromBytes(utf8.encode(json.encode(jsonData)));
      final response = StreamedResponse(
        byteStream,
        200,
        headers: {'content-type': 'application/json'},
      );
      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act
      final leanProductions =
          await serviceApiClient.getMyLeanProductions(accessToken: accessToken);

      // Assert
      expect(leanProductions, equals([expectedLeanProductions]));
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });

    test('throws exception when fetching LeanProductions fails', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/lean_fabrication/my_proposals';
      final response = StreamedResponse(
        const Stream.empty(),
        400,
        headers: {'content-type': 'application/json'},
      );

      when(mockHTTPService.get(uri: uri, userToken: accessToken))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(
        () => serviceApiClient.getMyLeanProductions(accessToken: accessToken),
        throwsException,
      );
      verify(mockHTTPService.get(uri: uri, userToken: accessToken)).called(1);
    });
  });

  //submitBagReportForm
  group('submitBagReportForm', () {
    final bagReportEntity = MockBagReportEntity();

    test('fetches services successfully', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/report/create';
      final Map<String, String> newFields = {
        'forminfo':
            '{"title": "${bagReportEntity.title}", "description": "${bagReportEntity.description}"}'
      };
      final response = StreamedResponse(
        const Stream.empty(),
        201,
        headers: {'content-type': 'application/json'},
      );
      when(mockHTTPService.postWithFile(
              uri: uri,
              userToken: accessToken,
              paths: bagReportEntity.pathsToFiles,
              fieldsNew: newFields))
          .thenAnswer((_) async => response);

      // Act
      final isSend = await serviceApiClient.submitBagReportForm(
        accessToken: accessToken,
        bagReportEntity: bagReportEntity,
      );

      // Assert
      expect(isSend, equals(true));
    });

    test('throws exception when fetching submitBagReportForm fails', () async {
      // Arrange
      const String accessToken = 'your_access_token';
      const String uri = '$urlAdress/report/create';
      final Map<String, String> newFields = {
        'forminfo':
            '{"title": "${bagReportEntity.title}", "description": "${bagReportEntity.description}"}'
      };
      final response = StreamedResponse(
        const Stream.empty(),
        400,
        headers: {'content-type': 'application/json'},
      );

      when(mockHTTPService.postWithFile(
              uri: uri,
              userToken: accessToken,
              paths: bagReportEntity.pathsToFiles,
              fieldsNew: newFields))
          .thenAnswer((_) async => response);

      // Act & Assert
      expect(
        () => serviceApiClient.submitBagReportForm(
            accessToken: accessToken, bagReportEntity: bagReportEntity),
        throwsException,
      );
    });
  });
}
