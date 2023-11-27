import '../../model/statements/statements.dart';
import '../rest_clietns/statement_provider.dart';

abstract interface class IStatementsRepository {
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
  Future<void> submitStatementForm(
      {required final String accessToken,
      required final StatementFormInfo formInfo});
}

class StatementsRepository implements IStatementsRepository {
  StatementsRepository({
    required IStatementsProvider statementsProvider,
  }) : _statementsProvider = statementsProvider;

  final IStatementsProvider _statementsProvider;

  @override
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required String accessToken}) {
    try {
      return _statementsProvider.fetchListTypeStatements(
          accessToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StatementEntity> fetchStatementForm(
      {required final String accessToken, required final String id}) {
    try {
      return _statementsProvider.fetchStatementForm(
          accessToken: accessToken, id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> submitStatementForm(
      {required String accessToken, required StatementFormInfo formInfo}) {
    try {
      return _statementsProvider.submitStatementForm(
        accessToken: accessToken,
        formInfo: formInfo,
      );
    } catch (e) {
      rethrow;
    }
  }
}
