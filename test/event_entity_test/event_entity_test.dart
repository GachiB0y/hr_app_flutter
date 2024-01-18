import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_entity_test.mocks.dart';

@GenerateMocks([
  IAuthRepository,
  IEventEntityRepository,
  EventEntity,
  Category,
], customMocks: [
  MockSpec<IAuthRepository>(
    as: #MockAuthRepo,
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<IEventEntityRepository>(
    as: #MockEventEntityRepo,
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<EventEntity>(
    as: #MockNewsEntity,
    onMissingStub: OnMissingStub.returnDefault,
  ),
])
class FakeEventEntity extends Fake implements EventEntity {}

final EventEntity _mockEventEntity = MockNewsEntity();

class FakeAuthRepoImpl extends Fake implements IAuthRepository {}

class FakeEventEntityRepoImpl extends Fake implements IEventEntityRepository {}

const String accessToken = 'test_access_token';

void main() {
  group('EventEntity Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IEventEntityRepository mockEventEntityRepository;

    // Создайте экземпляр вашего BLoC
    late EventEntityBloc eventEntityBloc;

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockAuthRepo();
      mockEventEntityRepository = MockEventEntityRepo();
      eventEntityBloc = EventEntityBloc(
        eventEntityRepository: mockEventEntityRepository,
      );
    });
    tearDown(() {
      eventEntityBloc.close();
    });

    test('initial state is  data null', () {
      expect(eventEntityBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(eventEntityBloc.state, idleState);
    });

    blocTest<EventEntityBloc, EventEntityState>(
        'emits [processing, error, idle] when getEvents  Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockEventEntityRepository.getEvents())
              .thenThrow(Exception('oops'));
        },
        build: () =>
            EventEntityBloc(eventEntityRepository: mockEventEntityRepository),
        act: (bloc) => bloc.add(const EventEntityEventFetch()),
        errors: () => [isA<Exception>()]);
    blocTest<EventEntityBloc, EventEntityState>(
        'emits [processing, error, idle] when getEvents  TimeOutException throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockEventEntityRepository.getEvents())
              .thenThrow(TimeoutException('oops'));
        },
        build: () =>
            EventEntityBloc(eventEntityRepository: mockEventEntityRepository),
        act: (bloc) => bloc.add(const EventEntityEventFetch()),
        errors: () => [isA<TimeoutException>()]);

    test('Fetch event should emit successful state with data', () async {
      // Arrange

      final List<EventEntity> listEventEntityLoaded = [_mockEventEntity];
      final List<EventEntity> filteredEventEntity = [];
      final viewModel = EventEntityViewModel(
        listEventEntityLoaded: listEventEntityLoaded,
        filteredListEventEntity: filteredEventEntity,
      );

      when(mockAuthRepository.cheskIsLiveAccessToken())
          .thenAnswer((_) => Future.value(accessToken));
      when(mockEventEntityRepository.getEvents())
          .thenAnswer((_) => Future.value(listEventEntityLoaded));

      // Act
      eventEntityBloc.add(const EventEntityEventFetch());

      // Assert
      await expectLater(
        eventEntityBloc.stream,
        emitsInOrder([
          processingState,
          successfulState.having(
            (state) => state.data,
            'data',
            viewModel,
          ),
          idleState,
        ]),
      );
    });

    test('Create event should emit successful state', () async {
      // Arrange
      const accessToken = 'test_access_token';
      const title = 'Test Title';
      const description = 'Test Description';
      final imageFile = File('test_image.jpg');
      final categories = ['category 1', 'category 2'];
      final String startDate = DateTime.now().toString();
      final String endDate = DateTime.now().toString();

      when(mockAuthRepository.cheskIsLiveAccessToken())
          .thenAnswer((_) => Future.value(accessToken));
      when(mockEventEntityRepository.createNewEventEntity(
        title: title,
        description: description,
        imageFile: imageFile,
        categories: categories,
        startDate: startDate,
        endDate: endDate,
      )).thenAnswer((_) => Future.value(true));

      // Act
      eventEntityBloc.add(EventEntityEventCreate(
        title: title,
        description: description,
        imageFile: imageFile,
        categories: categories,
        startDate: startDate,
        endDate: endDate,
      ));

      // Assert
      await expectLater(
        eventEntityBloc.stream,
        emitsInOrder([
          processingState,
          successfulState,
          idleState,
        ]),
      );
    });

    test('Update event should emit successful state with updated data',
        () async {
      // Arrange
      const idTab = 1;
      final listEventEntityLoaded = [
        _mockEventEntity,
        _mockEventEntity,
        _mockEventEntity
      ];
      final filteredEventEntity = [];

      final initialState = EventEntityState$Successful(
        data: EventEntityViewModel(
          listEventEntityLoaded: listEventEntityLoaded,
          filteredListEventEntity: [],
        ),
      );

      eventEntityBloc = EventEntityBloc(
        eventEntityRepository: mockEventEntityRepository,
        initialState: initialState,
      );

      // Act
      eventEntityBloc.add(EventEntityEventUpdate(
        idTab: idTab,
        listEventEntityLoaded: listEventEntityLoaded,
      ));

      // Assert
      await expectLater(
        eventEntityBloc.stream,
        emitsInOrder([
          successfulState.having(
            (state) => state.data?.filteredListEventEntity,
            'filteredListEventEntity',
            filteredEventEntity,
          ),
          idleState,
        ]),
      );
    });
  });

  group('EventEntity', () {
    group('fromJson', () {
      final dateNow = DateTime.now();
      test('returns correct EventEntity object', () {
        expect(
            EventEntity.fromJson(
              <String, dynamic>{
                'id': 22,
                'title': 'Sample Event',
                'description': 'This is a sample event',
                'image': 'sample_image.jpg',
                'start_date': dateNow.toString(),
                'end_date': dateNow.add(const Duration(days: 1)).toString(),
                'created_at': dateNow.toString(),
                'updated_at': dateNow.toString(),
                'is_publish': true,
                'is_archived': false,
                'categories': [
                  {
                    'id': 1,
                    'name': 'Category 1',
                  },
                  {
                    'id': 2,
                    'name': 'Category 2',
                  }
                ],
                'writer': {
                  'user_id': 8900,
                  'name_i': 'Aleks',
                  'name': 'Volkov',
                  'name_o': 'Yrich',
                }
              },
            ),
            isA<EventEntity>()
                .having((eventEntity) => eventEntity.id, 'id', 22)
                .having(
                    (eventEntity) => eventEntity.title, 'title', 'Sample Event')
                .having((eventEntity) => eventEntity.description, 'description',
                    'This is a sample event')
                .having((eventEntity) => eventEntity.image, 'image',
                    'sample_image.jpg')
                .having(
                  (eventEntity) => eventEntity.startDate,
                  'startDate',
                  dateNow,
                )
                .having((eventEntity) => eventEntity.endDate, 'endDate',
                    dateNow.add(const Duration(days: 1)))
                .having(
                  (eventEntity) => eventEntity.createdAt,
                  'createdAt',
                  dateNow,
                )
                .having(
                  (eventEntity) => eventEntity.updatedAt,
                  'updatedAt',
                  dateNow,
                )
                .having(
                  (eventEntity) => eventEntity.isPublish,
                  'isPublish',
                  true,
                )
                .having(
                  (eventEntity) => eventEntity.isArchived,
                  'isArchived',
                  false,
                )
                .having(
              (eventEntity) => eventEntity.categories,
              'categories',
              [
                const Category(name: 'Category 1', id: 1),
                const Category(name: 'Category 2', id: 2)
              ],
            ).having(
              (w) => w.writer,
              'writer',
              const Writer(
                  id: 8900,
                  firstName: 'Aleks',
                  middleName: 'Volkov',
                  lastName: 'Yrich'),
            ));
      });
    });
  });
}

const idleState = TypeMatcher<EventEntityState$Idle>();
const errorState = TypeMatcher<EventEntityState$Error>();
const processingState = TypeMatcher<EventEntityState$Processing>();
const successfulState = TypeMatcher<EventEntityState$Successful>();
