import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringNewsState {
  final EventEntity currentNews;

  /// Состояние блока [CreateRefactoringNewsCubit].
  CreateRefactoringNewsState({
    required this.currentNews,
  });

  CreateRefactoringNewsState copyWith({
    EventEntity? currentNews,
  }) {
    return CreateRefactoringNewsState(
      currentNews: currentNews ?? this.currentNews,
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
          ),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    if(id != null) {
      getApprovementNews(id!);
    }
  }

  /// Получение редактируемой новости по id.
  Future<void> getApprovementNews(String id) async {
    var news = await _eventEntityRepository.getNewsById(id: id);
    var newState = state.copyWith(currentNews: news);
    emit(newState);
    print(state.currentNews);
  }
}
