import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';

import '../../model/schedule_bus_entity/schedule_bus_entity.dart';

part 'schedule_bus_bloc.freezed.dart';
part 'schedule_bus_bloc.g.dart';
part 'schedule_bus_event.dart';
part 'schedule_bus_state.dart';

class ScheduleBusBloc extends Bloc<ScheduleBusEvent, ScheduleBusState> {
  final IServiceRepository serviceRepository;

  ScheduleBusBloc({
    required this.serviceRepository,
  }) : super(const ScheduleBusState.loading()) {
    on<ScheduleBusEvent>((event, emit) async {
      if (event is ScheduleBusEventFetch) {
        await onScheduleBusEventFetch(emit, event);
      }
    });
  }

  Future<void> onScheduleBusEventFetch(
      Emitter<ScheduleBusState> emit, ScheduleBusEventFetch event) async {
    try {
      emit(const ScheduleBusState.loading());
      ScheduleBus scheduleBus = await serviceRepository
          .getScheduleBus()
          .timeout(const Duration(seconds: 10));
      final newState = ScheduleBusState.loaded(scheduleBusLoaded: scheduleBus);
      emit(newState);
    } on TimeoutException {
      emit(const ScheduleBusState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const ScheduleBusState.error());
    }
  }
}
