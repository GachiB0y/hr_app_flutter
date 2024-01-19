import 'package:hr_app_flutter/features/statements/bloc/participants_bloc/participants_bloc.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/statements/model/participant/participant.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../statements_test/statements_test.mocks.dart';

void main() {
  group('participantsBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IStatementsRepository statementRepository;

    // Создайте экземпляр вашего BLoC
    late ParticipantsBLoC participantBloc;
    //Создаем парочку согласующих
    const participantsFirst = ParticipantEntity(
        firstName: 'Volkov',
        lastName: 'Alexx',
        patronymic: 'Yrich',
        id: '8900',
        position: 'Software Enginer');

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      statementRepository = MockIStatementsRepository();

      participantBloc = ParticipantsBLoC(
        repositoryStatements: statementRepository,
      );
    });

    tearDown(() {
      participantBloc.close();
    });

    test('initial state is  data null', () {
      expect(participantBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(participantBloc.state, idleState);
    });

    blocTest<ParticipantsBLoC, ParticipantsState>(
        'emits [processing, error, idle] when fetch participants Exception throws',
        setUp: () {
          when(statementRepository.findParticipant(name: 'Test Name'))
              .thenThrow(Exception('oops'));
        },
        build: () =>
            ParticipantsBLoC(repositoryStatements: statementRepository),
        act: (bloc) =>
            bloc.add(const FetchParticipantsEvent(inputValue: 'Test Name')),
        errors: () => [isA<Exception>()]);

    blocTest<ParticipantsBLoC, ParticipantsState>(
      'emits ParticipantsState.successful when Fetch participants event is added',
      setUp: () {
        when(statementRepository.findParticipant(name: 'Volkov'))
            .thenAnswer((_) async => [participantsFirst]);
      },
      build: () => participantBloc,
      act: (bloc) =>
          bloc.add(const FetchParticipantsEvent(inputValue: 'Volkov')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'participants',
          [participantsFirst],
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<ParticipantsState$Idle>();
const errorState = TypeMatcher<ParticipantsState$Error>();
const processingState = TypeMatcher<ParticipantsState$Processing>();
const successfulState = TypeMatcher<ParticipantsState$Successful>();
