import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_bloc.g.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepo;
  final AuthRepository authRepository;
  WalletBloc({
    required this.walletRepo,
    required this.authRepository,
  }) : super(const WalletState.loading()) {
    on<WalletEvent>(
      (event, emit) async {
        if (event is WalletEventFetch) {
          await onWalletEventFetch(emit);
        } else if (event is WalletEventSendCoinsToOtherUser) {
          await onWalletEventSendCoinsToOtherUser(event, emit);
        } else if (event is WalletEventSendCoinsToBracer) {
          await onWalletEventSendCoinsToBracer(event, emit);
        }
      },
    );
  }

  Future<void> onWalletEventSendCoinsToOtherUser(
      WalletEventSendCoinsToOtherUser event, Emitter<WalletState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final int newBalance = await walletRepo
          .sendCoinsToOtherUser(
              accessToken: accessToken as String,
              amount: event.amount,
              userId: event.userId,
              message: event.message)
          .timeout(const Duration(seconds: 10));

      final oldState = (state as WalletStateLoaded).copyWith();
      final List<Transaction>? transactions =
          oldState.walletLoaded.transactions;

      final newState = (state as WalletStateLoaded).copyWith(
          walletLoaded:
              Wallet(balance: newBalance, transactions: transactions));

      emit(newState);
    } on TimeoutException {
      emit(const WalletState.error());
    } catch (e) {
      emit(const WalletState.error());
    }
  }

  Future<void> onWalletEventFetch(Emitter<WalletState> emit) async {
    emit(const WalletState.loading());

    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();
      final Wallet _walletLoaded = await walletRepo
          .getWallet(accessToken: accessToken as String)
          .timeout(const Duration(seconds: 10));

      final state = WalletState.loaded(walletLoaded: _walletLoaded);

      emit(state);
    } on TimeoutException {
      emit(const WalletState.error());
    } catch (e) {
      emit(const WalletState.error());
    }
  }

  Future<void> onWalletEventSendCoinsToBracer(
      WalletEventSendCoinsToBracer event, Emitter<WalletState> emit) async {
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      final int newBalance = await walletRepo
          .sendCoinsToBracer(
            accessToken: accessToken as String,
            amount: event.amount,
          )
          .timeout(const Duration(seconds: 10));

      final oldState = (state as WalletStateLoaded).copyWith();
      final List<Transaction>? transactions =
          oldState.walletLoaded.transactions;

      final newState = (state as WalletStateLoaded).copyWith(
          walletLoaded:
              Wallet(balance: newBalance, transactions: transactions));

      emit(newState);
    } on TimeoutException {
      emit(const WalletState.error());
    } catch (e) {
      emit(const WalletState.error());
    }
  }
}
