import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

part 'category_bloc.freezed.dart';
part 'category_bloc.g.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IEventEntityRepository eventEntityRepository;

  CategoryBloc({
    required this.eventEntityRepository,
  }) : super(const CategoryState.loading()) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryEventFetch) {
        await oneCategoryFetch(emit);
      }
    });
  }

  Future<void> oneCategoryFetch(Emitter<CategoryState> emit) async {
    emit(const CategoryState.loading());
    try {
      List<Category> listCategoryLoaded = await eventEntityRepository
          .getCategory()
          .timeout(const Duration(seconds: 10));

      emit(CategoryState.loaded(listCategoryLoaded: listCategoryLoaded));
    } on TimeoutException {
      emit(const CategoryState.error());
    } catch (e) {
      emit(const CategoryState.error());
    }
  }
}
