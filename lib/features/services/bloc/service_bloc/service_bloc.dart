import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'service_bloc.freezed.dart';
part 'service_event.dart';
part 'service_state.dart';

/// Business Logic Component ServiceBLoC
class ServiceBloc extends Bloc<ServiceEvent, ServiceState>
    implements EventSink<ServiceEvent> {
  ServiceBloc({
    required final IServiceRepository serviceRepository,
    final ServiceState? initialState,
  })  : _repository = serviceRepository,
        super(
          initialState ??
              const ServiceState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<ServiceEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IServiceRepository _repository;

  /// Fetch event handler
  Future<void> _fetch(
      FetchServiceEvent event, Emitter<ServiceState> emit) async {
    try {
      emit(ServiceState.processing(data: state.data));
      final newData =
          await _repository.getServices().timeout(const Duration(seconds: 10));
      emit(ServiceState.successful(data: newData));
    } on TimeoutException {
      emit(ServiceState.error(data: state.data));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the ServiceBLoC: $err', stackTrace);
      emit(ServiceState.error(data: state.data));
      rethrow;
    } finally {
      emit(ServiceState.idle(data: state.data));
    }
  }
}
