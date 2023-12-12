import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../model/bag_report_entity/bag_report_entity.dart';
import '../../model/schedule_bus_entity/schedule_bus_entity.dart';
import '../../model/service/service.dart';

abstract interface class IServiceRepository {
  ///Метод для получения списка сервисов
  Future<List<Service>> getServices({required String accessToken});

  ///Метод для получения расписания

  Future<ScheduleBus> getScheduleBus({required String accessToken});

  ///Метод для отправки формы Баг-репорт

  Future<bool> submitBagReportForm(
      {required String accessToken, required BagReportEntity bagReportEntity});
}

class ServiceRepositoryImpl implements IServiceRepository {
  ServiceRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

  @override
  Future<List<Service>> getServices({required String accessToken}) async {
    try {
      return await _serviceProvider.getServices(accessToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus({required String accessToken}) async {
    try {
      return await _serviceProvider.getScheduleBus(accessToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> submitBagReportForm(
      {required String accessToken,
      required BagReportEntity bagReportEntity}) async {
    try {
      return await _serviceProvider.submitBagReportForm(
          accessToken: accessToken, bagReportEntity: bagReportEntity);
    } catch (e) {
      rethrow;
    }
  }
}
