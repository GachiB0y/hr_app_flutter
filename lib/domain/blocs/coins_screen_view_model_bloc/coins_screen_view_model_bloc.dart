import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_info/coins_info.dart';
import 'package:hr_app_flutter/domain/entity/coins_screen/coins_reward/coins_reward.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';

part 'coins_screen_view_model_bloc.freezed.dart';
part 'coins_screen_view_model_bloc.g.dart';
part 'coins_screen_view_model_event.dart';
part 'coins_screen_view_model_state.dart';

class CoinsScreenViewModelBloc
    extends Bloc<CoinsScreenViewModelEvent, CoinsScreenViewModelState> {
  final WalletRepository walletRepo;
  final AuthRepository authRepository;
  CoinsScreenViewModelBloc({
    required this.walletRepo,
    required this.authRepository,
  }) : super(const CoinsScreenViewModelState.loading()) {
    on<CoinsScreenViewModelEvent>((event, emit) async {
      if (event is CoinsScreenViewModelEventFetchInfo) {
        await onCoinsScreenViewModelState(emit);
      } else if (event is CoinsScreenViewModelEventGetCoinsInfo) {
        await onCoinsScreenViewModelEventGetCoinsInfo(emit);
      } else if (event is CoinsScreenViewModelEventGetCoinsReward) {
        await onCoinsScreenViewModelEventGetCoinsReward(emit);
      }
    });
  }

  Future<void> onCoinsScreenViewModelEventGetCoinsReward(
      Emitter<CoinsScreenViewModelState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final List<CoinsReward> listCoinsReward = await walletRepo
          .getInfoCoinsReward(userToken: accessToken as String)
          .timeout(const Duration(seconds: 5));

      if (state is CoinsScreenViewModelStateLoaded) {
        final oldState = (state as CoinsScreenViewModelStateLoaded).copyWith();
        final List<CoinsInfo> currentListCoinsInfo =
            oldState.listCoinsInfoLoaded;
        final newState = CoinsScreenViewModelState.loaded(
            listCoinsInfoLoaded: currentListCoinsInfo,
            listCoinsRewardLoaded: listCoinsReward);

        emit(newState);
      } else {
        final newState = CoinsScreenViewModelState.loaded(
            listCoinsInfoLoaded: [], listCoinsRewardLoaded: listCoinsReward);

        emit(newState);
      }
    } on TimeoutException {
      emit(const CoinsScreenViewModelState.error());
    } catch (e) {
      emit(const CoinsScreenViewModelState.error());
    }
  }

  Future<void> onCoinsScreenViewModelEventGetCoinsInfo(
      Emitter<CoinsScreenViewModelState> emit) async {
    emit(const CoinsScreenViewModelState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      final List<CoinsInfo> listCoinsInfo = await walletRepo
          .getCoinsInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 5));

      if (state is CoinsScreenViewModelStateLoaded) {
        final oldState = (state as CoinsScreenViewModelStateLoaded).copyWith();
        final List<CoinsReward> currentListCoinsReward =
            oldState.listCoinsRewardLoaded;
        final newState = CoinsScreenViewModelState.loaded(
            listCoinsInfoLoaded: listCoinsInfo,
            listCoinsRewardLoaded: currentListCoinsReward);

        emit(newState);
      } else {
        final newState = CoinsScreenViewModelState.loaded(
            listCoinsInfoLoaded: listCoinsInfo, listCoinsRewardLoaded: []);

        emit(newState);
      }
    } on TimeoutException {
      emit(const CoinsScreenViewModelState.error());
    } catch (e) {
      emit(const CoinsScreenViewModelState.error());
    }
  }

  Future<void> onCoinsScreenViewModelState(
      Emitter<CoinsScreenViewModelState> emit) async {
    emit(const CoinsScreenViewModelState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final List<CoinsInfo> listCoinsInfo = await walletRepo
          .getCoinsInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 5));
      final List<CoinsReward> listCoinsReward = await walletRepo
          .getInfoCoinsReward(userToken: accessToken as String)
          .timeout(const Duration(seconds: 5));
      final newState = CoinsScreenViewModelState.loaded(
          listCoinsInfoLoaded: listCoinsInfo,
          listCoinsRewardLoaded: listCoinsReward);

      emit(newState);
    } on TimeoutException {
      emit(const CoinsScreenViewModelState.error());
    } catch (e) {
      emit(const CoinsScreenViewModelState.error());
    }
  }
}
