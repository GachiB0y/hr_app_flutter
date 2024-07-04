import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringNewsState {
  /// Актуальное состояние редактируемой новости.
  final EventEntity currentNews;

  /// Массив категорий новостей.
  final List<Category> categoriesNews;

  /// Состояние блока [CreateRefactoringNewsCubit].
  CreateRefactoringNewsState({
    required this.currentNews,
    required this.categoriesNews,
  });

  CreateRefactoringNewsState copyWith({
    EventEntity? currentNews,
    List<Category>? categoriesNews,
  }) {
    return CreateRefactoringNewsState(
      currentNews: currentNews ?? this.currentNews,
      categoriesNews: categoriesNews ?? this.categoriesNews,
    );
  }
}

class CreateRefactoringNewsCubit extends Cubit<CreateRefactoringNewsState> {
  late IEventEntityRepository _eventEntityRepository;
  final String? id;

  CreateRefactoringNewsCubit({
    required IEventEntityRepository eventEntityRepository,
    this.id,
  }) : super(
          CreateRefactoringNewsState(
            currentNews: EventEntity(
              id: 0,
              title: 'title',
              description: 'description',
              image: 'image',
              startDate: DateTime.now(),
              endDate: DateTime.now(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isPublish: false,
              isArchived: false,
              categories: [],
              writer: const Writer(
                id: 0,
                firstName: '',
                middleName: '',
                lastName: '',
              ),
            ),
            categoriesNews: [],
          ),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    getCategoriesNews();
    if (id != null) {
      getApprovementNews(id!);
    }
  }

  /// Получение редактируемой новости по id.
  Future<void> getApprovementNews(String id) async {
    var news = await _eventEntityRepository.getNewsById(id: id);
    var newState = state.copyWith(currentNews: news);
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
    return state.currentNews.categories.any(
      (element) => element.id == id,
    );
  }

  /// Изменение выбранных категорий.
  void selectCategory(int id) {
    List<Category> categoriesNews = state.categoriesNews;
    List<Category> newCategories = List.from(state.currentNews.categories);

    if (state.currentNews.categories.any(
      (element) => element.id == id,
    )) {
      newCategories.remove(categoriesNews.firstWhere((element) => element.id == id));
    } else {
      newCategories.add(
        categoriesNews.firstWhere((element) => element.id == id),
      );
    }

    emit(state.copyWith(currentNews: state.currentNews.copyWith(categories: newCategories)));
  }
}
