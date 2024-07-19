import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/notification/data/repo/notification_repository.dart';
import 'package:hr_app_flutter/features/notification/model/notification.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// Business Logic Component NotificationBLoC
class NotificationBLoC extends Bloc<NotificationEvent, NotificationState>
    implements EventSink<NotificationEvent> {
  NotificationBLoC({
    required final INotificationRepository repository,
    final NotificationState? initialState,
  })  : _repository = repository,
        super(
          initialState ??
              const NotificationState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<NotificationEvent>(
      (event, emit) => event.map<Future<void>>(
        fetchNotification: (event) => _fetch(event, emit),
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
    FetchNotificationNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationState.processing(data: state.data));
      final newData = await _repository.getNotifications();
      emit(NotificationState.successful(data: newData.toList()));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the NotificationBLoC: $err', stackTrace);
      emit(NotificationState.error(data: state.data));
      rethrow;
    } finally {
      emit(NotificationState.idle(data: state.data));
    }
  }
}
