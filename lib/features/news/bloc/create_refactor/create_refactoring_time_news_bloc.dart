import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringTimeNewsState {
  final EventEntity? currentNews;

  /// Состояние блока [CreateRefactoringTimeNewsCubit].
  CreateRefactoringTimeNewsState({
    this.currentNews,
  });

  CreateRefactoringTimeNewsState copyWith({
    EventEntity? currentNews,
  }) {
    return CreateRefactoringTimeNewsState(
      currentNews: currentNews ?? this.currentNews,
    );
  }
}

class CreateRefactoringTimeNewsCubit extends Cubit<CreateRefactoringTimeNewsState> {
  late IEventEntityRepository _eventEntityRepository;

  /// Флаг активности кнопки "Продолжить".
  bool get isActive => _eventEntityRepository.currentNews?.startDate != null;

  /// Блок экрана создания или изменения времени новости.
  CreateRefactoringTimeNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          CreateRefactoringTimeNewsState(),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    final currentNews = _eventEntityRepository.currentNews;
    emit(state.copyWith(currentNews: currentNews));
  }

  /// Колбек на выбор времени.
  void changeTime(Duration time) {
    if (state.currentNews == null) return;
    changeCurrentNews(
      state.currentNews!.copyWith(
        startDate: DateTime(
          state.currentNews!.startDate!.year,
          state.currentNews!.startDate!.month,
          state.currentNews!.startDate!.day,
          0,
          time.inMinutes,
        ),
      ),
    );
  }

  /// Изменение времени новости в репозитории.
  void changeCurrentNews(EventEntity news) {
    _eventEntityRepository.changeCurrentNews(news);
  }
}
