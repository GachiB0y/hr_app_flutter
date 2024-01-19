import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';

import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../model/participant/participant.dart';
import '../../model/statements/statements.dart';

abstract interface class IStatementsProvider {
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements();
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String id});
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required final StatementFormInfoToSubmit formInfo});
  Future<void> signDocumentBySmsCode({required final String code});
  Future<List<ParticipantEntity>> findParticipant({required final String name});
}

class StatementProviderImpl implements IStatementsProvider {
  final RestClient _httpService;
  StatementProviderImpl(this._httpService);

  @override
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements() async {
    final response = await _httpService.get('/documents/document_template');

    if (response case {'result': final List<dynamic> data}) {
      final List<StatementFieldTypeEntity> result = (data)
          .map((item) => StatementFieldTypeEntity.fromJson(item))
          .toList();
      return result;
    }
    throw Exception('Error fetching List Type Statements');
  }

  @override
  Future<StatementTempalteEntity> fetchStatementForm(
      {required String id}) async {
    final response = await _httpService
        .get('/documents/document_template?document_type=$id');

    if (response case {'result': final Map<String, Object?> data}) {
      final StatementTempalteEntity result =
          StatementTempalteEntity.fromJson(data);

      return result;
    }
    throw Exception('Error fetching Statement Form');
  }

  @override
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required StatementFormInfoToSubmit formInfo}) async {
    final body = formInfo.toJson();

    final response =
        await _httpService.post('/documents/create_document', body: body);
    if (response case {'result': final Map<String, Object?> data}) {
      final bool isSms = data['form_sms'] as bool;
      if (isSms) {
        return TypeOfAppplicationSigning.smsCode;
      }
      return TypeOfAppplicationSigning.daefult;
    }
    throw Exception('Error send submit Statement Form!!!');
  }

  @override
  Future<List<ParticipantEntity>> findParticipant(
      {required String name}) async {
    final response = await _httpService.get(
      '/documents/getEmployees?search=$name&offset=0&limit=5',
    );

    if (response case {'result': final Map<String, Object?> data}) {
      final List<ParticipantEntity> result =
          (data['colleagues'] as List<dynamic>)
              .map((item) => ParticipantEntity.fromJson(item))
              .toList();

      return result;
    }
    throw Exception('Error fetching Statement Form');
  }

  @override
  Future<void> signDocumentBySmsCode({required String code}) async {
    final response =
        await _httpService.put('/documents/sign_document?code=$code', body: {});
    if (response case {'result': final data}) {
      return;
    }
    throw Exception('Error send submit Statement Form!!!');
  }
}
