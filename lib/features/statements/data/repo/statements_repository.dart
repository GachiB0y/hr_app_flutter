import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../model/participant/participant.dart';
import '../../model/statements/statements.dart';
import '../rest_clietns/statement_provider.dart';

abstract interface class IStatementsRepository {
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required final String accessToken,
      required final StatementFormInfoToSubmit formInfo});
  Future<List<ParticipantEntity>> findParticipant(
      {required final String accessToken, required final String name});
  Future<void> signDocumentBySmsCode(
      {required final String accessToken, required final String code});
}

class StatementsRepositoryImpl implements IStatementsRepository {
  StatementsRepositoryImpl({
    required IStatementsProvider statementsProvider,
  }) : _statementsProvider = statementsProvider;

  final IStatementsProvider _statementsProvider;

  @override
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required String accessToken}) async {
    try {
      final List<StatementFieldTypeEntity> result = await _statementsProvider
          .fetchListTypeStatements(accessToken: accessToken);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String accessToken, required final String id}) async {
    try {
      final StatementTempalteEntity result = await _statementsProvider
          .fetchStatementForm(accessToken: accessToken, id: id);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required String accessToken,
      required StatementFormInfoToSubmit formInfo}) async {
    try {
      final TypeOfAppplicationSigning result =
          await _statementsProvider.submitStatementForm(
        accessToken: accessToken,
        formInfo: formInfo,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ParticipantEntity>> findParticipant(
      {required String accessToken, required String name}) async {
    try {
      final List<ParticipantEntity> result =
          await _statementsProvider.findParticipant(
        accessToken: accessToken,
        name: name,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signDocumentBySmsCode(
      {required String accessToken, required String code}) async {
    try {
      return await _statementsProvider.signDocumentBySmsCode(
        accessToken: accessToken,
        code: code,
      );
    } catch (e) {
      rethrow;
    }
  }
}
