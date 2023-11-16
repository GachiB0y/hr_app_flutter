import 'package:hr_app_flutter/domain/api_client/service_api_client.dart';
import 'package:hr_app_flutter/domain/entity/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';

import '../entity/bag_report_entity/bag_report_entity.dart';

abstract interface class IServiceRepository {
  Future<List<Service>> getServices({required String userToken});
  Future<ScheduleBus> getScheduleBus({required String userToken});
  Future<bool> submitBagReportForm(
      {required String userToken, required BagReportEntity bagReportEntity});
}

class ServiceRepositoryImpl implements IServiceRepository {
  ServiceRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

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

  @override
  Future<bool> submitBagReportForm(
      {required String userToken, required BagReportEntity bagReportEntity}) {
    try {
      return _serviceProvider.submitBagReportForm(
          userToken: userToken, bagReportEntity: bagReportEntity);
    } catch (e) {
      rethrow;
    }
  }
}
