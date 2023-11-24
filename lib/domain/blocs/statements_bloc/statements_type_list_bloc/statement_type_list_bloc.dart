import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/statements/statements.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'dart:async';

import '../../../repository/auth_repository.dart';
import '../../../repository/statements_repository.dart';

part 'statement_type_list_bloc.freezed.dart';
part 'statement_type_list_event.dart';
part 'statement_type_list_state.dart';

/// Business Logic Component StatementTypeListBLoC
class StatementTypeListBLoC
    extends Bloc<StatementTypeListEvent, StatementTypeListState>
    implements EventSink<StatementTypeListEvent> {
  StatementTypeListBLoC({
    required final IStatementsRepository repositoryStatements,
    required final IAuthRepository authRepository,
    final StatementTypeListState? initialState,
  })  : _repositoryStatements = repositoryStatements,
        _authRepository = authRepository,
        super(
          initialState ??
              const StatementTypeListState.idle(
                data: [],
                message: 'Initial idle state',
              ),
        ) {
    on<StatementTypeListEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IStatementsRepository _repositoryStatements;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(FetchStatementTypeListEvent event,
      Emitter<StatementTypeListState> emit) async {
    try {
      emit(StatementTypeListState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      final List<StatementFieldTypeEntity> newData = await _repositoryStatements
          .fetchListTypeStatements(accessToken: accessToken as String);
      emit(StatementTypeListState.successful(data: newData));
    } on TimeoutException {
      emit(StatementTypeListState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the StatementTypeListBLoC: $err', stackTrace);
      emit(StatementTypeListState.error(data: state.data));
      rethrow;
    } finally {
      emit(StatementTypeListState.idle(data: state.data));
    }
  }
}
