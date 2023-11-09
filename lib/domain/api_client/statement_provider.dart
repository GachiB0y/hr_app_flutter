import 'dart:convert';

import 'package:hr_app_flutter/domain/entity/statements/statements.dart';

import '../../constants.dart';
import 'api_client.dart';

abstract interface class IStatementsProvider {
  Future<List<StatementFieldEntity>> fetchListTypeStatements(
      {required final String accessToken});
  Future<StatementEntity> fetchStatementForm(
      {required final String accessToken, required final String id});
}

class StatementProviderImpl implements IStatementsProvider {
  final IHTTPService _httpService;
  StatementProviderImpl(this._httpService);

  @override
  Future<List<StatementFieldEntity>> fetchListTypeStatements(
      {required String accessToken}) async {
    String uri = '$urlAdress/hrlink/getTemplates';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<StatementFieldEntity> result =
          (jsonData['result'] as List<dynamic>)
              .map((item) => StatementFieldEntity.fromJson(item))
              .toList();
      return result;
    } else {
      throw Exception('Error fetching List Type Statements');
    }
  }

  @override
  Future<StatementEntity> fetchStatementForm(
      {required String accessToken, required String id}) async {
    String uri = '$urlAdress/hrlink/getTemplates?templateId=$id';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final StatementEntity result =
          StatementEntity.fromJson(jsonData['result'][0]);

      return result;
    } else {
      throw Exception('Error fetching Statement Form');
    }
  }
}
