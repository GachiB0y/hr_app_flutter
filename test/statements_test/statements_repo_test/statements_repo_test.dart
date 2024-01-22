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
  group('StatementsRepository', () {
    late IStatementsProvider statementsApiClient;
    late IStatementsRepository statementsRepository;
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
      body: 'Фамилия',
      dataType: '',
    );

    TemplateField fieldSecond = const TemplateField(
      name: 'field_second_name',
      body: 'Имя',
      dataType: '',
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
      statementsRepository = StatementsRepositoryImpl(
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
          await statementsRepository.fetchListTypeStatements();
        } catch (_) {}
        verify(statementsApiClient.fetchListTypeStatements()).called(1);
      });
      test('throws when fetchListTypeStatements fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.fetchListTypeStatements())
            .thenThrow(exception);

        expect(
          () async => statementsRepository.fetchListTypeStatements(),
          throwsA(exception),
        );
      });

      test('succesfull when fetchListTypeStatements get', () async {
        when(statementsApiClient.fetchListTypeStatements())
            .thenAnswer((_) async => listTypeStatements);
        final actual = await statementsRepository.fetchListTypeStatements();
        expect(actual, listTypeStatements);
      });
    });
//fetchStatementForm
    group('fetchStatementForm', () {
      test('calls fetchStatementForm with correct', () async {
        try {
          await statementsRepository.fetchStatementForm(id: '');
        } catch (_) {}
        verify(statementsApiClient.fetchStatementForm(id: '')).called(1);
      });
      test('throws when fetchStatementForm fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.fetchStatementForm(id: ''))
            .thenThrow(exception);

        expect(
          () async => statementsRepository.fetchStatementForm(id: ''),
          throwsA(exception),
        );
      });

      test('succesfull when fetchStatementForm get', () async {
        when(statementsApiClient.fetchStatementForm(id: ''))
            .thenAnswer((_) async => statementsTemplate);
        final actual = await statementsRepository.fetchStatementForm(id: '');
        expect(actual, statementsTemplate);
      });
    });

//submitStatementForm
    group('submitStatementForm', () {
      test('calls submitStatementForm with correct', () async {
        try {
          await statementsRepository.submitStatementForm(
            formInfo: formInfoMock,
          );
        } catch (_) {}
        verify(statementsApiClient.submitStatementForm(
          formInfo: formInfoMock,
        )).called(1);
      });
      test('throws when submitStatementForm fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.submitStatementForm(
          formInfo: formInfoMock,
        )).thenThrow(exception);

        expect(
          () async => statementsRepository.submitStatementForm(
            formInfo: formInfoMock,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when submitStatementForm get', () async {
        when(statementsApiClient.submitStatementForm(
          formInfo: formInfoMock,
        )).thenAnswer((_) async => TypeOfAppplicationSigning.daefult);
        final actual = await statementsRepository.submitStatementForm(
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
            name: '',
          );
        } catch (_) {}
        verify(statementsApiClient.findParticipant(name: '')).called(1);
      });
      test('throws when findParticipant fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.findParticipant(name: ''))
            .thenThrow(exception);

        expect(
          () async => statementsRepository.findParticipant(name: ''),
          throwsA(exception),
        );
      });

      test('succesfull when findParticipant get', () async {
        when(statementsApiClient.findParticipant(name: ''))
            .thenAnswer((_) async => participants);
        final actual = await statementsRepository.findParticipant(name: '');
        expect(actual, participants);
      });
    });
//signDocumentBySmsCode
    group('signDocumentBySmsCode', () {
      test('calls signDocumentBySmsCode with correct', () async {
        try {
          await statementsRepository.signDocumentBySmsCode(
            code: '',
          );
        } catch (_) {}
        verify(statementsApiClient.signDocumentBySmsCode(
          code: '',
        )).called(1);
      });
      test('throws when signDocumentBySmsCode fails', () async {
        final exception = Exception('oops');

        when(statementsApiClient.signDocumentBySmsCode(
          code: '',
        )).thenThrow(exception);

        expect(
          () async => statementsRepository.signDocumentBySmsCode(
            code: '',
          ),
          throwsA(exception),
        );
      });

      test('succesfull when signDocumentBySmsCode get', () async {
        when(statementsApiClient.signDocumentBySmsCode(
          code: '',
        ));

        expect(
          () async => await statementsRepository.signDocumentBySmsCode(
            code: '',
          ),
          isA<void>(),
        );
      });
    });
  });
}
