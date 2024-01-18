import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import '../../data/repo/service_repository.dart';
import '../../model/bag_report_entity/bag_report_entity.dart';

part 'bag_report_bloc.freezed.dart';
part 'bag_report_state.dart';
part 'bag_report_event.dart';

/// Business Logic Component BagReportBLoC
class BagReportBLoC extends Bloc<BagReportEvent, BagReportState>
    implements EventSink<BagReportEvent> {
  BagReportBLoC({
    required final IServiceRepository repositoryService,
    final BagReportState? initialState,
  })  : _repositoryService = repositoryService,
        super(
          initialState ??
              const BagReportState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<BagReportEvent>(
      (event, emit) => event.map<Future<void>>(
        create: (event) => _create(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IServiceRepository _repositoryService;

  /// Create event handler
  Future<void> _create(
      BagReportEventCreate event, Emitter<BagReportState> emit) async {
    try {
      emit(BagReportState.processing(data: state.data));

      final isSend = await _repositoryService.submitBagReportForm(
          bagReportEntity: event.formInfo);
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
