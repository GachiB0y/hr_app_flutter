import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';

import '../../model/coins_screen/coins_info/coins_info.dart';
import '../../model/coins_screen/coins_reward/coins_reward.dart';

part 'coins_screen_view_model_bloc.freezed.dart';
part 'coins_screen_view_model_bloc.g.dart';
part 'coins_screen_view_model_event.dart';
part 'coins_screen_view_model_state.dart';

class CoinsScreenViewModelBloc
    extends Bloc<CoinsScreenViewModelEvent, CoinsScreenViewModelState> {
  final IWalletRepository walletRepo;
  CoinsScreenViewModelBloc({
    required this.walletRepo,
  }) : super(const CoinsScreenViewModelState.loading()) {
    on<CoinsScreenViewModelEvent>(
      (event, emit) => event.map<Future<void>>(
        fetchInfo: (event) async => await _onCoinsScreenViewModelState(emit),
        getCoinsInfo: (event) async =>
            await _onCoinsScreenViewModelEventGetCoinsInfo(emit),
        getCoinsReward: (event) async =>
            await _onCoinsScreenViewModelEventGetCoinsReward(emit),
      ),
    );
  }

  Future<void> _onCoinsScreenViewModelEventGetCoinsReward(
      Emitter<CoinsScreenViewModelState> emit) async {
    try {
      final List<CoinsReward> listCoinsReward = await walletRepo
          .getInfoCoinsReward()
          .timeout(const Duration(seconds: 10));

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

  Future<void> _onCoinsScreenViewModelEventGetCoinsInfo(
      Emitter<CoinsScreenViewModelState> emit) async {
    emit(const CoinsScreenViewModelState.loading());
    try {
      final List<CoinsInfo> listCoinsInfo =
          await walletRepo.getCoinsInfo().timeout(const Duration(seconds: 10));

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

  Future<void> _onCoinsScreenViewModelState(
      Emitter<CoinsScreenViewModelState> emit) async {
    emit(const CoinsScreenViewModelState.loading());
    try {
      final List<CoinsInfo> listCoinsInfo =
          await walletRepo.getCoinsInfo().timeout(const Duration(seconds: 10));
      final List<CoinsReward> listCoinsReward = await walletRepo
          .getInfoCoinsReward()
          .timeout(const Duration(seconds: 10));
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
