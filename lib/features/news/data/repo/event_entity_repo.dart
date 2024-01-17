import 'dart:io';

import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';

import '../../model/event_entity/new_event_entity.dart';

abstract interface class IEventEntityRepository {
  Future<List<EventEntity>> getEvents();
  Future<List<EventEntity>> getApprovmentEvents();
  Future<List<Category>> getCategory();
  Future<bool> createNewEventEntity({
    required String title,
    required String description,
    required String startDate,
    required String? endDate,
    required File imageFile,
    required List<String> categories,
  });
  Future<bool> approvementNews({
    required String id,
  });
  Future<EventEntity> getNewsById({
    required String id,
  });
  Future<bool> moveInArchiveNews({
    required String id,
  });
}

class EventEntityRepositoryImpl implements IEventEntityRepository {
  const EventEntityRepositoryImpl({
    required IEventsEntityProvider eventEntityProvider,
  }) : _eventEntityProvider = eventEntityProvider;

  final IEventsEntityProvider _eventEntityProvider;

  @override
  Future<List<EventEntity>> getEvents() async {
    return await _eventEntityProvider.getEvents();
  }

  @override
  Future<List<Category>> getCategory() async {
    return await _eventEntityProvider.getCategory();
  }

  @override
  Future<bool> createNewEventEntity(
      {required String title,
      required String description,
      required String startDate,
      required String? endDate,
      required File imageFile,
      required List<String> categories}) async {
    try {
      final List<String> pathsNew = [];
      pathsNew.add(imageFile.path);
      final bool result = await _eventEntityProvider.createNewEventEntity(
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
  Future<List<EventEntity>> getApprovmentEvents() async {
    try {
      return await _eventEntityProvider.getApprovmentEvents();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> approvementNews({required String id}) async {
    try {
      return await _eventEntityProvider.approvementNews(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EventEntity> getNewsById({required String id}) async {
    try {
      return await _eventEntityProvider.getNewsById(id: id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> moveInArchiveNews({required String id}) async {
    try {
      return await _eventEntityProvider.moveInArchiveNews(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
