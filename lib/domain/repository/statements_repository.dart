import 'package:hr_app_flutter/domain/entity/statements/statements.dart';

import '../api_client/statement_provider.dart';

abstract interface class IStatementsRepository {
  Future<List<StatementFieldEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
}

class StatementsRepository implements IStatementsRepository {
  StatementsRepository({
    required IStatementsProvider statementsProvider,
  }) : _statementsProvider = statementsProvider;

  final IStatementsProvider _statementsProvider;

  @override
  Future<List<StatementFieldEntity>> fetchListTypeStatements(
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
}
