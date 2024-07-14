import 'dart:async';
import 'dart:io';

import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';

import '../../model/event_entity/new_event_entity.dart';

abstract interface class IEventEntityRepository {
  /// Поток событий при изменении данных новостей.
  Stream<EventEntityRepositoryState> get state;

  /// Геттер массива новостей ожидающих модерации.
  List<EventEntity> get approvmentEvents;

  Future<List<EventEntity>> getEvents();

  Future<void> getApprovmentEvents();

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

/// Состояние репозитория новостей [IEventEntityRepository].
class EventEntityRepositoryState {
  /// Актуальный массив новостей ожидающих модерации.
  final List<EventEntity> approvmentEvents;

  EventEntityRepositoryState({
    this.approvmentEvents = const [],
  });

  EventEntityRepositoryState copyWith({
    List<EventEntity>? approvmentEvents,
  }) {
    return EventEntityRepositoryState(
      approvmentEvents: approvmentEvents ?? this.approvmentEvents,
    );
  }
}

class EventEntityRepositoryImpl implements IEventEntityRepository {
  late EventEntityRepositoryState _state;
  late IEventsEntityProvider _eventEntityProvider;

  EventEntityRepositoryImpl({
    required IEventsEntityProvider eventEntityProvider,
  }) {
    _eventEntityProvider = eventEntityProvider;
    _state = EventEntityRepositoryState();
  }

  @override
  List<EventEntity> get approvmentEvents => _state.approvmentEvents;

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
  Future<void> getApprovmentEvents() async {
    try {
      final news = await _eventEntityProvider.getApprovmentEvents();
      _state = _state.copyWith(approvmentEvents: news);
      _update();
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

  final StreamController<EventEntityRepositoryState> _stateController =
      StreamController<EventEntityRepositoryState>.broadcast();

  @override
  Stream<EventEntityRepositoryState> get state => _stateController.stream.asBroadcastStream();

  /// Добавление события в стрим.
  void _update() {
    if (_stateController.isClosed) return;
    _stateController.add(_state);
  }
}
