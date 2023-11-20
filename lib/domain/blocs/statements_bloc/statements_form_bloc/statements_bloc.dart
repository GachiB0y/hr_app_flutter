import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/statements/statements.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'dart:async';

import '../../../repository/auth_repository.dart';
import '../../../repository/statements_repository.dart';

part 'statements_bloc.freezed.dart';

part 'statements_event.dart';
part 'statements_state.dart';

/// Business Logic Component StatementsBLoC
class StatementsBLoC extends Bloc<StatementsEvent, StatementsState>
    implements EventSink<StatementsEvent> {
  StatementsBLoC({
    required final IStatementsRepository repositoryStatements,
    required final IAuthRepository authRepository,
    final StatementsState? initialState,
  })  : _repositoryStatements = repositoryStatements,
        _authRepository = authRepository,
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
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  final IStatementsRepository _repositoryStatements;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetchStatementForm(
      StatementsEventFetch event, Emitter<StatementsState> emit) async {
    try {
      emit(StatementsState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      final StatementEntity newData = await _repositoryStatements
          .fetchStatementForm(accessToken: accessToken as String, id: event.id);
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
      StatementsEventCreate event, Emitter<StatementsState> emit) async {}
}
