import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';

part 'approvement_news_bloc.freezed.dart';
part 'approvement_news_bloc.g.dart';
part 'approvement_news_event.dart';
part 'approvement_news_state.dart';

class ApprovementNewsBloc extends Bloc<ApprovementEvent, ApprovementNewsState> {
  final EventEntityRepository eventEntityRepository;
  final AuthRepository authRepository;

  ApprovementNewsBloc({
    required this.eventEntityRepository,
    required this.authRepository,
  }) : super(const ApprovementNewsState.loading()) {
    on<ApprovementEvent>((event, emit) async {
      if (event is ApprovementEventFetch) {
        await onApprovementEventFetch(emit);
      }
    });
  }

  Future<void> onApprovementEventFetch(
      Emitter<ApprovementNewsState> emit) async {
    emit(const ApprovementNewsState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<EventEntity> listApprovmentEventEntityLoaded =
          await eventEntityRepository
              .getApprovmentEvents(
                accessToken: accessToken as String,
              )
              .timeout(const Duration(seconds: 5));

      emit(ApprovementNewsState.loaded(
        listApprovmentEventEntityLoaded: listApprovmentEventEntityLoaded,
      ));
    } on TimeoutException {
      emit(const ApprovementNewsState.error());
    } catch (e) {
      emit(const ApprovementNewsState.error());
    }
  }
}
