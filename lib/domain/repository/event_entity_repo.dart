import 'dart:io';

import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';

abstract class EventEntityRepository {
  Future<List<EventEntity>> getEvents({required String accessToken});
  Future<List<EventEntity>> getApprovmentEvents({required String accessToken});
  Future<List<Category>> getCategory({required String accessToken});
  Future<bool> createNewEventEntity({
    required String accessToken,
    required String title,
    required String description,
    required String startDate,
    required String endDate,
    required File imageFile,
    required List<String> categories,
  });
  Future<bool> approvementNews({
    required String accessToken,
    required String id,
  });
}

class EventEntityRepositoryImpl implements EventEntityRepository {
  const EventEntityRepositoryImpl({
    required EventsEntityProvider eventEntityProvider,
  }) : _eventEntityProvider = eventEntityProvider;

  final EventsEntityProvider _eventEntityProvider;

  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) async {
    return await _eventEntityProvider.getEvents(accessToken: accessToken);
  }

  @override
  Future<List<Category>> getCategory({required String accessToken}) async {
    return await _eventEntityProvider.getCategory(accessToken: accessToken);
  }

  @override
  Future<bool> createNewEventEntity(
      {required String accessToken,
      required String title,
      required String description,
      required String startDate,
      required String endDate,
      required File imageFile,
      required List<String> categories}) async {
    try {
      return await _eventEntityProvider.createNewEventEntity(
          accessToken: accessToken,
          title: title,
          description: description,
          imageFile: imageFile,
          categories: categories,
          startDate: startDate,
          endDate: endDate);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getApprovmentEvents(
      {required String accessToken}) async {
    return await _eventEntityProvider.getApprovmentEvents(
        accessToken: accessToken);
  }

  @override
  Future<bool> approvementNews(
      {required String accessToken, required String id}) async {
    try {
      return await _eventEntityProvider.approvementNews(
          accessToken: accessToken, id: id);
    } catch (e) {
      rethrow;
    }
  }
}
