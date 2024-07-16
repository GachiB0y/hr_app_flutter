import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class ListModerationNewsState {
  final List<EventEntity> moderationNews;

  /// Получение длинны списка новостей ожидающих публикации.
  String get counterWaitingAction => moderationNews.length.toString();
  final String? counterPublished;

  ListModerationNewsState({
    required this.moderationNews,
    this.counterPublished,
  });

  ListModerationNewsState copyWith({
    List<EventEntity>? moderationNews,
    String? counterPublished,
  }) {
    return ListModerationNewsState(
      moderationNews: moderationNews ?? this.moderationNews,
      counterPublished: counterPublished ?? this.counterPublished,
    );
  }
}

class ListModerationNewsCubit extends Cubit<ListModerationNewsState> {
  late IEventEntityRepository _eventEntityRepository;

  ListModerationNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          ListModerationNewsState(
            moderationNews: [],
            counterPublished: '0',
          ),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
    eventEntityRepository.state.listen((event) {
      _subscribeNews(event);
    });
  }

  /// Прослушивание изменений [EventEntityRepository].
  void _subscribeNews(EventEntityRepositoryState stateRepository) {
    final newState = state.copyWith(
      moderationNews: stateRepository.approvmentEvents,
    );
    emit(newState);
    getPublishedLength();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    await _getApprovmentNews();
    getPublishedLength();
  }

  /// Получение списка новостей ожидающих публикации.
  Future<void> _getApprovmentNews() async {
    await _eventEntityRepository.getApprovmentEvents();
    final newState = state.copyWith(
      moderationNews: _eventEntityRepository.approvmentEvents,
    );
    getPublishedLength();
    emit(newState);
  }

  /// Получение длины списка опубликованных новостей.
  Future<void> getPublishedLength() async {
    List<EventEntity> list = [];
    final news = await _eventEntityRepository.getEvents();
    for (var e in news) {
      if(e.isPublish == null) return;
      if (e.isPublish!) {
        list.add(e);
      }
    }
    final length = list.length.toString();
    final newState = state.copyWith(counterPublished: length);
    emit(newState);
  }
}
