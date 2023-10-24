import 'dart:convert';
import 'dart:io' as io;

import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';

import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';

abstract interface class EventsEntityProvider {
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
  final IHTTPService _httpService;
  const EventsEntityProviderImpl(this._httpService);

  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) async {
    String uri = '$urlAdress/news/';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

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
    String uri = '$urlAdress/news/categories';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

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
    String uri = '$urlAdress/news/add_feed';

    final fields = {
      'some_other_data':
          '{"title":"$title","description":"$description","start_date":"$startDate","end_date":"$endDate","categories":$categories}'
    };
    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: accessToken,
      imageFile: imageFile,
      fields: fields,
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error create New EventEntity!!!');
    }
  }

  @override
  Future<List<EventEntity>> getApprovmentEvents(
      {required String accessToken}) async {
    String uri = '$urlAdress/news/approvement_list';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

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
    String uri = '$urlAdress/news/approve_feed?feed_id=$id';

    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: null);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error approvement News!!!');
    }
  }

  @override
  Future<EventEntity> getNewsById(
      {required String accessToken, required String id}) async {
    String uri = '$urlAdress/news/find/$id';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

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
    String uri = '$urlAdress/news/move_in_archive?feed_id=$id';

    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: null);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Error move In Archive News!!!');
    }
  }
}
