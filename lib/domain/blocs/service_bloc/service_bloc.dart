import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/service_repository.dart';

part 'service_bloc.freezed.dart';
part 'service_bloc.g.dart';
part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository serviceRepository;
  final AuthRepository authRepository;

  ServiceBloc({
    required this.serviceRepository,
    required this.authRepository,
  }) : super(const ServiceState.loading()) {
    on<ServiceEvent>((event, emit) async {
      if (event is ServiceEventFetch) {
        await onServiceEventFetch(emit, event);
      }
    });
  }

  Future<void> onServiceEventFetch(
      Emitter<ServiceState> emit, ServiceEvent event) async {
    emit(const ServiceState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<Service> servicesLoaded = await serviceRepository
          .getServices(
            userToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 5));

      emit(ServiceState.loaded(
        servicesLoaded: servicesLoaded,
      ));
    } on TimeoutException {
      emit(const ServiceState.error());
    } catch (e) {
      emit(const ServiceState.error());
    }
  }
}
