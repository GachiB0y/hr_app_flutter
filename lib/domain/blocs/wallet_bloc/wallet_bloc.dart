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
    on<WalletEvent>((event, emit) async {
      if (event is WalletEventFetch) {
        emit(const WalletState.loading());

        try {
          String? accessToken = await authRepository.getAccessTokenInStorage();
          final bool isLive =
              authRepository.isLiveToken(jwtToken: accessToken as String);
          if (!isLive) {
            final String? refreshToken =
                await authRepository.getRefeshTokenInStorage();
            final newAccecssToken = await authRepository.makeJwtTokens(
                refreshToken: refreshToken as String);
            accessToken = newAccecssToken;
          }

          final Wallet _walletLoaded = await walletRepo
              .getWallet(accessToken: accessToken as String)
              .timeout(const Duration(seconds: 5));

          final state = WalletState.loaded(walletLoaded: _walletLoaded);

          // final newState = (state as _$WalletStateLoaded)
          //     .copyWith(walletLoaded: Wallet(balance: 5555, transactions: []));

          emit(state);
        } on TimeoutException {
          emit(const WalletState.error());
        } catch (e) {
          emit(const WalletState.error());
        }
      }
    });
  }
}