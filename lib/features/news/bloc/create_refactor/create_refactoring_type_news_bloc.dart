import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringTypeNewsState {
  /// Актуальное состояние редактируемой новости.
  final EventEntity currentNews;

  /// Массив категорий новостей.
  final List<Category> categoriesNews;

  /// Состояние блока [CreateRefactoringTypeNewsCubit].
  CreateRefactoringTypeNewsState({
    required this.currentNews,
    required this.categoriesNews,
  });

  CreateRefactoringTypeNewsState copyWith({
    EventEntity? currentNews,
    List<Category>? categoriesNews,
  }) {
    return CreateRefactoringTypeNewsState(
      currentNews: currentNews ?? this.currentNews,
      categoriesNews: categoriesNews ?? this.categoriesNews,
    );
  }
}

class CreateRefactoringTypeNewsCubit extends Cubit<CreateRefactoringTypeNewsState> {
  late IEventEntityRepository _eventEntityRepository;
  final String? id;

  /// Блок экрана создания или изменения типа новости.
  CreateRefactoringTypeNewsCubit({
    required IEventEntityRepository eventEntityRepository,
    this.id,
  }) : super(
          CreateRefactoringTypeNewsState(
            currentNews: const EventEntity(),
            categoriesNews: [],
          ),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    getCategoriesNews();

    getApprovementNews();
  }

  /// Получение редактируемой новости по id.
  Future<void> getApprovementNews() async {
    var newState = state.copyWith(currentNews: _eventEntityRepository.currentNews);
    emit(newState);
  }

  /// Получение массива категорий новостей.
  Future<void> getCategoriesNews() async {
    await _eventEntityRepository.getCategory();
    var categories = _eventEntityRepository.categoriesNews;
    emit(state.copyWith(categoriesNews: categories));
  }

  /// Проверка выбрана ли категория у изменяемой новости.
  bool checkTypes(int id) {
    if (state.currentNews.categories == null) return false;
    return state.currentNews.categories!.any(
      (element) => element.id == id,
    );
  }

  /// Изменение выбранных категорий.
  void selectCategory(int id) {
    if (state.currentNews.categories == null) return;
    List<Category> categoriesNews = state.categoriesNews;
    List<Category> newCategories = List.from(state.currentNews.categories!);
    if (state.currentNews.categories!.any(
      (element) => element.id == id,
    )) {
      newCategories.remove(categoriesNews.firstWhere((element) => element.id == id));
    } else {
      newCategories.add(
        categoriesNews.firstWhere((element) => element.id == id),
      );
    }
    emit(state.copyWith(currentNews: state.currentNews.copyWith(categories: newCategories)));
    _eventEntityRepository.changeCurrentNews(state.currentNews);
  }
}
