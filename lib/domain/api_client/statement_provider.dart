import 'dart:convert';

import 'package:hr_app_flutter/domain/entity/statements/statements.dart';

import '../../constants.dart';
import 'api_client.dart';

abstract interface class IStatementsProvider {
  Future<List<StatementFielTypedEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
  Future<void> submitStatementForm(
      {required final String accessToken,
      required final StatementFormInfo formInfo});
}

class StatementProviderImpl implements IStatementsProvider {
  final IHTTPService _httpService;
  StatementProviderImpl(this._httpService);

  @override
  Future<List<StatementFielTypedEntity>> fetchListTypeStatements(
      {required String accessToken}) async {
    String uri = '$urlAdress/hrlink/document_template';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<StatementFielTypedEntity> result = (jsonData as List<dynamic>)
          .map((item) => StatementFielTypedEntity.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching List Type Statements');
    }
  }

  @override
  Future<StatementEntity> fetchStatementForm(
      {required String accessToken, required String id}) async {
    String uri = '$urlAdress/hrlink/document_template?document_type=$id';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final StatementEntity result = StatementEntity.fromJson(jsonData);

      return result;
    } else {
      throw Exception('Error fetching Statement Form');
    }
  }

  @override
  Future<void> submitStatementForm(
      {required String accessToken,
      required StatementFormInfo formInfo}) async {
    String uri = '$urlAdress/hrlink/createStatement';
    final String body = json.encode(formInfo.toJson());
    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: body);
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Error send submit Statement Form!!!');
    }
  }
}
