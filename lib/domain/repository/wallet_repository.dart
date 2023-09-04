import 'package:hr_app_flutter/domain/api_client/wallet_api_client.dart';

import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';

abstract class WalletRepository {
  Future<Wallet> getWallet({required String accessToken});
}

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({
    required WalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  final WalletProvider _walletProvider;

  @override
  Future<Wallet> getWallet({required String accessToken}) async {
    final int balance =
        await _walletProvider.getBalance(userToken: accessToken);
    final List<Transaction> transactions =
        await _walletProvider.getTransactions(userToken: accessToken);
    final Wallet wallet = Wallet(balance: balance, transactions: transactions);
    return wallet;
  }
}
