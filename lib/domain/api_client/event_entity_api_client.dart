import 'dart:convert';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:http/http.dart' as http;

abstract class EventsEntityProvider {
  Future<List<EventEntity>> getEvents({required String accessToken});
  Future<List<Category>> getCategory({required String accessToken});
}

class EventsEntityProviderImpl implements EventsEntityProvider {
  const EventsEntityProviderImpl();

  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$host:$port/news/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<EventEntity> result = (jsonData['result'] as List<dynamic>)
          .map((item) => EventEntity.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching EventsEntity');
    }
  }

  @override
  Future<List<Category>> getCategory({required String accessToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var request = http.Request('GET', Uri.parse('$host:$port/news/categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Category> result = (jsonData['result'] as List<dynamic>)
          .map((item) => Category.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching Category');
    }
  }
}
