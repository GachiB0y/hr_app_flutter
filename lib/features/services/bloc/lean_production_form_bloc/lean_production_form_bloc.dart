// ignore_for_file: unused_catch_stack

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/api_client_exception.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/view_model_my_lean_productions/view_model_my_lean_productions.dart';
import '../../model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import '../../model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

part 'lean_production_form_bloc.freezed.dart';
part 'lean_production_form_event.dart';
part 'lean_production_form_state.dart';

/// Business Logic Component LeanProductionFormBLoC
class LeanProductionFormBloc
    extends Bloc<LeanProductionFormEvent, LeanProductionFormState>
    implements EventSink<LeanProductionFormEvent> {
  LeanProductionFormBloc({
    required final ILeanProductionRepository repository,
    final LeanProductionFormState? initialState,
  })  : _repositoryLeanProduction = repository,
        super(
          initialState ??
              const LeanProductionFormState.idle(
                data: ViewModelMyLeanProductions(myProposals: []),
                message: 'Initial idle state',
              ),
        ) {
    on<LeanProductionFormEvent>(
      (event, emit) => event.map<Future<void>>(
        getMyLeanProductions: (event) =>
            _onLeanProductionFormEventGetMyLeanProductions(event, emit),
        // createInitState: (event) => _createInitState(emit),
        submitForm: (event) => _onLeanProductionFormEventSubmit(event, emit),
        downloadFileWithLeanProduction: (event) =>
            _downloadFileWithLeanProduction(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final ILeanProductionRepository _repositoryLeanProduction;

  /// Get Leam Production form event handler
  Future<void> _onLeanProductionFormEventGetMyLeanProductions(
      GetMyLeanProductionsLeanProductionFormEvent event,
      Emitter<LeanProductionFormState> emit) async {
    try {
      emit(LeanProductionFormState.processing(data: state.data));

      final List<MyLeanProductionsEntity> myProposals =
          await _repositoryLeanProduction
              .getMyLeanProductions()
              .timeout(const Duration(seconds: 10));
      final newData = ViewModelMyLeanProductions(myProposals: myProposals);

      emit(LeanProductionFormState.successful(data: newData));
    } on TimeoutException {
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the LeanProductionFormBLoC: $err', stackTrace);
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Неизвестная ошибка'));
      rethrow;
    } finally {
      emit(LeanProductionFormState.idle(data: state.data));
    }
  }

  /// Submit form event handler
  Future<void> _onLeanProductionFormEventSubmit(
      SubmitFormLeanProductionFormEvent event,
      Emitter<LeanProductionFormState> emit) async {
    try {
      emit(LeanProductionFormState.processing(data: state.data));

      await _repositoryLeanProduction
          .submitForm(formEntity: event.formEntity)
          .timeout(const Duration(seconds: 10));
      final newData = state.data?.copyWith(isSubmitting: true);
      emit(LeanProductionFormState.successful(data: newData));
    } on TimeoutException {
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
    } on ApiClientException {
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Ошибка отправки формы!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the LeanProductionFormBLoC: $err', stackTrace);
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Неизвестная ошибка'));
      rethrow;
    } finally {
      emit(LeanProductionFormState.idle(data: state.data));
    }
  }

  /// Download File form event handler
  Future<void> _downloadFileWithLeanProduction(
      DownloadFileWithLeanProductionLeanProductionFormEvent event,
      Emitter<LeanProductionFormState> emit) async {
    try {
      emit(LeanProductionFormState.processing(
          data: state.data?.copyWith(isLoadingFile: true)));

      await _repositoryLeanProduction
          .downloadFileWithLeanProduction(
            url: event.url,
          )
          .timeout(const Duration(seconds: 100));
      emit(LeanProductionFormState.processing(
          data: state.data?.copyWith(isLoadingFile: false)));
      emit(LeanProductionFormState.successful(data: state.data));
    } on TimeoutException {
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.openFileDocuments:
          return emit(LeanProductionFormState.error(
              message: 'Ошибка открытия файла!',
              data: state.data?.copyWith(exception: e.type)));
        case ApiClientExceptionType.openFileImage:
          return emit(LeanProductionFormState.error(
              message: 'Ошибка открытия картинки!',
              data: state.data?.copyWith(exception: e.type)));
        default:
          return emit(LeanProductionFormState.error(
              data: state.data, message: 'Неизвестная ошибка'));
      }
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the LeanProductionFormBLoC: $err', stackTrace);
      emit(LeanProductionFormState.error(
          data: state.data, message: 'Неизвестная ошибка'));
      rethrow;
    } finally {
      emit(LeanProductionFormState.idle(data: state.data));
    }
  }
}
