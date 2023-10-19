import 'package:hr_app_flutter/domain/api_client/service_api_client.dart';
import 'package:hr_app_flutter/domain/entity/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices({required String userToken});
  Future<ScheduleBus> getScheduleBus({required String userToken});
}

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({
    required ServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final ServiceProvider _serviceProvider;

  @override
  Future<List<Service>> getServices({required String userToken}) {
    try {
      return _serviceProvider.getServices(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus({required String userToken}) {
    try {
      return _serviceProvider.getScheduleBus(userToken: userToken);
    } catch (e) {
      rethrow;
    }
  }
}
