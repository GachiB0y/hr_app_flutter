import 'package:hr_app_flutter/domain/api_client/service_api_client.dart';
import 'package:hr_app_flutter/domain/entity/lean_production_form_entity/lean_production_form_entity.dart';

abstract class LeanProductionRepository {
  Future<bool> submitForm(
      {required LeanProductionFormEntity formEntity,
      required String userToken});
}

class LeanProductionRepositoryImpl implements LeanProductionRepository {
  LeanProductionRepositoryImpl({
    required ServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final ServiceProvider _serviceProvider;

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
}
