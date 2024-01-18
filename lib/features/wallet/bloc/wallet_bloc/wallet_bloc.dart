// ignore_for_file: unused_catch_stack

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/wallet/wallet.dart';

part 'wallet_bloc.freezed.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

/// Business Logic Component WalletBLoC
class WalletBLoC extends Bloc<WalletEvent, WalletState>
    implements EventSink<WalletEvent> {
  WalletBLoC({
    required final IWalletRepository walletRepo,
    final WalletState? initialState,
  })  : _walletRepo = walletRepo,
        super(
          initialState ??
              const WalletState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<WalletEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
        sendCoinsToBracer: (event) =>
            _onWalletEventSendCoinsToBracer(event, emit),
        sendCoinsToOtherUser: (event) =>
            _onWalletEventSendCoinsToOtherUser(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IWalletRepository _walletRepo;

  /// Fetch event handler
  Future<void> _fetch(FetchWalletEvent event, Emitter<WalletState> emit) async {
    try {
      emit(WalletState.processing(data: state.data));
      final Wallet walletLoaded =
          await _walletRepo.getWallet().timeout(const Duration(seconds: 10));
      emit(WalletState.successful(data: walletLoaded));
    } on TimeoutException {
      emit(WalletState.error(data: state.data));
      rethrow;
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the WalletBLoC: $err', stackTrace);
      emit(WalletState.error(data: state.data));
      rethrow;
    } finally {
      emit(WalletState.idle(data: state.data));
    }
  }

  Future<void> _onWalletEventSendCoinsToOtherUser(
      WalletEventSendCoinsToOtherUser event, Emitter<WalletState> emit) async {
    try {
      emit(WalletState.processing(data: state.data));

      final int newBalance = await _walletRepo
          .sendCoinsToOtherUser(
              amount: event.amount,
              userId: event.userId,
              message: event.message)
          .timeout(const Duration(seconds: 10));
      final newWallet = state.data?.copyWith(balance: newBalance);

      emit(WalletState.successful(data: newWallet));
    } on TimeoutException {
      emit(WalletState.error(data: state.data));
      rethrow;
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the WalletBLoC: $err', stackTrace);
      emit(WalletState.error(data: state.data));
      rethrow;
    } finally {
      emit(WalletState.idle(data: state.data));
    }
  }

  Future<void> _onWalletEventSendCoinsToBracer(
      WalletEventSendCoinsToBracer event, Emitter<WalletState> emit) async {
    try {
      emit(WalletState.processing(data: state.data));

      final int newBalance = await _walletRepo
          .sendCoinsToBracer(
            amount: event.amount,
          )
          .timeout(const Duration(seconds: 10));

      final newWallet = state.data?.copyWith(balance: newBalance);

      emit(WalletState.successful(data: newWallet));
    } on TimeoutException {
      emit(WalletState.error(data: state.data));
      rethrow;
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the WalletBLoC: $err', stackTrace);
      emit(WalletState.error(data: state.data));
      rethrow;
    } finally {
      emit(WalletState.idle(data: state.data));
    }
  }
}
