import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

part 'one_news_bloc.freezed.dart';
part 'one_news_bloc.g.dart';
part 'one_news_event.dart';
part 'one_news_state.dart';

class OneNewsBloc extends Bloc<OneNewsEvent, OneNewsState> {
  final IEventEntityRepository eventEntityRepository;

  OneNewsBloc({
    required this.eventEntityRepository,
  }) : super(const OneNewsState.loading()) {
    on<OneNewsEvent>((event, emit) async {
      if (event is OneNewsEventFetch) {
        await onOneNewsEventFetch(emit, event);
      }
    });
  }

  Future<void> onOneNewsEventFetch(
      Emitter<OneNewsState> emit, OneNewsEvent event) async {
    emit(const OneNewsState.loading());
    try {
      EventEntity oneNewsLoaded = await eventEntityRepository
          .getNewsById(
            id: event.id,
          )
          .timeout(const Duration(seconds: 10));

      emit(OneNewsState.loaded(
        oneNewsLoaded: oneNewsLoaded,
      ));
    } on TimeoutException {
      emit(const OneNewsState.error());
    } catch (e) {
      emit(const OneNewsState.error());
    }
  }
}
