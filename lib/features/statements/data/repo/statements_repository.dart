import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../model/participant/participant.dart';
import '../../model/statements/statements.dart';
import '../rest_clietns/statement_provider.dart';

abstract interface class IStatementsRepository {
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements();
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String id});
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required final StatementFormInfoToSubmit formInfo});
  Future<List<ParticipantEntity>> findParticipant({required final String name});
  Future<void> signDocumentBySmsCode({required final String code});
}

class StatementsRepositoryImpl implements IStatementsRepository {
  StatementsRepositoryImpl({
    required IStatementsProvider statementsProvider,
  }) : _statementsProvider = statementsProvider;

  final IStatementsProvider _statementsProvider;

  @override
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements() async {
    try {
      final List<StatementFieldTypeEntity> result =
          await _statementsProvider.fetchListTypeStatements();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String id}) async {
    try {
      final StatementTempalteEntity result =
          await _statementsProvider.fetchStatementForm(id: id);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required StatementFormInfoToSubmit formInfo}) async {
    try {
      final TypeOfAppplicationSigning result =
          await _statementsProvider.submitStatementForm(
        formInfo: formInfo,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ParticipantEntity>> findParticipant(
      {required String name}) async {
    try {
      final List<ParticipantEntity> result =
          await _statementsProvider.findParticipant(
        name: name,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signDocumentBySmsCode({required String code}) async {
    try {
      return await _statementsProvider.signDocumentBySmsCode(
        code: code,
      );
    } catch (e) {
      rethrow;
    }
  }
}
