import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';

part 'event_entity_bloc.freezed.dart';
part 'event_entity_bloc.g.dart';
part 'event_entity_event.dart';
part 'event_entity_state.dart';

class EventEntityBloc extends Bloc<EventEntityEvent, EventEntityState> {
  final IEventEntityRepository eventEntityRepository;
  final IAuthRepository authRepository;

  EventEntityBloc({
    required this.eventEntityRepository,
    required this.authRepository,
  }) : super(const EventEntityState.loading()) {
    on<EventEntityEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) async => await _oneEventEntityFetch(emit),
        filterNews: (event) => _eventFilterNews(event, emit),
        createNewEventEntity: (event) async =>
            await _createNewEventEntity(event, emit),
      ),
    );
  }

  Future<void> _createNewEventEntity(EventEntityEventCreateNewEventEntity event,
      Emitter<EventEntityState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      await eventEntityRepository.createNewEventEntity(
          accessToken: accessToken as String,
          title: event.title,
          description: event.description,
          imageFile: event.imageFile,
          categories: event.categories,
          startDate: event.startDate,
          endDate: event.endDate);
    } on TimeoutException {
      emit(const EventEntityState.error());
    } catch (e) {
      emit(const EventEntityState.error());
    }
  }

  Future<void> _eventFilterNews(
      EventEntityEventFilterNews event, Emitter<EventEntityState> emit) async {
    List<EventEntity> filteredEventEntity = filterListCategory(
        idTab: event.idTab, listEventEntityLoaded: event.listEventEntityLoaded);
    emit(EventEntityState.loaded(
      listEventEntityLoaded: event.listEventEntityLoaded,
      filteredListEventEntity: filteredEventEntity,
    ));
  }

  List<EventEntity> filterListCategory(
      {required List<EventEntity> listEventEntityLoaded, required int idTab}) {
    final List<EventEntity> filteredEventEntity = listEventEntityLoaded
        .where(
            (item) => item.categories.any((category) => category.id == idTab))
        .toList();
    return filteredEventEntity;
  }

  Future<void> _oneEventEntityFetch(Emitter<EventEntityState> emit) async {
    emit(const EventEntityState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<EventEntity> listEventEntityLoaded = await eventEntityRepository
          .getEvents(
            accessToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 10));
      List<EventEntity> filteredEventEntity = filterListCategory(
        listEventEntityLoaded: listEventEntityLoaded,
        idTab: 1,
      );

      emit(EventEntityState.loaded(
        listEventEntityLoaded: listEventEntityLoaded,
        filteredListEventEntity: filteredEventEntity,
      ));
    } on TimeoutException {
      emit(const EventEntityState.error());
    } catch (e) {
      emit(const EventEntityState.error());
    }
  }
}
