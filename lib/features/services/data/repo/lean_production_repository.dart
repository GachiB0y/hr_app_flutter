import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import '../../model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

abstract interface class ILeanProductionRepository {
  Future<bool> submitForm(
      {required LeanProductionFormEntity formEntity,
      required String userToken});
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String userToken});

  Future<void> downloadFileWithLeanProduction(
      {required String url, required String userToken});
}

class LeanProductionRepositoryImpl implements ILeanProductionRepository {
  LeanProductionRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

  @override
  Future<bool> submitForm(
      {required LeanProductionFormEntity formEntity,
      required String userToken}) {
    try {
      return _serviceProvider.sendFormLeanProduction(
          userToken: userToken, formEntity: formEntity);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String userToken}) {
    try {
      return _serviceProvider.getMyLeanProductions(
        userToken: userToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadFileWithLeanProduction(
      {required String url, required String userToken}) {
    try {
      return _serviceProvider.downloadFileWithLeanProduction(
        userToken: userToken,
        url: url,
      );
    } catch (e) {
      rethrow;
    }
  }
}
