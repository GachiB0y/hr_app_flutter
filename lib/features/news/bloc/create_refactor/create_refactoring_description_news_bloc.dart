import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringDescriptionNewsState {
  final EventEntity? currentNews;

  /// Состояние блока [CreateRefactoringDescriptionNewsCubit].
  CreateRefactoringDescriptionNewsState({
    this.currentNews,
  });

  CreateRefactoringDescriptionNewsState copyWith({
    EventEntity? currentNews,
  }) {
    return CreateRefactoringDescriptionNewsState(
      currentNews: currentNews ?? this.currentNews,
    );
  }
}

class CreateRefactoringDescriptionNewsCubit extends Cubit<CreateRefactoringDescriptionNewsState> {
  /// Репозиторий.
  late IEventEntityRepository _eventEntityRepository;

  /// Контроллер поля ввода описания новости.
  late TextEditingController textController;

  /// Блок экрана создания или изменения описания новости.
  CreateRefactoringDescriptionNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          CreateRefactoringDescriptionNewsState(),
        ) {
    _eventEntityRepository = eventEntityRepository;
    textController = TextEditingController();
    if (eventEntityRepository.currentNews != null && eventEntityRepository.currentNews!.description != null) {
      textController.text = eventEntityRepository.currentNews!.description!;
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

  /// Коллбак на изменение поля описания новости.
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
            description: textController.text,
          ),
        ),
      );
      if (state.currentNews != null) {
        changeCurrentNews(state.currentNews!);
      }
    });
  }

  /// Изменение заголовки новости в репозитории.
  void changeCurrentNews(EventEntity news) {
    _eventEntityRepository.changeCurrentNews(news);
  }
}
