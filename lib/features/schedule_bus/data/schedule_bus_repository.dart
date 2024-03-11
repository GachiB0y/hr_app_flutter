import 'package:hr_app_flutter/features/schedule_bus/data/schedule_bus_api_client.dart';
import 'package:hr_app_flutter/features/schedule_bus/model/schedule_bus_entity.dart';

abstract interface class IScheduleBusRepository {
  ///Метод для получения городов

  Future<List<City>> getCities();

  ///Метод для получения направлений

  Future<List<Destination>> getDestionations(
      {required int? cityId,
      required String? timeOfDay,
      required String? routeForJob,
      required bool all});
}

class ScheduleBusRepositoryImpl implements IScheduleBusRepository {
  ScheduleBusRepositoryImpl({
    required IScheduleBusProvider scheduleBusProvider,
  }) : _scheduleBusProvider = scheduleBusProvider;

  final IScheduleBusProvider _scheduleBusProvider;

  @override
  Future<List<City>> getCities() async => _scheduleBusProvider.getCities();

  @override
  Future<List<Destination>> getDestionations(
          {required int? cityId,
          required String? timeOfDay,
          required String? routeForJob,
          required bool all}) async =>
      _scheduleBusProvider.getDestionations(
          cityId: cityId,
          timeOfDay: timeOfDay,
          routeForJob: routeForJob,
          all: all);
}
