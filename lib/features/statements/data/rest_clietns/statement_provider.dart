import 'dart:convert';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client.dart';

import '../../../../core/constant/constants.dart';
import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../model/participant/participant.dart';
import '../../model/statements/statements.dart';

abstract interface class IStatementsProvider {
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementTempalteEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required final String accessToken,
      required final StatementFormInfoToSubmit formInfo});
  Future<void> signDocumentBySmsCode(
      {required final String accessToken, required final String code});
  Future<List<ParticipantEntity>> findParticipant(
      {required final String accessToken, required final String name});
}

class StatementProviderImpl implements IStatementsProvider {
  final IHTTPService _httpService;
  StatementProviderImpl(this._httpService);

  @override
  Future<List<StatementFieldTypeEntity>> fetchListTypeStatements(
      {required String accessToken}) async {
    String uri = '$urlAdress/documents/document_template';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<StatementFieldTypeEntity> result = (jsonData as List<dynamic>)
          .map((item) => StatementFieldTypeEntity.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching List Type Statements');
    }
  }

  @override
  Future<StatementTempalteEntity> fetchStatementForm(
      {required String accessToken, required String id}) async {
    String uri = '$urlAdress/documents/document_template?document_type=$id';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final StatementTempalteEntity result =
          StatementTempalteEntity.fromJson(jsonData);

      return result;
    } else {
      throw Exception('Error fetching Statement Form');
    }
  }

  @override
  Future<TypeOfAppplicationSigning> submitStatementForm(
      {required String accessToken,
      required StatementFormInfoToSubmit formInfo}) async {
    String uri = '$urlAdress/documents/create_document';
    final String body = json.encode(formInfo.toJson());
    print(body);
    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: body);
    if (response.statusCode == 201) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final bool isSms = jsonData['form_sms'];
      if (isSms) {
        return TypeOfAppplicationSigning.smsCode;
      }
      return TypeOfAppplicationSigning.daefult;
    } else {
      throw Exception('Error send submit Statement Form!!!');
    }
  }

  @override
  Future<List<ParticipantEntity>> findParticipant(
      {required String accessToken, required String name}) async {
    String uri =
        '$urlAdress/documents/getEmployees?search=$name&offset=0&limit=5';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<ParticipantEntity> result =
          (jsonData['colleagues'] as List<dynamic>)
              .map((item) => ParticipantEntity.fromJson(item))
              .toList();

      return result;
    } else {
      throw Exception('Error fetching Statement Form');
    }
  }

  @override
  Future<void> signDocumentBySmsCode(
      {required String accessToken, required String code}) async {
    String uri = '$urlAdress/documents/sign_document?code=$code';

    final response = await _httpService.put(
      uri: uri,
      userToken: accessToken,
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Error send submit Statement Form!!!');
    }
  }
}
