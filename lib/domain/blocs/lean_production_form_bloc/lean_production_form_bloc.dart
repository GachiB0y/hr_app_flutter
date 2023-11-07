import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
import 'package:hr_app_flutter/domain/entity/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/domain/entity/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/lean_production_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'lean_production_form_bloc.freezed.dart';
part 'lean_production_form_bloc.g.dart';
part 'lean_production_form_event.dart';
part 'lean_production_form_state.dart';

class LeanProductionFormBloc
    extends Bloc<LeanProductionFormEvent, LeanProductionFormState> {
  final UserRepository userRepo;
  final AuthRepository authRepository;
  final LeanProductionRepository leanRepository;

  LeanProductionFormBloc({
    required this.userRepo,
    required this.authRepository,
    required this.leanRepository,
  }) : super(const LeanProductionFormState.loading()) {
    on<LeanProductionFormEvent>(
      (event, emit) => event.map<Future<void>>(
          getMyLeanProductions: (event) =>
              _onLeanProductionFormEventGetMyLeanProductions(event, emit),
          createInitState: (event) => _createInitState(emit),
          submitForm: (event) => _onLeanProductionFormEventSubmit(event, emit),
          downloadFileWithLeanProduction: (event) =>
              downloadFileWithLeanProduction(event, emit)),
    );
  }

  Future<void> _createInitState(Emitter<LeanProductionFormState> emit) async =>
      emit(const LeanProductionFormState.loading());

  Future<void> _onLeanProductionFormEventSubmit(
      LeanProductionFormEventSubmitForm event,
      Emitter<LeanProductionFormState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      await leanRepository
          .submitForm(
              userToken: accessToken as String, formEntity: event.formEntity)
          .timeout(const Duration(seconds: 10));

      emit(const LeanProductionFormState.loaded(isSubmitting: true));
    } on TimeoutException {
      emit(const LeanProductionFormState.error(
          errorText: 'Ошибка ожидания  запроса!'));
    } on ApiClientException {
      emit(const LeanProductionFormState.error(
          errorText: 'Ошибка отправки формы!'));
    } catch (e) {
      emit(
          const LeanProductionFormState.error(errorText: 'Неизвестная ошибка'));
    }
  }

  Future<void> _onLeanProductionFormEventGetMyLeanProductions(
      LeanProductionFormEventGetMyLeanProductions event,
      Emitter<LeanProductionFormState> emit) async {
    emit(const LeanProductionFormState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final List<MyLeanProductionsEntity> myProposals = await leanRepository
          .getMyLeanProductions(
            userToken: accessToken as String,
          )
          .timeout(const Duration(seconds: 10));

      emit(LeanProductionFormState.loaded(myProposals: myProposals));
    } on TimeoutException {
      emit(const LeanProductionFormState.error(
          errorText: 'Ошибка ожидания  запроса!'));
    } catch (e) {
      emit(
          const LeanProductionFormState.error(errorText: 'Неизвестная ошибка'));
    }
  }

  Future<void> downloadFileWithLeanProduction(
      LeanProductionFormEventDownloadFileWithLeanProduction event,
      Emitter<LeanProductionFormState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      emit(const LeanProductionFormState.loaded());
      final isLoadingState = (state as LeanProductionFormStateLoaded)
          .copyWith(isLoadingFile: true);
      emit(isLoadingState);
      await leanRepository
          .downloadFileWithLeanProduction(
            userToken: accessToken as String,
            url: event.url,
          )
          .timeout(const Duration(seconds: 100));
      final isLoadedState = (state as LeanProductionFormStateLoaded)
          .copyWith(isLoadingFile: false);
      emit(isLoadedState);
    } on TimeoutException {
      emit(const LeanProductionFormState.error(
          errorText: 'Ошибка ожидания  запроса!'));
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.openFileDocuments:
          return emit(LeanProductionFormState.error(
              errorText: 'Ошибка открытия файла!', exception: e.type));
        case ApiClientExceptionType.openFileImage:
          return emit(LeanProductionFormState.error(
              errorText: 'Ошибка открытия картинки!', exception: e.type));
        default:
          return emit(const LeanProductionFormState.error(
              errorText: 'Неизвестная ошибка'));
      }
    } catch (e) {
      emit(
          const LeanProductionFormState.error(errorText: 'Неизвестная ошибка'));
    }
  }
}
