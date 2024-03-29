import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../../../core/components/rest_clients/api_client_exception.dart';
import '../../model/event_entity/new_event_entity.dart';

part 'approvement_news_bloc.freezed.dart';
part 'approvement_news_bloc.g.dart';
part 'approvement_news_event.dart';
part 'approvement_news_state.dart';

class ApprovementNewsBloc extends Bloc<ApprovementEvent, ApprovementNewsState> {
  final IEventEntityRepository eventEntityRepository;

  ApprovementNewsBloc({
    required this.eventEntityRepository,
  }) : super(const ApprovementNewsState.loading()) {
    on<ApprovementEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) async => await _onApprovementEventFetch(emit),
        approvedNews: (event) async => await _onApprovedNews(event, emit),
        moveInArchiveNews: (event) async =>
            await _onMoveInArchiveNews(event, emit),
      ),
    );
  }

  Future<void> _onApprovedNews(ApprovementEventApprovedNews event,
      Emitter<ApprovementNewsState> emit) async {
    try {
      await eventEntityRepository
          .approvementNews(
            id: event.id,
          )
          .timeout(const Duration(seconds: 10));
      await _onApprovementEventFetch(emit);
    } on TimeoutException {
      emit(const ApprovementNewsState.error());
    } catch (e) {
      emit(const ApprovementNewsState.error());
    }
  }

  Future<void> _onMoveInArchiveNews(ApprovementEventMoveInArchiveNews event,
      Emitter<ApprovementNewsState> emit) async {
    try {
      await eventEntityRepository
          .moveInArchiveNews(
            id: event.id,
          )
          .timeout(const Duration(seconds: 10));
      await _onApprovementEventFetch(emit);
    } on TimeoutException {
      emit(const ApprovementNewsState.error());
    } catch (e) {
      emit(const ApprovementNewsState.error());
    }
  }

  Future<void> _onApprovementEventFetch(
      Emitter<ApprovementNewsState> emit) async {
    emit(const ApprovementNewsState.loading());
    try {
      List<EventEntity> listApprovmentEventEntityLoaded =
          await eventEntityRepository
              .getApprovmentEvents()
              .timeout(const Duration(seconds: 10));

      emit(ApprovementNewsState.loaded(
        listApprovmentEventEntityLoaded: listApprovmentEventEntityLoaded,
      ));
    } on TimeoutException {
      emit(const ApprovementNewsState.error(
          errorText: 'Время ожидания истекло!'));
    } on ApiClientException {
      emit(const ApprovementNewsState.error(errorText: 'Ничего не найдено!'));
    } catch (e) {
      emit(const ApprovementNewsState.error());
    }
  }
}
