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
    on<LeanProductionFormEvent>((event, emit) async {
      if (event is LeanProductionFormEventSubmitForm) {
        await onLeanProductionFormEventSubmit(event, emit);
      } else if (event is LeanProductionFormEventGetMyLeanProductions) {
        await onLeanProductionFormEventGetMyLeanProductions(event, emit);
      }
    });
  }

  Future<void> onLeanProductionFormEventSubmit(
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

  Future<void> onLeanProductionFormEventGetMyLeanProductions(
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
}
