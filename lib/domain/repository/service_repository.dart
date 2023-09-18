import 'package:hr_app_flutter/domain/api_client/service_api_client.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices({required String userToken});
}

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({
    required ServiceProvider ServiceProvider,
  }) : _ServiceProvider = ServiceProvider;

  final ServiceProvider _ServiceProvider;

  @override
  Future<List<Service>> getServices({required String userToken}) {
    try {
      return _ServiceProvider.getServices(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }
}
