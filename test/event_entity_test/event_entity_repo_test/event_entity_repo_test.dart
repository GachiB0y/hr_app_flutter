import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../user_test/user_bloc_test.dart/user_test.mocks.dart';
import 'event_entity_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IEventsEntityProvider>(),
    MockSpec<EventEntity>(),
    MockSpec<Category>(),
  ],
)
class FakeIEventsEntityProvider extends Fake implements IEventsEntityProvider {
  @override
  Future<bool> approvementNews(
      {required String accessToken, required String id}) async {
    return true;
  }

  @override
  Future<bool> moveInArchiveNews(
      {required String accessToken, required String id}) async {
    return true;
  }

  @override
  Future<bool> createNewEventEntity(
      {required String accessToken,
      required String title,
      required String description,
      required String startDate,
      required String? endDate,
      required List<String> paths,
      required List<String> categories}) async {
    throw Exception('oops');
  }
}

void main() {
  late IEventsEntityProvider eventApiClient;
  late IEventEntityRepository eventRepository;
  const String accessToken = 'test_access_token';

  setUp(() {
// Создаем экземпляры мок-объектов
    eventApiClient = MockIEventsEntityProvider();
// Создаем репозиторий
    eventRepository = EventEntityRepositoryImpl(
      eventEntityProvider: eventApiClient,
    );
  });

  group('constructor', () {
    test('instantiates internal statements api client when not injected', () {
      expect(eventRepository, isNotNull);
    });
  });
//getEvents
  group('getEvents', () {
    test('calls getEvents with correct', () async {
      try {
        await eventRepository.getEvents(accessToken: accessToken);
      } catch (_) {}
      verify(eventApiClient.getEvents(accessToken: accessToken)).called(1);
    });
    test('throws when getEvents fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getEvents(accessToken: accessToken))
          .thenThrow(exception);

      expect(
        () async => eventRepository.getEvents(accessToken: accessToken),
        throwsA(exception),
      );
    });

    test('succesfull when getEvents get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();
//Создаем list Event
      final List<EventEntity> listEvents = [eventMock];

      when(eventApiClient.getEvents(accessToken: accessToken))
          .thenAnswer((_) async => listEvents);

      final actual = await eventRepository.getEvents(accessToken: accessToken);
      expect(actual, listEvents);
    });
  });

//getCategory
  group('getCategory', () {
    test('calls getCategory with correct', () async {
      try {
        await eventRepository.getCategory(accessToken: accessToken);
      } catch (_) {}
      verify(eventApiClient.getCategory(accessToken: accessToken)).called(1);
    });
    test('throws when getCategory fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getCategory(accessToken: accessToken))
          .thenThrow(exception);

      expect(
        () async => eventRepository.getCategory(accessToken: accessToken),
        throwsA(exception),
      );
    });

    test('succesfull when getCategory get', () async {
//Создаем Category
      final Category eventMock = MockCategory();
//Создаем list Category
      final List<Category> listEvents = [eventMock];

      when(eventApiClient.getCategory(accessToken: accessToken))
          .thenAnswer((_) async => listEvents);

      final actual =
          await eventRepository.getCategory(accessToken: accessToken);
      expect(actual, listEvents);
    });
  });

//createNewEventEntity
  group('createNewEventEntity', () {
    final File file = MockFile();

    test('calls createNewEventEntity with correct', () async {
      try {
        await eventRepository.createNewEventEntity(
            accessToken: accessToken,
            title: '',
            description: '',
            startDate: '',
            endDate: '',
            imageFile: file,
            categories: []);
      } catch (_) {}
      verifyNever(eventApiClient.createNewEventEntity(
          accessToken: accessToken,
          title: '',
          description: '',
          startDate: '',
          endDate: '',
          categories: [],
          paths: [])).called(0);
    });
//     test('throws when createNewEventEntity fails', () async {
//       final exception = Exception('oops');
// // Создаем экземпляры мок-объектов
//       final eventApiClient = FakeIEventsEntityProvider();
// // Создаем репозиторий
//       final eventRepository = EventEntityRepositoryImpl(
//         eventEntityProvider: eventApiClient,
//       );
//       // when(eventApiClient.createNewEventEntity(
//       //     accessToken: accessToken,
//       //     title: '',
//       //     description: '',
//       //     startDate: '',
//       //     endDate: '',
//       //     paths: [],
//       //     categories: [])).thenThrow(exception);

//       expectLater(
//         eventRepository.createNewEventEntity(
//             accessToken: accessToken,
//             title: '',
//             description: '',
//             startDate: '',
//             endDate: '',
//             imageFile: file,
//             categories: []),
//         throwsA(exception),
//       );
//     });

    test('succesfull when createNewEventEntity get', () async {
      when(eventApiClient.createNewEventEntity(
          accessToken: accessToken,
          title: '',
          description: '',
          startDate: '',
          endDate: '',
          paths: [],
          categories: [])).thenAnswer((_) async => false);

      final actual = await eventRepository.createNewEventEntity(
          accessToken: accessToken,
          title: '',
          description: '',
          startDate: '',
          endDate: '',
          imageFile: file,
          categories: []);
      expect(actual, false);
    });
  });

//getApprovmentEvents
  group('getApprovmentEvents', () {
    test('calls getApprovmentEvents with correct', () async {
      try {
        await eventRepository.getApprovmentEvents(accessToken: accessToken);
      } catch (_) {}
      verify(eventApiClient.getApprovmentEvents(accessToken: accessToken))
          .called(1);
    });
    test('throws when getApprovmentEvents fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getApprovmentEvents(accessToken: accessToken))
          .thenThrow(exception);

      expect(
        () async =>
            eventRepository.getApprovmentEvents(accessToken: accessToken),
        throwsA(exception),
      );
    });

    test('succesfull when getApprovmentEvents get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();
//Создаем list Event
      final List<EventEntity> listEvents = [eventMock];

      when(eventApiClient.getApprovmentEvents(accessToken: accessToken))
          .thenAnswer((_) async => listEvents);

      final actual =
          await eventRepository.getApprovmentEvents(accessToken: accessToken);
      expect(actual, listEvents);
    });
  });

//getNewsById
  group('getNewsById', () {
    test('calls getNewsById with correct', () async {
      try {
        await eventRepository.getNewsById(accessToken: accessToken, id: '');
      } catch (_) {}
      verify(eventApiClient.getNewsById(accessToken: accessToken, id: ''))
          .called(1);
    });
    test('throws when getNewsById fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getNewsById(accessToken: accessToken, id: ''))
          .thenThrow(exception);

      expect(
        () async =>
            eventRepository.getNewsById(accessToken: accessToken, id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when getNewsById get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();

      when(eventApiClient.getNewsById(accessToken: accessToken, id: ''))
          .thenAnswer((_) async => eventMock);

      final actual =
          await eventRepository.getNewsById(accessToken: accessToken, id: '');
      expect(actual, eventMock);
    });
  });
  //approvementNews
  group('approvementNews', () {
    test('calls approvementNews with correct', () async {
      try {
        await eventRepository.approvementNews(accessToken: accessToken, id: '');
      } catch (_) {}
      verify(eventApiClient.approvementNews(accessToken: accessToken, id: ''))
          .called(1);
    });
    test('throws when approvementNews fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.approvementNews(accessToken: accessToken, id: ''))
          .thenThrow(exception);

      expect(
        () async =>
            eventRepository.approvementNews(accessToken: accessToken, id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when approvementNews get', () async {
      when(eventApiClient.approvementNews(accessToken: accessToken, id: ''))
          .thenAnswer((_) async => false);

      final actual = await eventRepository.approvementNews(
          accessToken: accessToken, id: '');
      expect(actual, false);
    });
  });

//moveInArchiveNews
  group('moveInArchiveNews', () {
    test('calls moveInArchiveNews with correct', () async {
      try {
        await eventRepository.moveInArchiveNews(
            accessToken: accessToken, id: '');
      } catch (_) {}
      verify(eventApiClient.moveInArchiveNews(accessToken: accessToken, id: ''))
          .called(1);
    });
    test('throws when moveInArchiveNews fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.moveInArchiveNews(accessToken: accessToken, id: ''))
          .thenThrow(exception);

      expect(
        () async =>
            eventRepository.moveInArchiveNews(accessToken: accessToken, id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when moveInArchiveNews get', () async {
      when(eventApiClient.moveInArchiveNews(accessToken: accessToken, id: ''))
          .thenAnswer((_) async => false);

      final actual = await eventRepository.moveInArchiveNews(
          accessToken: accessToken, id: '');
      expect(actual, false);
    });
  });
}
