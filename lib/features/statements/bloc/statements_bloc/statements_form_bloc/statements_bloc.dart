import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'dart:async';

import '../../../data/repo/statements_repository.dart';
import '../../../model/statements/statements.dart';

part 'statements_bloc.freezed.dart';
part 'statements_event.dart';
part 'statements_state.dart';

enum TypeOfAppplicationSigning {
  daefult,
  smsCode,
}

/// Business Logic Component StatementsBLoC
class StatementsBLoC extends Bloc<StatementsEvent, StatementsState>
    implements EventSink<StatementsEvent> {
  StatementsBLoC({
    required final IStatementsRepository repositoryStatements,
    final StatementsState? initialState,
  })  : _repositoryStatements = repositoryStatements,
        super(
          initialState ??
              const StatementsState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<StatementsEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetchStatementForm(event, emit),
        create: (event) => _submitFormAndSend(event, emit),
        signDocument: (event) => _signDocumentBySMSCode(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  final IStatementsRepository _repositoryStatements;

  /// Fetch event handler
  Future<void> _fetchStatementForm(
      StatementsEventFetch event, Emitter<StatementsState> emit) async {
    try {
      emit(StatementsState.processing(data: state.data));

      final StatementTempalteEntity newTempalteEntity =
          await _repositoryStatements.fetchStatementForm(id: event.id);

      final newData = StatementViewModel(
          isSmsApprove: false, tempalteEntity: newTempalteEntity);
      emit(StatementsState.successful(data: newData));
    } on TimeoutException {
      emit(StatementsState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the StatementsBLoC: $err', stackTrace);
      emit(StatementsState.error(data: state.data));
      rethrow;
    } finally {
      emit(StatementsState.idle(data: state.data));
    }
  }

  /// Submit event handler
  Future<void> _submitFormAndSend(
      StatementsEventCreate event, Emitter<StatementsState> emit) async {
    try {
      emit(StatementsState.processing(data: state.data));

      final TypeOfAppplicationSigning typeSigning =
          await _repositoryStatements.submitStatementForm(
        formInfo: event.itemsForm,
      );
      switch (typeSigning) {
        case TypeOfAppplicationSigning.smsCode:
          {
            final newData = state.data?.copyWith(isSmsApprove: true);

            emit(StatementsState.successful(data: newData));
          }
        case TypeOfAppplicationSigning.daefult:
          emit(StatementsState.successful(data: state.data));
      }
    } on TimeoutException {
      emit(StatementsState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the StatementsBLoC: $err', stackTrace);
      emit(StatementsState.error(data: state.data));
      rethrow;
    } finally {
      emit(StatementsState.idle(data: state.data));
    }
  }

  /// Sign document by SMS code event handler
  Future<void> _signDocumentBySMSCode(
      StatementsEventSignDocument event, Emitter<StatementsState> emit) async {
    try {
      emit(StatementsState.processing(data: state.data));

      await _repositoryStatements.signDocumentBySmsCode(
        code: event.code,
      );
      final newData = state.data?.copyWith(isSigningStatment: true);
      emit(StatementsState.successful(data: newData));
    } on TimeoutException {
      emit(StatementsState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the StatementsBLoC: $err', stackTrace);
      emit(StatementsState.error(data: state.data));
      rethrow;
    } finally {
      emit(StatementsState.idle(data: state.data));
    }
  }
}
