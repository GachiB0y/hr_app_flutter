// ignore_for_file: unused_catch_stack

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'wallet_bloc.freezed.dart';
// part 'wallet_bloc.g.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

// class WalletBLoC extends Bloc<WalletEvent, WalletState> {
//   final IWalletRepository walletRepo;
//   final IAuthRepository authRepository;
//   WalletBLoC({
//     required this.walletRepo,
//     required this.authRepository,
//   }) : super(const WalletState.loading()) {
//     on<WalletEvent>(
//       (event, emit) => event.map<Future<void>>(
//         fetch: (event) async => await _onWalletEventFetch(emit),
//         sendCoinsToBracer: (event) =>
//             _onWalletEventSendCoinsToBracer(event, emit),
//         sendCoinsToOtherUser: (event) async =>
//             await _onWalletEventSendCoinsToOtherUser(event, emit),
//       ),
//     );
//   }

//   Future<void> _onWalletEventSendCoinsToOtherUser(
//       WalletEventSendCoinsToOtherUser event, Emitter<WalletState> emit) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();

//       final int newBalance = await walletRepo
//           .sendCoinsToOtherUser(
//               accessToken: accessToken,
//               amount: event.amount,
//               userId: event.userId,
//               message: event.message)
//           .timeout(const Duration(seconds: 10));

//       final oldState = (state as WalletStateLoaded).copyWith();
//       final List<Transaction>? oldTransactions =
//           oldState.walletLoaded.transactions;

//       final int oldAvarageCoins = oldState.walletLoaded.avarageCoins;

//       final newState = (state as WalletStateLoaded).copyWith(
//           walletLoaded: Wallet(
//               balance: newBalance,
//               transactions: oldTransactions,
//               avarageCoins: oldAvarageCoins));

//       emit(newState);
//     } on TimeoutException {
//       emit(const WalletState.error());
//     } catch (e) {
//       emit(const WalletState.error());
//     }
//   }

//   Future<void> _onWalletEventFetch(Emitter<WalletState> emit) async {
//     emit(const WalletState.loading());

//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();
//       final Wallet walletLoaded = await walletRepo
//           .getWallet(accessToken: accessToken as String)
//           .timeout(const Duration(seconds: 10));

//       final state = WalletState.loaded(walletLoaded: walletLoaded);

//       emit(state);
//     } on TimeoutException {
//       emit(const WalletState.error());
//     } catch (e) {
//       emit(const WalletState.error());
//     }
//   }

//   Future<void> _onWalletEventSendCoinsToBracer(
//       WalletEventSendCoinsToBracer event, Emitter<WalletState> emit) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();

//       final int newBalance = await walletRepo
//           .sendCoinsToBracer(
//             accessToken: accessToken as String,
//             amount: event.amount,
//           )
//           .timeout(const Duration(seconds: 10));

//       final oldState = (state as WalletStateLoaded).copyWith();
//       final List<Transaction>? oldTransactions =
//           oldState.walletLoaded.transactions;

//       final int oldAvarageCoins = oldState.walletLoaded.avarageCoins;

//       final newState = (state as WalletStateLoaded).copyWith(
//           walletLoaded: Wallet(
//               balance: newBalance,
//               transactions: oldTransactions,
//               avarageCoins: oldAvarageCoins));

//       emit(newState);
//     } on TimeoutException {
//       emit(const WalletState.error());
//     } catch (e) {
//       emit(const WalletState.error());
//     }
//   }
// }

/// Business Logic Component WalletBLoC
class WalletBLoC extends Bloc<WalletEvent, WalletState>
    implements EventSink<WalletEvent> {
  WalletBLoC({
    required final IWalletRepository walletRepo,
    required final IAuthRepository authRepository,
    final WalletState? initialState,
  })  : _walletRepo = walletRepo,
        _authRepository = authRepository,
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
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(FetchWalletEvent event, Emitter<WalletState> emit) async {
    try {
      emit(WalletState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      final Wallet walletLoaded = await _walletRepo
          .getWallet(accessToken: accessToken as String)
          .timeout(const Duration(seconds: 10));
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
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      final int newBalance = await _walletRepo
          .sendCoinsToOtherUser(
              accessToken: accessToken as String,
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
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      final int newBalance = await _walletRepo
          .sendCoinsToBracer(
            accessToken: accessToken as String,
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
