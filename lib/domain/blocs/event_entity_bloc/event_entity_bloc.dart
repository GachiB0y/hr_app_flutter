import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/event_entity.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';

import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';

part 'event_entity_bloc.freezed.dart';
part 'event_entity_bloc.g.dart';
part 'event_entity_event.dart';
part 'event_entity_state.dart';

class EventEntityBloc extends Bloc<EventEntityEvent, EventEntityState> {
  final EventEntityRepository eventEntityRepository;
  final AuthRepository authRepository;

  EventEntityBloc({
    required this.eventEntityRepository,
    required this.authRepository,
  }) : super(const EventEntityState.loading()) {
    on<EventEntityEvent>((event, emit) async {
      if (event is EventEntityEventFetch) {
        await oneEventEntityFetch(emit);
      }
    });
  }

  Future<void> oneEventEntityFetch(Emitter<EventEntityState> emit) async {
    emit(const EventEntityState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<EventEntity> listEventEntityLoaded = await eventEntityRepository
          .getEvents(
            accessToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 5));

      emit(EventEntityState.loaded(
          listEventEntityLoaded: listEventEntityLoaded));
    } on TimeoutException {
      emit(const EventEntityState.error());
    } catch (e) {
      emit(const EventEntityState.error());
    }
  }
}
