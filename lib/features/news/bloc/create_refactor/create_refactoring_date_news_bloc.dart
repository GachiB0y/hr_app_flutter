import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringDateNewsState {
  final EventEntity? currentNews;

  /// Состояние блока [CreateRefactoringTypeNewsCubit].
  CreateRefactoringDateNewsState({
    this.currentNews,
  });

  CreateRefactoringDateNewsState copyWith({
    EventEntity? currentNews,
  }) {
    return CreateRefactoringDateNewsState(
      currentNews: currentNews ?? this.currentNews,
    );
  }
}

class CreateRefactoringDateNewsCubit extends Cubit<CreateRefactoringDateNewsState> {
  late IEventEntityRepository _eventEntityRepository;

  /// Блок экрана создания или изменения типа новости.
  CreateRefactoringDateNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          CreateRefactoringDateNewsState(),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    final currentNews = _eventEntityRepository.currentNews;
    emit(state.copyWith(currentNews: currentNews));
  }

  /// Колбек на выбор даты.
  void changeDate(DateTime date) {
    emit(
      state.copyWith(
        currentNews: state.currentNews?.copyWith(
          startDate: date,
        ),
      ),
    );
    if (state.currentNews == null) return;
    changeCurrentNews(state.currentNews!);
  }

  /// Изменение даты новости в репозитории.
  void changeCurrentNews(EventEntity news) {
    _eventEntityRepository.changeCurrentNews(news);
  }
}
