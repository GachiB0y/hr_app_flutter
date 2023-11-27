import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

part 'event_entity_bloc.freezed.dart';
part 'event_entity_event.dart';
part 'event_entity_state.dart';

/// Business Logic Component EventEntityBLoC
class EventEntityBloc extends Bloc<EventEntityEvent, EventEntityState>
    implements EventSink<EventEntityEvent> {
  EventEntityBloc({
    required final IEventEntityRepository eventEntityRepository,
    required final IAuthRepository authRepository,
    final EventEntityState? initialState,
  })  : _eventEntityRepository = eventEntityRepository,
        _authRepository = authRepository,
        super(
          initialState ??
              const EventEntityState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<EventEntityEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
        create: (event) => _createNewEventEntity(event, emit),
        update: (event) => _eventFilterNews(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  // final IEventEntityRepository _repository;
  final IEventEntityRepository _eventEntityRepository;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(
      EventEntityEventFetch event, Emitter<EventEntityState> emit) async {
    try {
      emit(EventEntityState.processing(data: state.data));

      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      List<EventEntity> listEventEntityLoaded = await _eventEntityRepository
          .getEvents(
            accessToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 10));
      List<EventEntity> filteredEventEntity = filterListCategory(
        listEventEntityLoaded: listEventEntityLoaded,
        idTab: 1,
      );
      final EventEntityViewModel viewModel = EventEntityViewModel(
          listEventEntityLoaded: listEventEntityLoaded,
          filteredListEventEntity: filteredEventEntity);

      emit(EventEntityState.successful(data: viewModel));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the EventEntityBLoC: $err', stackTrace);
      emit(EventEntityState.error(data: state.data));
      rethrow;
    } finally {
      emit(EventEntityState.idle(data: state.data));
    }
  }

  Future<void> _createNewEventEntity(
      EventEntityEventCreate event, Emitter<EventEntityState> emit) async {
    try {
      emit(EventEntityState.processing(data: state.data));

      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      final bool isCreate = await _eventEntityRepository.createNewEventEntity(
          accessToken: accessToken as String,
          title: event.title,
          description: event.description,
          imageFile: event.imageFile,
          categories: event.categories,
          startDate: event.startDate,
          endDate: event.endDate);
      if (isCreate) {
        emit(EventEntityState.successful(data: state.data));
      } else {
        emit(EventEntityState.error(data: state.data));
      }
    } on TimeoutException {
      emit(EventEntityState.error(data: state.data));
      rethrow;
    } catch (e) {
      emit(EventEntityState.error(data: state.data));
      rethrow;
    } finally {
      emit(EventEntityState.idle(data: state.data));
    }
  }

  List<EventEntity> filterListCategory(
      {required List<EventEntity> listEventEntityLoaded, required int idTab}) {
    final List<EventEntity> filteredEventEntity = listEventEntityLoaded
        .where(
            (item) => item.categories.any((category) => category.id == idTab))
        .toList();
    return filteredEventEntity;
  }

  Future<void> _eventFilterNews(
      EventEntityEventUpdate event, Emitter<EventEntityState> emit) async {
    List<EventEntity> filteredEventEntity = filterListCategory(
        idTab: event.idTab, listEventEntityLoaded: event.listEventEntityLoaded);

    final newState =
        state.data?.copyWith(filteredListEventEntity: filteredEventEntity);
    emit(EventEntityState.successful(data: newState));
    emit(EventEntityState.idle(data: state.data));
  }
}
