// ignore_for_file: unused_catch_stack

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/schedule_bus/data/schedule_bus_repository.dart';
import 'package:hr_app_flutter/features/schedule_bus/model/schedule_bus_entity.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'schedule_bus_bloc.freezed.dart';
part 'schedule_bus_event.dart';
part 'schedule_bus_state.dart';

/// Business Logic Component ScheduleBusBLoC
class ScheduleBusBLoC extends Bloc<ScheduleBusEvent, ScheduleBusState>
    implements EventSink<ScheduleBusEvent> {
  ScheduleBusBLoC({
    required final IScheduleBusRepository repository,
    final ScheduleBusState? initialState,
  })  : _repository = repository,
        super(
          initialState ??
              const ScheduleBusState.idle(
                data: ScheduleBusEntity(cities: [], destinations: []),
                message: 'Initial idle state',
              ),
        ) {
    on<ScheduleBusEvent>(
      (event, emit) => event.map<Future<void>>(
        fetchCitites: (event) => _fetchCities(event, emit),
        fetchDestinations: (event) => _fetchDestination(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IScheduleBusRepository _repository;

  /// Fetch Cities event handler
  Future<void> _fetchCities(FetchCititesScheduleBusEvent event,
      Emitter<ScheduleBusState> emit) async {
    try {
      emit(ScheduleBusState.processing(data: state.data));
      final cities =
          await _repository.getCities().timeout(const Duration(seconds: 10));

      final newData = state.data!.copyWith(cities: cities);

      emit(ScheduleBusState.successful(data: newData));
    } on TimeoutException {
      emit(ScheduleBusState.error(data: state.data));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the ScheduleBusBLoC: $err', stackTrace);
      emit(ScheduleBusState.error(data: state.data));
      rethrow;
    } finally {
      emit(ScheduleBusState.idle(data: state.data));
    }
  }

  /// Fetch Cities event handler
  Future<void> _fetchDestination(FetchDestinationsScheduleBusEvent event,
      Emitter<ScheduleBusState> emit) async {
    try {
      emit(ScheduleBusState.processing(data: state.data));
      final destinations = await _repository
          .getDestionations(
              cityId: event.cityId,
              timeOfDay: event.timeOfDay,
              routeForJob: event.routeForJob,
              all: event.isAll)
          .timeout(const Duration(seconds: 10));
      final newData = state.data!.copyWith(destinations: destinations);
      emit(ScheduleBusState.successful(data: newData));
    } on TimeoutException {
      emit(ScheduleBusState.error(data: state.data));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the ScheduleBusBLoC: $err', stackTrace);
      emit(ScheduleBusState.error(data: state.data));
      rethrow;
    } finally {
      emit(ScheduleBusState.idle(data: state.data));
    }
  }
}
