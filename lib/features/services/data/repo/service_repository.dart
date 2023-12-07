import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../model/bag_report_entity/bag_report_entity.dart';
import '../../model/schedule_bus_entity/schedule_bus_entity.dart';
import '../../model/service/service.dart';

abstract interface class IServiceRepository {
  Future<List<Service>> getServices({required String accessToken});
  Future<ScheduleBus> getScheduleBus({required String accessToken});
  Future<bool> submitBagReportForm(
      {required String accessToken, required BagReportEntity bagReportEntity});
}

class ServiceRepositoryImpl implements IServiceRepository {
  ServiceRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

  @override
  Future<List<Service>> getServices({required String accessToken}) {
    try {
      return _serviceProvider.getServices(userToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus({required String accessToken}) {
    try {
      return _serviceProvider.getScheduleBus(userToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> submitBagReportForm(
      {required String accessToken, required BagReportEntity bagReportEntity}) {
    try {
      return _serviceProvider.submitBagReportForm(
          userToken: accessToken, bagReportEntity: bagReportEntity);
    } catch (e) {
      rethrow;
    }
  }
}
