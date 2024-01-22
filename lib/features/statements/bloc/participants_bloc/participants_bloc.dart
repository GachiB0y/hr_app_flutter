import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../data/repo/statements_repository.dart';
import '../../model/participant/participant.dart';

part 'participants_bloc.freezed.dart';
part 'participants_event.dart';
part 'participants_state.dart';

/// Business Logic Component ParticipantsBLoC
class ParticipantsBLoC extends Bloc<ParticipantsEvent, ParticipantsState>
    implements EventSink<ParticipantsEvent> {
  ParticipantsBLoC({
    required final IStatementsRepository repositoryStatements,
    final ParticipantsState? initialState,
  })  : _repositoryStatements = repositoryStatements,
        super(
          initialState ??
              const ParticipantsState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<ParticipantsEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _findParticipant(event, emit),
      ),
      // transformer: bloc_concurrency.sequential(),
      transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IStatementsRepository _repositoryStatements;

  /// Fetch event handler
  Future<void> _findParticipant(
      FetchParticipantsEvent event, Emitter<ParticipantsState> emit) async {
    try {
      emit(ParticipantsState.processing(data: state.data));

      final List<ParticipantEntity> participants =
          await _repositoryStatements.findParticipant(
        name: event.inputValue,
      );

      emit(ParticipantsState.successful(data: participants));
    } on TimeoutException {
      emit(ParticipantsState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the StatementsBLoC: $err', stackTrace);
      emit(ParticipantsState.error(data: state.data));
      rethrow;
    } finally {
      emit(ParticipantsState.idle(data: state.data));
    }
  }
}
