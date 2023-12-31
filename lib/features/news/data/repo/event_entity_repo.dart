import 'dart:io';

import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';

import '../../model/event_entity/new_event_entity.dart';

abstract interface class IEventEntityRepository {
  Future<List<EventEntity>> getEvents({required String accessToken});
  Future<List<EventEntity>> getApprovmentEvents({required String accessToken});
  Future<List<Category>> getCategory({required String accessToken});
  Future<bool> createNewEventEntity({
    required String accessToken,
    required String title,
    required String description,
    required String startDate,
    required String? endDate,
    required File imageFile,
    required List<String> categories,
  });
  Future<bool> approvementNews({
    required String accessToken,
    required String id,
  });
  Future<EventEntity> getNewsById({
    required String accessToken,
    required String id,
  });
  Future<bool> moveInArchiveNews({
    required String accessToken,
    required String id,
  });
}

class EventEntityRepositoryImpl implements IEventEntityRepository {
  const EventEntityRepositoryImpl({
    required IEventsEntityProvider eventEntityProvider,
  }) : _eventEntityProvider = eventEntityProvider;

  final IEventsEntityProvider _eventEntityProvider;

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
      required String? endDate,
      required File imageFile,
      required List<String> categories}) async {
    try {
      final List<String> pathsNew = [];
      pathsNew.add(imageFile.path);
      final bool result = await _eventEntityProvider.createNewEventEntity(
          accessToken: accessToken,
          title: title,
          description: description,
          paths: pathsNew,
          categories: categories,
          startDate: startDate,
          endDate: endDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getApprovmentEvents(
      {required String accessToken}) async {
    try {
      return await _eventEntityProvider.getApprovmentEvents(
          accessToken: accessToken);
    } catch (e) {
      rethrow;
    }
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

  @override
  Future<EventEntity> getNewsById(
      {required String accessToken, required String id}) async {
    try {
      return await _eventEntityProvider.getNewsById(
          accessToken: accessToken, id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> moveInArchiveNews(
      {required String accessToken, required String id}) async {
    try {
      return await _eventEntityProvider.moveInArchiveNews(
          accessToken: accessToken, id: id);
    } catch (e) {
      rethrow;
    }
  }
}
