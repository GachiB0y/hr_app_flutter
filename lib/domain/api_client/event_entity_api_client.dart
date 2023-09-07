import 'dart:convert';
import 'package:hr_app_flutter/constants.dart';
import 'package:http/http.dart' as http;

import 'package:hr_app_flutter/domain/entity/event_entity/event_entity.dart';

class EventEntityApiClient implements EventsEntityProvider {
  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) async {
    List<EventEntity> events = [
      EventEntity(
          base64Image: null,
          title: 'Заголовок 1',
          description: 'Новости 1',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Новости']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 2',
          description: 'Актуальное - Новости 2',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 3',
          description: 'Актуальное - Сотрудники 3',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Сотрудники']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 4',
          description: 'Актуальное - Сотрудники 4',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Сотрудники']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 5',
          description: 'Актуальное - Сотрудники - Новости 5',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости', 'Сотрудники']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 6',
          description: 'Актуальное - Сотрудники - Новости 6',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости', 'Сотрудники']),
      EventEntity(
          base64Image: null,
          title: 'Заголовок 7',
          description: 'Мероприятия - Сотрудники  7',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Мероприятия', 'Соотрудники']),
    ];
    await Future.delayed(const Duration(seconds: 1), () => "Hello Dart");
    return events;
  }
}

abstract class EventsEntityProvider {
  Future<List<EventEntity>> getEvents({required String accessToken});
}

class EventsEntitytProviderImpl implements EventsEntityProvider {
  EventsEntitytProviderImpl();

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
      final List<EventEntity> result = (jsonData['result']
              as List<dynamic>) // Добавить ключ ['result'] если вотевет будет
          .map((item) => EventEntity.fromJson(item))
          .toList();

      return result;
    } else {
      throw Exception('Error fetching Transactions');
    }
  }
}
