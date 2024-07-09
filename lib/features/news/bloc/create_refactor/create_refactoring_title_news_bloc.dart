import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringTitleNewsState {
  final EventEntity? currentNews;

  /// Состояние блока [CreateRefactoringTitleNewsCubit].
  CreateRefactoringTitleNewsState({
    this.currentNews,
  });

  CreateRefactoringTitleNewsState copyWith({
    EventEntity? currentNews,
  }) {
    return CreateRefactoringTitleNewsState(
      currentNews: currentNews ?? this.currentNews,
    );
  }
}

class CreateRefactoringTitleNewsCubit extends Cubit<CreateRefactoringTitleNewsState> {
  /// Репозиторий.
  late IEventEntityRepository _eventEntityRepository;

  /// Контроллер поля ввода заголовка.
  late TextEditingController textController;

  /// Блок экрана создания или изменения заголовка новости.
  CreateRefactoringTitleNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          CreateRefactoringTitleNewsState(),
        ) {
    _eventEntityRepository = eventEntityRepository;
    textController = TextEditingController();
    if (eventEntityRepository.currentNews != null && eventEntityRepository.currentNews!.title != null) {
      textController.text = eventEntityRepository.currentNews!.title!;
    }
    textController.addListener(_getSearch);

    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    final currentNews = _eventEntityRepository.currentNews;
    emit(state.copyWith(currentNews: currentNews));
  }

  /// Таймер для
  Timer? _timer;

  /// Коллбак на изменение поля заголовка новости.
  void _getSearch() {
    if (textController.text == ' ') {
      textController.text = '';
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), () async {
      emit(
        state.copyWith(
          currentNews: state.currentNews?.copyWith(
            title: textController.text,
          ),
        ),
      );
      if(state.currentNews != null) {
        changeCurrentNews(state.currentNews!);
      }
    });
  }

  /// Изменение заголовкa новости в репозитории.
  void changeCurrentNews(EventEntity news) {
    _eventEntityRepository.changeCurrentNews(news);
  }
}
