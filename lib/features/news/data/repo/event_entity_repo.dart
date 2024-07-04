import 'dart:async';
import 'dart:io';

import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';

import '../../model/event_entity/new_event_entity.dart';

abstract interface class IEventEntityRepository {
  /// Поток событий при изменении данных новостей.
  Stream<EventEntityRepositoryState> get state;

  /// Геттер массива новостей ожидающих модерации.
  List<EventEntity> get approvmentEvents;

  /// Геттер массива категорий новостей.
  List<Category> get categoriesNews;

  /// Геттер актуального состояния модерируемой новости.
  EventEntity? get currentNews;

  Future<List<EventEntity>> getEvents();

  Future<void> getApprovmentEvents();

  /// Получить список категорий новостей.
  Future<void> getCategory();

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

  /// Получение новости по id.
  Future<void> getNewsById({
    required String id,
  });

  /// Отправка новости в архив.
  Future<bool> moveInArchiveNews({
    required String id,
  });

  /// Изменение актуальной новости.
  void changeCurrentNews (EventEntity news);
}

/// Состояние репозитория новостей [IEventEntityRepository].
class EventEntityRepositoryState {
  /// Актуальный массив новостей ожидающих модерации.
  final List<EventEntity> approvmentEvents;

  /// Актуальный массив категорий новостей.
  final List<Category> categoriesNews;

  /// Новость.
  final EventEntity? currentNews;

  EventEntityRepositoryState({
    this.approvmentEvents = const [],
    this.categoriesNews = const [],
    this.currentNews,
  });

  EventEntityRepositoryState copyWith({
    List<EventEntity>? approvmentEvents,
    List<Category>? categoriesNews,
    EventEntity? currentNews,
  }) {
    return EventEntityRepositoryState(
      approvmentEvents: approvmentEvents ?? this.approvmentEvents,
      categoriesNews: categoriesNews ?? this.categoriesNews,
      currentNews: currentNews ?? this.currentNews,
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
  List<Category> get categoriesNews => _state.categoriesNews;

  @override
  EventEntity? get currentNews => _state.currentNews;

  @override
  Future<List<EventEntity>> getEvents() async {
    return await _eventEntityProvider.getEvents();
  }

  @override
  Future<void> getCategory() async {
    try {
      final categories = await _eventEntityProvider.getCategory();
      _state = _state.copyWith(categoriesNews: categories);
      _update();
    } catch (e) {
      rethrow;
    }
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
  Future<void> getNewsById({required String id}) async {
    try {
      final news = await _eventEntityProvider.getNewsById(id: id);
      _state = _state.copyWith(currentNews: news);
      _update();
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


  @override
  void changeCurrentNews (EventEntity news){
    _state = _state.copyWith(currentNews: news);
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
