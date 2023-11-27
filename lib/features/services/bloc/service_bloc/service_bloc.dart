import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:hr_app_flutter/features/services/widget/service_element/service_element_widget.dart';

part 'service_bloc.freezed.dart';
part 'service_bloc.g.dart';
part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final IServiceRepository serviceRepository;
  final IAuthRepository authRepository;

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
      Emitter<ServiceState> emit, ServiceEventFetch event) async {
    emit(const ServiceState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      List<Service> servicesLoaded = await serviceRepository
          .getServices(
            userToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 10));

      List<Widget> groupWidgets = [];
      for (var service in servicesLoaded) {
        if (service.id == 22) {
          if (service.permissions.createService) {
            groupWidgets.add(
              ServiceElementWidget(
                imagePath: 'assets/images/thumbs_up.png',
                idHandler: 1,
                title: 'Создать новость',
                isRow: event.isRow,
                service: service,
              ),
            );
          }
          if (service.permissions.approveService) {
            groupWidgets.add(
              ServiceElementWidget(
                imagePath: 'assets/images/tree_structure.png',
                idHandler: 2,
                title: 'Модерация новостей',
                isRow: event.isRow,
                service: service,
              ),
            );
          }
        } else if (service.id == 24) {
          groupWidgets.add(
            ServiceElementWidget(
              imagePath: 'assets/images/note.png',
              title: service.name,
              isRow: event.isRow,
              service: service,
            ),
          );
        } else if (service.id == 25) {
          groupWidgets.add(
            ServiceElementWidget(
              imagePath: 'assets/images/bus.png',
              title: service.name,
              isRow: event.isRow,
              service: service,
            ),
          );
        }
      }

      emit(ServiceState.loaded(
        servicesLoaded: servicesLoaded,
        loeadedServiceWidgets: groupWidgets,
      ));
    } on TimeoutException {
      emit(const ServiceState.error());
    } catch (e) {
      emit(const ServiceState.error());
    }
  }
}
