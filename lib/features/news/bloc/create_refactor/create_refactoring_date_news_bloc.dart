import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringDateNewsState {
  final EventEntity? currentNews;

  /// Состояние блока [CreateRefactoringDateNewsCubit].
  CreateRefactoringDateNewsState({
    this.currentNews,
  });

  CreateRefactoringDateNewsState copyWith({
    EventEntity? currentNews,
  }) =>
      CreateRefactoringDateNewsState(
        currentNews: currentNews ?? this.currentNews,
      );
}

class CreateRefactoringDateNewsCubit extends Cubit<CreateRefactoringDateNewsState> {
  late IEventEntityRepository _eventEntityRepository;

  bool get isActive => _eventEntityRepository.currentNews?.startDate != null;

  /// Блок экрана создания или изменения даты новости.
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
  void changeDate(List<DateTime> dates) {
    if (state.currentNews == null) return;
    changeCurrentNews(
      state.currentNews!.copyWith(
        startDate: dates.first,
        endDate: dates.last,
      ),
    );
  }

  /// Изменение даты новости в репозитории.
  void changeCurrentNews(EventEntity news) {
    _eventEntityRepository.changeCurrentNews(news);
  }

  /// Сбросить изменения редактируемой новости.
  void reset() {
    _eventEntityRepository.reset();
  }
}
