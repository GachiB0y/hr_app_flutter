import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/notification/data/repo/notification_repository.dart';

part 'count_notification_bloc.freezed.dart';
part 'count_notification_event.dart';
part 'count_notification_state.dart';

/// Business Logic Component CountNotificationBLoC
class CountNotificationBLoC
    extends Bloc<CountNotificationEvent, CountNotificationState>
    implements EventSink<CountNotificationEvent> {
  CountNotificationBLoC({
    required final INotificationRepository repository,
    final CountNotificationState? initialState,
  })  : _repository = repository,
        super(
          initialState ??
              const CountNotificationState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<CountNotificationEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final INotificationRepository _repository;

  /// Fetch event handler
  Future<void> _fetch(
    FetchCountNotificationEvent event,
    Emitter<CountNotificationState> emit,
  ) async {
    try {
      emit(CountNotificationState.processing(data: state.data));
      final newData = await _repository.getNotifications();
      emit(CountNotificationState.successful(data: newData.length));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the CountNotificationBLoC: $err', stackTrace);
      emit(CountNotificationState.error(data: state.data));
      rethrow;
    } finally {
      emit(CountNotificationState.idle(data: state.data));
    }
  }
}
