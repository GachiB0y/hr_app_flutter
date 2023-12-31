import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';

import '../../model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import '../../model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

part 'lean_production_form_bloc.freezed.dart';
part 'lean_production_form_bloc.g.dart';
part 'lean_production_form_event.dart';
part 'lean_production_form_state.dart';

class LeanProductionFormBloc
    extends Bloc<LeanProductionFormEvent, LeanProductionFormState> {
  final IUserRepository userRepo;
  final IAuthRepository authRepository;
  final ILeanProductionRepository leanRepository;

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
              accessToken: accessToken as String, formEntity: event.formEntity)
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
            accessToken: accessToken as String,
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
            accessToken: accessToken as String,
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
