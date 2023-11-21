import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_entity_test.mocks.dart';

// @GenerateNiceMocks(
//     [MockSpec<IAuthRepository>(), MockSpec<IEventEntityRepository>()])
// import 'event_entity_test.mock.dart';
// @GenerateMocks([IAuthRepository])
// @GenerateMocks([IEventEntityRepository])
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
// import 'event_entity_test.mock.dart';

class FakeEventEntity extends Fake implements EventEntity {}

final EventEntity _mockEventEntity = MockNewsEntity();

class FakeAuthRepoImpl extends Fake implements IAuthRepository {}

class FakeEventEntityRepoImpl extends Fake implements IEventEntityRepository {}

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
          authRepository: mockAuthRepository);
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

    test('Fetch event should emit successful state with data', () async {
      // Arrange

      const String accessToken = 'test_access_token';
      final List<EventEntity> listEventEntityLoaded = [_mockEventEntity];
      final List<EventEntity> filteredEventEntity = [];
      final viewModel = EventEntityViewModel(
        listEventEntityLoaded: listEventEntityLoaded,
        filteredListEventEntity: filteredEventEntity,
      );

      when(mockAuthRepository.cheskIsLiveAccessToken())
          .thenAnswer((_) => Future.value(accessToken));
      when(mockEventEntityRepository.getEvents(accessToken: accessToken))
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
        accessToken: accessToken,
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
        authRepository: mockAuthRepository,
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
}

const idleState = TypeMatcher<EventEntityState$Idle>();
const errorState = TypeMatcher<EventEntityState$Error>();
const processingState = TypeMatcher<EventEntityState$Processing>();
const successfulState = TypeMatcher<EventEntityState$Successful>();
