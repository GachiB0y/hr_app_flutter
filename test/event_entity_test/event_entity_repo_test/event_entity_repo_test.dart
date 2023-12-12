import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
  [
    MockSpec<IEventsEntityProvider>(),
  ],
)
void main() {
  late IEventsEntityProvider eventApiClient;
  late IEventEntityRepository eventRepository;
  const String accessToken = 'test_access_token';

  setUp(() {
// Создаем экземпляры мок-объектов
    eventApiClient = MockIev();
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
//getUserInfo
  group('getUserInfo', () {
    test('calls getUserInfo with correct', () async {
      try {
        await eventRepository.getUserInfo(accessToken: accessToken);
      } catch (_) {}
      verify(eventApiClient.getUserInfo(accessToken: accessToken)).called(1);
    });
    test('throws when getUserInfo fails', () async {
      final exception = Exception('oops');

      when(eventApiClient.getUserInfo(accessToken: accessToken))
          .thenThrow(exception);

      expect(
        () async => eventRepository.getUserInfo(accessToken: accessToken),
        throwsA(exception),
      );
    });

    test('succesfull when getUserInfo get', () async {
//Создаем User
      final User userMock = MockUser();

      when(eventApiClient.getUserInfo(accessToken: accessToken))
          .thenAnswer((_) async => userMock);

      final actual =
          await eventRepository.getUserInfo(accessToken: accessToken);
      expect(actual, userMock);
    });
  });
}
