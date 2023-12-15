import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import '../../model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

abstract interface class ILeanProductionRepository {
  Future<bool> submitForm(
      {required LeanProductionFormEntity formEntity,
      required String accessToken});
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String accessToken});

  Future<void> downloadFileWithLeanProduction(
      {required String url, required String accessToken});
}

class LeanProductionRepositoryImpl implements ILeanProductionRepository {
  LeanProductionRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

  @override
  Future<bool> submitForm(
      {required LeanProductionFormEntity formEntity,
      required String accessToken}) async {
    try {
      return await _serviceProvider.sendFormLeanProduction(
          accessToken: accessToken, formEntity: formEntity);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String accessToken}) async {
    try {
      return await _serviceProvider.getMyLeanProductions(
        accessToken: accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadFileWithLeanProduction(
      {required String url, required String accessToken}) async {
    try {
      return await _serviceProvider.downloadFileWithLeanProduction(
        accessToken: accessToken,
        url: url,
      );
    } catch (e) {
      rethrow;
    }
  }
}
