import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_bloc.g.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepo;
  WalletBloc({required this.walletRepo}) : super(const WalletState.loading()) {
    on<WalletEvent>((event, emit) async {
      if (event is WalletEventFetch) {
        emit(const WalletState.loading());

        try {
          Wallet _walletLoaded = await walletRepo
              .getBalance(userToken: event.userToken)
              .timeout(const Duration(seconds: 5));
          await Future<void>.delayed(const Duration(seconds: 3));
          final state = WalletState.loaded(walletLoaded: _walletLoaded);

          final newState = (state as _$WalletStateLoaded)
              .copyWith(walletLoaded: Wallet(balance: 5555));

          emit(newState);
        } on TimeoutException {
          emit(const WalletState.error());
        } catch (e) {
          emit(const WalletState.error());
        }
      }
    });
  }
}
