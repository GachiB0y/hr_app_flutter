import 'dart:convert';

import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/entity/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';
import 'package:http/http.dart' as http;

abstract interface class ServiceProvider {
  Future<List<Service>> getServices({required String userToken});
  Future<ScheduleBus> getScheduleBus({required String userToken});
}

class ServiceProviderImpl implements ServiceProvider {
  final IHTTPService _httpService;
  ServiceProviderImpl(this._httpService);

  @override
  Future<List<Service>> getServices({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '$urlAdress/admin/avalible_services_list')); // ЗАМЕНИТЬ НА ДРУГОЙ ЭТО ТЕСТОВЫЙ АПИ 10.3.50.98:8888

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Service> result = (jsonData['result']
              as List<dynamic>) // Добавить ключ ['result'] если вотевет будет
          .map((item) => Service.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus({required String userToken}) async {
    String uri = '$urlAdress/bus/get_destination';
    final response = await _httpService.get(uri: uri, userToken: userToken);
    if (response.statusCode == 201) {
      // TODO: change to 200
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final ScheduleBus result = ScheduleBus.fromJson(jsonData);
      return result;
    } else {
      throw Exception('Error get Schedule Bus');
    }
  }
}
