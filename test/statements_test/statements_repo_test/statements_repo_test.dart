import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/statements/data/rest_clietns/statement_provider.dart';
import 'package:hr_app_flutter/features/statements/model/participant/participant.dart';
import 'package:hr_app_flutter/features/statements/model/statements/statements.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../statements_test.mocks.dart';
import 'statements_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<StatementProviderImpl>(),
    MockSpec<StatementFormInfoToSubmit>(),
  ],
)
void main() {
  group('WeatherRepository', () {
    late IStatementsProvider statementsApiClient;
    late IStatementsRepository statementsRepository;
    const String accessToken = 'test_access_token';
// Создаем два типа заявления
    const StatementFieldTypeEntity typeStatementOne =
        StatementFieldTypeEntity(documentType: 'vacation', name: 'Отпуск');

    const StatementFieldTypeEntity typeStatementTwo =
        StatementFieldTypeEntity(documentType: 'trip', name: 'Командировка');
    final List<StatementFieldTypeEntity> listTypeStatements = [
      typeStatementOne,
      typeStatementTwo
    ];
// Создаем шаблон заявления
    const TemplateField fieldFirst = TemplateField(
      name: 'field_first_name',
      value: 'Фамилия',
    );

    TemplateField fieldSecond = const TemplateField(
      name: 'field_second_name',
      value: 'Имя',
    );
    final List<TemplateField> template = [fieldFirst, fieldSecond];
    final StatementTempalteEntity statementsTemplate = StatementTempalteEntity(
        documentType: 'test_document_type',
        template: template,
        isParticipants: false);
//Создаем мок-объект заполненной формы  на отправку
    final StatementFormInfoToSubmit formInfoMock =
        MockStatementFormInfoToSubmit();
// Создаем список согласующих
    const ParticipantEntity participantFirst = ParticipantEntity(
        lastName: 'Волков',
        firstName: 'Александр',
        patronymic: 'Юрьевич',
        id: 'guid',
        position: 'Специалист');
    final List<ParticipantEntity> participants = [participantFirst];
    setUp(() {
// Создаем экземпляры мок-объектов
      statementsApiClient = MockStatementProviderImpl();
// Создаем репозиторий
      statementsRepository = StatementsRepository(
        statementsProvider: statementsApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal statements api client when not injected', () {
        expect(MockIStatementsRepository(), isNotNull);
      });
    });

//fetchListTypeStatements
    group('fetchListTypeStatements', () {
      test('calls fetchListTypeStatements with correct', () async {
        try {
          await statementsRepository.fetchListTypeStatements(
              accessToken: accessToken);
        } catch (_) {}
        verify(statementsApiClient.fetchListTypeStatements(
                accessToken: accessToken))
            .called(1);
      });
      test('throws when fetchListTypeStatements fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.fetchListTypeStatements(
                accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => statementsRepository.fetchListTypeStatements(
              accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when fetchListTypeStatements get', () async {
        when(statementsApiClient.fetchListTypeStatements(
                accessToken: accessToken))
            .thenAnswer((_) async => listTypeStatements);
        final actual = await statementsRepository.fetchListTypeStatements(
            accessToken: accessToken);
        expect(actual, listTypeStatements);
      });
    });
//fetchStatementForm
    group('fetchStatementForm', () {
      test('calls fetchStatementForm with correct', () async {
        try {
          await statementsRepository.fetchStatementForm(
              accessToken: accessToken, id: '');
        } catch (_) {}
        verify(statementsApiClient.fetchStatementForm(
                accessToken: accessToken, id: ''))
            .called(1);
      });
      test('throws when fetchStatementForm fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.fetchStatementForm(
                accessToken: accessToken, id: ''))
            .thenThrow(exception);

        expect(
          () async => statementsRepository.fetchStatementForm(
              accessToken: accessToken, id: ''),
          throwsA(exception),
        );
      });

      test('succesfull when fetchStatementForm get', () async {
        when(statementsApiClient.fetchStatementForm(
                accessToken: accessToken, id: ''))
            .thenAnswer((_) async => statementsTemplate);
        final actual = await statementsRepository.fetchStatementForm(
            accessToken: accessToken, id: '');
        expect(actual, statementsTemplate);
      });
    });

//submitStatementForm
    group('submitStatementForm', () {
      test('calls submitStatementForm with correct', () async {
        try {
          await statementsRepository.submitStatementForm(
            accessToken: accessToken,
            formInfo: formInfoMock,
          );
        } catch (_) {}
        verify(statementsApiClient.submitStatementForm(
          accessToken: accessToken,
          formInfo: formInfoMock,
        )).called(1);
      });
      test('throws when submitStatementForm fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.submitStatementForm(
          accessToken: accessToken,
          formInfo: formInfoMock,
        )).thenThrow(exception);

        expect(
          () async => statementsRepository.submitStatementForm(
            accessToken: accessToken,
            formInfo: formInfoMock,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when submitStatementForm get', () async {
        when(statementsApiClient.submitStatementForm(
          accessToken: accessToken,
          formInfo: formInfoMock,
        )).thenAnswer((_) async => TypeOfAppplicationSigning.daefult);
        final actual = await statementsRepository.submitStatementForm(
          accessToken: accessToken,
          formInfo: formInfoMock,
        );
        expect(actual, TypeOfAppplicationSigning.daefult);
      });
    });
//findParticipant
    group('findParticipant', () {
      test('calls findParticipant with correct', () async {
        try {
          await statementsRepository.findParticipant(
            accessToken: accessToken,
            name: '',
          );
        } catch (_) {}
        verify(statementsApiClient.findParticipant(
                accessToken: accessToken, name: ''))
            .called(1);
      });
      test('throws when findParticipant fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.findParticipant(
                accessToken: accessToken, name: ''))
            .thenThrow(exception);

        expect(
          () async => statementsRepository.findParticipant(
              accessToken: accessToken, name: ''),
          throwsA(exception),
        );
      });

      test('succesfull when findParticipant get', () async {
        when(statementsApiClient.findParticipant(
                accessToken: accessToken, name: ''))
            .thenAnswer((_) async => participants);
        final actual = await statementsRepository.findParticipant(
            accessToken: accessToken, name: '');
        expect(actual, participants);
      });
    });
//signDocumentBySmsCode
    group('signDocumentBySmsCode', () {
      test('calls signDocumentBySmsCode with correct', () async {
        try {
          await statementsRepository.signDocumentBySmsCode(
            accessToken: accessToken,
            code: '',
          );
        } catch (_) {}
        verify(statementsApiClient.signDocumentBySmsCode(
          accessToken: accessToken,
          code: '',
        )).called(1);
      });
      test('throws when signDocumentBySmsCode fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.signDocumentBySmsCode(
          accessToken: accessToken,
          code: '',
        )).thenThrow(exception);

        expect(
          () async => statementsRepository.signDocumentBySmsCode(
            accessToken: accessToken,
            code: '',
          ),
          throwsA(exception),
        );
      });

      test('succesfull when signDocumentBySmsCode get', () async {
        when(statementsApiClient.signDocumentBySmsCode(
          accessToken: accessToken,
          code: '',
        ));

        expect(
          () async => await statementsRepository.signDocumentBySmsCode(
            accessToken: accessToken,
            code: '',
          ),
          isA<void>(),
        );
      });
    });
  });
}
