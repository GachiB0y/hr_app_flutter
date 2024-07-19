import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';

part 'approvement_news_bloc.freezed.dart';

part 'approvement_news_event.dart';
part 'approvement_news_state.dart';

class ApprovementNewsBloc extends Bloc<ApprovementEvent, ApprovementNewsState> {
  final IEventEntityRepository eventEntityRepository;

  ApprovementNewsBloc({
    required this.eventEntityRepository,
  }) : super(const ApprovementNewsState.loading()) {
    on<ApprovementEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _onApprovementEventFetch(emit),
        approvedNews: (event) => _onApprovedNews(event, emit),
        moveInArchiveNews: (event) => _onMoveInArchiveNews(event, emit),
      ),
    );
  }

  Future<void> _onApprovedNews(
    ApprovementEventApprovedNews event,
    Emitter<ApprovementNewsState> emit,
  ) async {
    try {
      await eventEntityRepository
          .approvementNews(
            id: event.id,
          )
          .timeout(const Duration(seconds: 10));
      await _onApprovementEventFetch(emit);
    } on TimeoutException {
      emit(
        const ApprovementNewsState.error(
          errorText: 'Время ожидания истекло!',
        ),
      );
    } catch (e) {
      emit(
        ApprovementNewsState.error(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<void> _onMoveInArchiveNews(
    ApprovementEventMoveInArchiveNews event,
    Emitter<ApprovementNewsState> emit,
  ) async {
    try {
      await eventEntityRepository
          .moveInArchiveNews(
            id: event.id,
          )
          .timeout(const Duration(seconds: 10));
      await _onApprovementEventFetch(emit);
    } on TimeoutException {
      emit(
        const ApprovementNewsState.error(
          errorText: 'Время ожидания истекло!',
        ),
      );
    } catch (e) {
      emit(ApprovementNewsState.error(errorText: e.toString()));
    }
  }

  Future<void> _onApprovementEventFetch(
    Emitter<ApprovementNewsState> emit,
  ) async {
    // emit(const ApprovementNewsState.loading());
    // try {
    //   List<EventEntity> listApprovmentEventEntityLoaded =
    //       await eventEntityRepository
    //           .getApprovmentEvents()
    //           .timeout(const Duration(seconds: 10));
    //
    //   emit(ApprovementNewsState.loaded(
    //     listApprovmentEventEntityLoaded: listApprovmentEventEntityLoaded,
    //   ));
    // } on TimeoutException {
    //   emit(const ApprovementNewsState.error(
    //       errorText: 'Время ожидания истекло!'));
    // } on ApiClientException {
    //   emit(const ApprovementNewsState.error(errorText: 'Ничего не найдено!'));
    // } catch (e) {
    //   emit(const ApprovementNewsState.error());
    // }
  }
}
