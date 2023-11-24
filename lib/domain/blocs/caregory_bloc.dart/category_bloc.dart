import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';

part 'category_bloc.freezed.dart';
part 'category_bloc.g.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IEventEntityRepository eventEntityRepository;
  final IAuthRepository authRepository;

  CategoryBloc({
    required this.eventEntityRepository,
    required this.authRepository,
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
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<Category> listCategoryLoaded = await eventEntityRepository
          .getCategory(
            accessToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 10));

      emit(CategoryState.loaded(listCategoryLoaded: listCategoryLoaded));
    } on TimeoutException {
      emit(const CategoryState.error());
    } catch (e) {
      emit(const CategoryState.error());
    }
  }
}
