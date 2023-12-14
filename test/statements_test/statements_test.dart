import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_type_list_bloc/statement_type_list_bloc.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/statements/model/participant/participant.dart';
import 'package:hr_app_flutter/features/statements/model/statements/statements.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'statements_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IAuthRepository>(),
    MockSpec<IStatementsRepository>(),
    MockSpec<StatementTempalteEntity>(),
  ],
)
const TemplateField fieldFirts =
    TemplateField(name: 'field_first_name', body: 'First Name', dataType: '');
const TemplateField fieldSecond =
    TemplateField(name: 'field_second_name', body: 'Last Name', dataType: '');
const statements = StatementTempalteEntity(
    documentType: 'test_document_type',
    template: [fieldFirts, fieldSecond],
    isParticipants: false);
const viewModel =
    StatementViewModel(tempalteEntity: statements, isSmsApprove: false);

const ParticipantEntity participantFirst = ParticipantEntity(
    lastName: 'Волков',
    firstName: 'Александр',
    patronymic: 'Юрьевич',
    id: 'guid',
    position: 'Специалист');
const StatementFieldTypeEntity typeFieldFirst = StatementFieldTypeEntity(
    documentType: 'annual_vaction', name: 'Application for leave');
const StatementFieldTypeEntity typeFieldSecond = StatementFieldTypeEntity(
    documentType: 'extra_vaction', name: 'Application for leave (unpaid)');

const StatementFormInfoToSubmit formInof = StatementFormInfoToSubmit(
    documentType: 'test_document_type',
    template: formInfotempalte,
    participantsTo: 'guid');

const TemplateFormStatementsEntity formInfotempalte =
    TemplateFormStatementsEntity(firstName: 'Volkov', lastName: 'Aleks');
void main() {
  group('StatementsBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IStatementsRepository mockStatementsRepository;

    // Создайте экземпляр вашего BLoC
    late StatementsBLoC statementsBloc;

    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      mockStatementsRepository = MockIStatementsRepository();

      statementsBloc = StatementsBLoC(
          authRepository: mockAuthRepository,
          repositoryStatements: mockStatementsRepository);
    });

    tearDown(() {
      statementsBloc.close();
    });

    test('initial state is  data null', () {
      expect(statementsBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(statementsBloc.state, idleState);
    });

    blocTest<StatementsBLoC, StatementsState>(
        'emits [processing, error, idle] when fetch Statement Form  Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockStatementsRepository.fetchStatementForm(
                  accessToken: accessToken, id: statements.documentType))
              .thenThrow(Exception('oops'));
        },
        build: () => StatementsBLoC(
            authRepository: mockAuthRepository,
            repositoryStatements: mockStatementsRepository),
        act: (bloc) =>
            bloc.add(StatementsEventFetch(id: statements.documentType)),
        errors: () => [isA<Exception>()]);

    blocTest<StatementsBLoC, StatementsState>(
        'emits [processing, error, idle] when Create  Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockStatementsRepository.submitStatementForm(
                  accessToken: accessToken, formInfo: formInof))
              .thenThrow(Exception('oops'));
        },
        build: () => StatementsBLoC(
            authRepository: mockAuthRepository,
            repositoryStatements: mockStatementsRepository),
        act: (bloc) =>
            bloc.add(const StatementsEventCreate(itemsForm: formInof)),
        errors: () => [isA<Exception>()]);

    blocTest<StatementsBLoC, StatementsState>(
        'emits [processing, error, idle] when Signing Document  Exception throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockStatementsRepository.signDocumentBySmsCode(
                  accessToken: accessToken, code: '2007'))
              .thenThrow(Exception('oops'));
        },
        build: () => StatementsBLoC(
            authRepository: mockAuthRepository,
            repositoryStatements: mockStatementsRepository),
        act: (bloc) =>
            bloc.add(const StatementsEventSignDocument(code: '2007')),
        errors: () => [isA<Exception>()]);

    blocTest<StatementsBLoC, StatementsState>(
      'emits StatementsState.successful when Fetch event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockStatementsRepository.fetchStatementForm(
                accessToken: accessToken, id: statements.documentType))
            .thenAnswer((_) async => statements);
      },
      build: () => statementsBloc,
      act: (bloc) =>
          bloc.add(StatementsEventFetch(id: statements.documentType)),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'data',
          viewModel,
        ),
        idleState
      ],
    );

    blocTest<StatementsBLoC, StatementsState>(
      'emits StatementsState.successful when Create event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockStatementsRepository.submitStatementForm(
                accessToken: accessToken, formInfo: formInof))
            .thenAnswer((_) async => TypeOfAppplicationSigning.daefult);
      },
      build: () => statementsBloc,
      act: (bloc) => bloc.add(const StatementsEventCreate(itemsForm: formInof)),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'data',
          null,
        ),
        idleState
      ],
    );

    blocTest<StatementsBLoC, StatementsState>(
      'emits StatementsState.successful when Signing Document event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockStatementsRepository.fetchStatementForm(
                accessToken: accessToken, id: statements.documentType))
            .thenAnswer((_) async => statements);
      },
      seed: () => const StatementsState$Idle(
          data: StatementViewModel(tempalteEntity: statements)),
      build: () => statementsBloc,
      act: (bloc) => bloc.add(const StatementsEventSignDocument(code: '2007')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'data',
          viewModel.copyWith(isSigningStatment: true),
        ),
        idleState
      ],
    );
  });

  group('StatementTypeListBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IStatementsRepository mockStatementsRepository;

    // Создайте экземпляр вашего BLoC
    late StatementTypeListBLoC statementsBloc;

    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      mockStatementsRepository = MockIStatementsRepository();

      statementsBloc = StatementTypeListBLoC(
          authRepository: mockAuthRepository,
          repositoryStatements: mockStatementsRepository);
    });

    tearDown(() {
      statementsBloc.close();
    });

    test('initial state is  data empty array', () {
      expect(statementsBloc.state.data, []);
    });

    test('Initial state should be idle', () {
      expect(statementsBloc.state, idleStateTypeList);
    });

    blocTest<StatementTypeListBLoC, StatementTypeListState>(
      'emits StatementTypeListState.successful when fetch event is added',
      setUp: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        when(mockStatementsRepository.fetchListTypeStatements(
                accessToken: accessToken))
            .thenAnswer((_) async => [typeFieldFirst, typeFieldSecond]);
      },
      build: () => statementsBloc,
      act: (bloc) => bloc.add(const FetchStatementTypeListEvent()),
      expect: () => <dynamic>[
        processingStateTypeList,
        successfulStateTypeList.having(
          (state) => state.data,
          'data',
          [typeFieldFirst, typeFieldSecond],
        ),
        idleStateTypeList
      ],
    );
  });
}

const idleState = TypeMatcher<StatementsState$Idle>();
const errorState = TypeMatcher<StatementsState$Error>();
const processingState = TypeMatcher<StatementsState$Processing>();
const successfulState = TypeMatcher<StatementsState$Successful>();
const idleStateTypeList = TypeMatcher<StatementTypeListState>();
const errorStateTypeList = TypeMatcher<StatementTypeListState$Error>();
const processingStateTypeList =
    TypeMatcher<StatementTypeListState$Processing>();
const successfulStateTypeList =
    TypeMatcher<StatementTypeListState$Successful>();
