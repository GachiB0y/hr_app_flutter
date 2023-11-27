import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';

import '../../model/schedule_bus_entity/schedule_bus_entity.dart';

part 'schedule_bus_bloc.freezed.dart';
part 'schedule_bus_bloc.g.dart';
part 'schedule_bus_event.dart';
part 'schedule_bus_state.dart';

class ScheduleBusBloc extends Bloc<ScheduleBusEvent, ScheduleBusState> {
  final IServiceRepository serviceRepository;
  final IAuthRepository authRepository;

  ScheduleBusBloc({
    required this.serviceRepository,
    required this.authRepository,
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
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      ScheduleBus scheduleBus = await serviceRepository
          .getScheduleBus(
            userToken: accessToken as String,
          )
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
