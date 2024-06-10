import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart';

part 'coins_reward_bloc.freezed.dart';
part 'coins_reward_event.dart';
part 'coins_reward_state.dart';

/// Business Logic Component CoinsRewardBLoC
class CoinsRewardBLoC extends Bloc<CoinsRewardEvent, CoinsRewardState>
    implements EventSink<CoinsRewardEvent> {
  CoinsRewardBLoC({
    required final IWalletRepository walletRepository,
    final CoinsRewardState? initialState,
  })  : _walletRepo = walletRepository,
        super(
          initialState ??
              const CoinsRewardState.idle(
                data: [],
                message: 'Initial idle state',
              ),
        ) {
    on<CoinsRewardEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IWalletRepository _walletRepo;

  /// Fetch event handler
  Future<void> _fetch(
      FetchCoinsRewardEvent event, Emitter<CoinsRewardState> emit) async {
    try {
      emit(CoinsRewardState.processing(data: state.data));
      final newData = await _walletRepo
          .getInfoCoinsReward()
          .timeout(const Duration(seconds: 10));
      emit(CoinsRewardState.successful(data: newData));
    } on TimeoutException {
      emit(CoinsRewardState.error(
          data: state.data, message: 'Ошибка ожидания  запроса!'));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the CoinsRewardBLoC: $err', stackTrace);
      emit(CoinsRewardState.error(data: state.data, message: err.toString()));
      rethrow;
    } finally {
      emit(CoinsRewardState.idle(data: state.data));
    }
  }
}
