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
  Future<bool> approvementNews({required String id}) async {
    return true;
  }

  @override
  Future<bool> moveInArchiveNews({required String id}) async {
    return true;
  }

  @override
  Future<bool> createNewEventEntity(
      {required String title,
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
        await eventRepository.getEvents();
      } catch (_) {}
      verify(eventApiClient.getEvents()).called(1);
    });
    test('throws when getEvents fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getEvents()).thenThrow(exception);

      expect(
        () async => eventRepository.getEvents(),
        throwsA(exception),
      );
    });

    test('succesfull when getEvents get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();
//Создаем list Event
      final List<EventEntity> listEvents = [eventMock];

      when(eventApiClient.getEvents()).thenAnswer((_) async => listEvents);

      final actual = await eventRepository.getEvents();
      expect(actual, listEvents);
    });
  });

//getCategory
  group('getCategory', () {
    test('calls getCategory with correct', () async {
      try {
        await eventRepository.getCategory();
      } catch (_) {}
      verify(eventApiClient.getCategory()).called(1);
    });
    test('throws when getCategory fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getCategory()).thenThrow(exception);

      expect(
        () async => eventRepository.getCategory(),
        throwsA(exception),
      );
    });

    test('succesfull when getCategory get', () async {
//Создаем Category
      final Category eventMock = MockCategory();
//Создаем list Category
      final List<Category> listEvents = [eventMock];

      when(eventApiClient.getCategory()).thenAnswer((_) async => listEvents);

      final actual = await eventRepository.getCategory();
      expect(actual, listEvents);
    });
  });

//createNewEventEntity
  group('createNewEventEntity', () {
    final File file = MockFile();

    test('calls createNewEventEntity with correct', () async {
      try {
        await eventRepository.createNewEventEntity(
            title: '',
            description: '',
            startDate: '',
            endDate: '',
            imageFile: file,
            categories: []);
      } catch (_) {}
      verifyNever(eventApiClient.createNewEventEntity(
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
//       //
//       //     title: '',
//       //     description: '',
//       //     startDate: '',
//       //     endDate: '',
//       //     paths: [],
//       //     categories: [])).thenThrow(exception);

//       expectLater(
//         eventRepository.createNewEventEntity(
//
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
          title: '',
          description: '',
          startDate: '',
          endDate: '',
          paths: [],
          categories: [])).thenAnswer((_) async => false);

      final actual = await eventRepository.createNewEventEntity(
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
        await eventRepository.getApprovmentEvents();
      } catch (_) {}
      verify(eventApiClient.getApprovmentEvents()).called(1);
    });
    test('throws when getApprovmentEvents fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getApprovmentEvents()).thenThrow(exception);

      expect(
        () async => eventRepository.getApprovmentEvents(),
        throwsA(exception),
      );
    });

    test('succesfull when getApprovmentEvents get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();
//Создаем list Event
      final List<EventEntity> listEvents = [eventMock];

      when(eventApiClient.getApprovmentEvents())
          .thenAnswer((_) async => listEvents);

      final actual = await eventRepository.getApprovmentEvents();
      expect(actual, listEvents);
    });
  });

//getNewsById
  group('getNewsById', () {
    test('calls getNewsById with correct', () async {
      try {
        await eventRepository.getNewsById(id: '');
      } catch (_) {}
      verify(eventApiClient.getNewsById(id: '')).called(1);
    });
    test('throws when getNewsById fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getNewsById(id: '')).thenThrow(exception);

      expect(
        () async => eventRepository.getNewsById(id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when getNewsById get', () async {
//Создаем Event
      final EventEntity eventMock = MockEventEntity();

      when(eventApiClient.getNewsById(id: ''))
          .thenAnswer((_) async => eventMock);

      final actual = await eventRepository.getNewsById(id: '');
      expect(actual, eventMock);
    });
  });
  //approvementNews
  group('approvementNews', () {
    test('calls approvementNews with correct', () async {
      try {
        await eventRepository.approvementNews(id: '');
      } catch (_) {}
      verify(eventApiClient.approvementNews(id: '')).called(1);
    });
    test('throws when approvementNews fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.approvementNews(id: '')).thenThrow(exception);

      expect(
        () async => eventRepository.approvementNews(id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when approvementNews get', () async {
      when(eventApiClient.approvementNews(id: ''))
          .thenAnswer((_) async => false);

      final actual = await eventRepository.approvementNews(id: '');
      expect(actual, false);
    });
  });

//moveInArchiveNews
  group('moveInArchiveNews', () {
    test('calls moveInArchiveNews with correct', () async {
      try {
        await eventRepository.moveInArchiveNews(id: '');
      } catch (_) {}
      verify(eventApiClient.moveInArchiveNews(id: '')).called(1);
    });
    test('throws when moveInArchiveNews fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.moveInArchiveNews(id: '')).thenThrow(exception);

      expect(
        () async => eventRepository.moveInArchiveNews(id: ''),
        throwsA(exception),
      );
    });

    test('succesfull when moveInArchiveNews get', () async {
      when(eventApiClient.moveInArchiveNews(id: ''))
          .thenAnswer((_) async => false);

      final actual = await eventRepository.moveInArchiveNews(id: '');
      expect(actual, false);
    });
  });
}
