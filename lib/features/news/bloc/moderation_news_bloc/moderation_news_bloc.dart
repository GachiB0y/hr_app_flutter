import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class ModerationNewsState {
  final List<EventEntity> moderationNews;
  final String? counterWaitingAction;
  final String? counterPublished;

  ModerationNewsState({
    required this.moderationNews,
    this.counterWaitingAction,
    this.counterPublished,
  });

  ModerationNewsState copyWith({
    List<EventEntity>? moderationNews,
    String? counterWaitingAction,
    String? counterPublished,
  }) {
    return ModerationNewsState(
      moderationNews: moderationNews ?? this.moderationNews,
      counterWaitingAction: counterWaitingAction ?? this.counterWaitingAction,
      counterPublished: counterPublished ?? this.counterPublished,
    );
  }
}

class ModerationNewsCubit extends Cubit<ModerationNewsState> {
  final IEventEntityRepository eventEntityRepository;

  ModerationNewsCubit({required this.eventEntityRepository})
      : super(
          ModerationNewsState(
            moderationNews: [],
            counterWaitingAction: '',
            counterPublished: '',
          ),
        ) {
    _initialize();

  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    await _getApprovmentNews();
    getApprovmentLength();
    getPublishedLength();
  }

  /// Получение списка новостей ожидающих публикации.
  Future<void> _getApprovmentNews() async {
    final news = await eventEntityRepository.getApprovmentEvents();
    final newState = state.copyWith(moderationNews: news);
    getApprovmentLength();
    getPublishedLength();
    emit(newState);
  }

  /// Получение длинны списка новостей ожидающих публикации.
  void getApprovmentLength() {
    final length = state.moderationNews.length.toString();
    final newState = state.copyWith(counterWaitingAction: length);
    emit(newState);
  }

  /// Получение длины списка опубликованных новостей.
  Future<void> getPublishedLength() async {
    List<EventEntity> list = [];
    final news = await eventEntityRepository.getEvents();
    for(var e in news){
      if(e.isPublish){
        list.add(e);
      }
    }
    final length = list.length.toString();
    final newState = state.copyWith(counterPublished: length);
    emit(newState);
  }
}
