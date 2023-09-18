import 'dart:convert';

import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';
import 'package:http/http.dart' as http;

abstract class ServiceProvider {
  Future<List<Service>> getServices({required String userToken});
}

class ServiceProviderImpl implements ServiceProvider {
  const ServiceProviderImpl();

  @override
  Future<List<Service>> getServices({required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.Request('GET', Uri.parse('$host:$port/auth/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Service> result = (jsonData
              as List<dynamic>) // Добавить ключ ['result'] если вотевет будет
          .map((item) => Service.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }
}
