// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

// import '../../model/event_entity/new_event_entity.dart';

// part 'category_bloc.freezed.dart';
// part 'category_bloc.g.dart';
// part 'category_event.dart';
// part 'category_state.dart';

// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   final IEventEntityRepository eventEntityRepository;

//   CategoryBloc({
//     required this.eventEntityRepository,
//   }) : super(const CategoryState.loading()) {
//     on<CategoryEvent>((event, emit) async {
//       if (event is CategoryEventFetch) {
//         await oneCategoryFetch(emit);
//       }
//     });
//   }

//   Future<void> oneCategoryFetch(Emitter<CategoryState> emit) async {
//     emit(const CategoryState.loading());
//     try {
//       List<Category> listCategoryLoaded = await eventEntityRepository
//           .getCategory()
//           .timeout(const Duration(seconds: 10));

//       emit(CategoryState.loaded(listCategoryLoaded: listCategoryLoaded));
//     } on TimeoutException {
//       emit(const CategoryState.error());
//     } catch (e) {
//       emit(const CategoryState.error());
//     }
//   }
// }

// ignore_for_file: unused_catch_stack

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

/// Business Logic Component CategoryBLoC
class CategoryBloc extends Bloc<CategoryEvent, CategoryState>
    implements EventSink<CategoryEvent> {
  CategoryBloc({
    required final IEventEntityRepository eventEntityRepository,
    final CategoryState? initialState,
  })  : _eventEntityRepository = eventEntityRepository,
        super(
          initialState ??
              const CategoryState.idle(
                data: [],
                message: 'Initial idle state',
              ),
        ) {
    on<CategoryEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IEventEntityRepository _eventEntityRepository;

  /// Fetch event handler
  Future<void> _fetch(
      FetchCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryState.processing(data: state.data));
      final newData = await _eventEntityRepository
          .getCategory()
          .timeout(const Duration(seconds: 10));
      emit(CategoryState.successful(data: newData));
    } on TimeoutException {
      emit(CategoryState.error(data: state.data));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the CategoryBLoC: $err', stackTrace);
      emit(CategoryState.error(data: state.data));
      rethrow;
    } finally {
      emit(CategoryState.idle(data: state.data));
    }
  }
}
