import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';

import '../../model/bag_report_entity/bag_report_entity.dart';
import '../../model/schedule_bus_entity/schedule_bus_entity.dart';
import '../../model/service/service.dart';

abstract interface class IServiceRepository {
  ///Метод для получения списка сервисов
  Future<List<Service>> getServices();

  ///Метод для получения расписания

  Future<ScheduleBus> getScheduleBus();

  ///Метод для отправки формы Баг-репорт

  Future<bool> submitBagReportForm({required BagReportEntity bagReportEntity});
}

class ServiceRepositoryImpl implements IServiceRepository {
  ServiceRepositoryImpl({
    required IServiceProvider serviceProvider,
  }) : _serviceProvider = serviceProvider;

  final IServiceProvider _serviceProvider;

  @override
  Future<List<Service>> getServices() async {
    try {
      return await _serviceProvider.getServices();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus() async {
    try {
      return await _serviceProvider.getScheduleBus();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> submitBagReportForm(
      {required BagReportEntity bagReportEntity}) async {
    try {
      return await _serviceProvider.submitBagReportForm(
          bagReportEntity: bagReportEntity);
    } catch (e) {
      rethrow;
    }
  }
}
