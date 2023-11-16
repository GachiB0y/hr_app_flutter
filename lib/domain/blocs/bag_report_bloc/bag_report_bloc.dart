import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/repository/service_repository.dart';
import 'package:hr_app_flutter/domain/entity/bag_report_entity/bag_report_entity.dart';
import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import '../../repository/auth_repository.dart';
part 'bag_report_bloc.freezed.dart';

part 'bag_report_state.dart';
part 'bag_report_event.dart';

/// Business Logic Component BagReportBLoC
class BagReportBLoC extends Bloc<BagReportEvent, BagReportState>
    implements EventSink<BagReportEvent> {
  BagReportBLoC({
    required final IServiceRepository repositoryService,
    final BagReportState? initialState,
    required final IAuthRepository authRepository,
  })  : _repositoryService = repositoryService,
        _authRepository = authRepository,
        super(
          initialState ??
              const BagReportState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<BagReportEvent>(
      (event, emit) => event.map<Future<void>>(
        create: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IServiceRepository _repositoryService;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(
      BagReportEventCreate event, Emitter<BagReportState> emit) async {
    try {
      emit(BagReportState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      final isSend = await _repositoryService.submitBagReportForm(
          userToken: accessToken as String, bagReportEntity: event.formInfo);
      if (isSend) {
        emit(BagReportState.successful(data: state.data));
      } else {
        emit(BagReportState.error(data: state.data));
      }
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the BagReportBLoC: $err', stackTrace);
      emit(BagReportState.error(data: state.data));
      rethrow;
    } finally {
      emit(BagReportState.idle(data: state.data));
    }
  }
}
