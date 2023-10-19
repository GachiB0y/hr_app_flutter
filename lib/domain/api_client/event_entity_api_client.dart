import 'dart:convert';
import 'dart:io' as io;

import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
import 'package:http_parser/http_parser.dart';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:http/http.dart' as http;

abstract class EventsEntityProvider {
  Future<List<EventEntity>> getEvents({required String accessToken});
  Future<EventEntity> getNewsById({
    required String accessToken,
    required String id,
  });
  Future<List<EventEntity>> getApprovmentEvents({required String accessToken});
  Future<List<Category>> getCategory({required String accessToken});
  Future<bool> createNewEventEntity({
    required String accessToken,
    required String title,
    required String description,
    required String startDate,
    required String endDate,
    required io.File imageFile,
    required List<String> categories,
  });
  Future<bool> approvementNews({
    required String accessToken,
    required String id,
  });
  Future<bool> moveInArchiveNews({
    required String accessToken,
    required String id,
  });
}

class EventsEntityProviderImpl implements EventsEntityProvider {
  const EventsEntityProviderImpl();

  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$urlAdress/news/'));

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

    var request = http.Request('GET', Uri.parse('$urlAdress/news/categories'));

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

  @override
  Future<bool> createNewEventEntity(
      {required String accessToken,
      required String title,
      required String description,
      required String startDate,
      required String endDate,
      required io.File imageFile,
      required List<String> categories}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    };

    var request =
        http.MultipartRequest('POST', Uri.parse('$urlAdress/news/add_feed'));

    request.fields.addAll({
      'some_other_data':
          '{"title":"$title","description":"$description","start_date":"$startDate","end_date":"$endDate","categories":$categories}'
    });
    var multipartFile = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: imageFile.path.split('/').last,
      contentType: MediaType('image', 'jpg'),
    );
    request.files.add(multipartFile);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error create New EventEntity!!!');
    }
  }

  @override
  Future<List<EventEntity>> getApprovmentEvents(
      {required String accessToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var request =
        http.Request('GET', Uri.parse('$urlAdress/news/approvement_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<EventEntity> result = (jsonData['result'] as List<dynamic>)
          .map((item) => EventEntity.fromJson(item))
          .toList();
      return result;
    } else if (response.statusCode == 404) {
      throw ApiClientException(ApiClientExceptionType.notFound);
    } else {
      throw Exception('Error fetching  Approvment Events');
    }
  }

  @override
  Future<bool> approvementNews(
      {required String accessToken, required String id}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    var request = http.Request(
        'POST', Uri.parse('$urlAdress/news/approve_feed?feed_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error approvement News!!!');
    }
  }

  @override
  Future<EventEntity> getNewsById(
      {required String accessToken, required String id}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.Request('GET', Uri.parse('$urlAdress/news/find/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final EventEntity result = EventEntity.fromJson(jsonData['result']);

      return result;
    } else {
      throw Exception('Error fetching News By Id');
    }
  }

  @override
  Future<bool> moveInArchiveNews(
      {required String accessToken, required String id}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    var request = http.Request(
        'POST', Uri.parse('$urlAdress/news/move_in_archive?feed_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error move In Archive News!!!');
    }
  }
}
