import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/features/schedule_bus/model/schedule_bus_entity.dart';

abstract interface class IScheduleBusProvider {
  ///Метод для получения городов

  Future<List<City>> getCities();

  ///Метод для получения направлений

  Future<List<Destination>> getDestionations(
      {required int? cityId,
      required String? timeOfDay,
      required String? routeForJob,
      required bool all});
}

class ScheduleBusProviderImpl implements IScheduleBusProvider {
  final RestClient _httpService;
  ScheduleBusProviderImpl(this._httpService);

  @override
  Future<List<City>> getCities() async {
    final response = await _httpService.get('/bus/get_destination');

    if (response case {'result': final data}) {
      final List<City> result =
          (data as List<dynamic>).map((item) => City.fromJson(item)).toList();

      return result;
    }
    throw Exception('Error fetching get City');
  }

  @override
  Future<List<Destination>> getDestionations(
      {required int? cityId,
      required String? timeOfDay,
      required String? routeForJob,
      required bool all}) async {
    final response = await _httpService.get(
      '/bus/get_destination',
      queryParams: all
          ? {'all': 'true'}
          : {
              'city_id': '$cityId',
              'times_of_day': timeOfDay,
              'route': routeForJob
            },
    );

    if (response case {'result': final data}) {
      final List<Destination> result = (data as List<dynamic>)
          .map((item) => Destination.fromJson(item))
          .toList();

      return result;
    }
    throw Exception('Error fetching get Destination');
  }
}
