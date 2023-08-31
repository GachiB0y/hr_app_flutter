import 'package:hr_app_flutter/domain/api_client/wallet_api_client.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';

abstract class WalletRepository {
  Future<Wallet> getBalance({required String userToken});
}

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({
    required WalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  final WalletProvider _walletProvider;

  @override
  Future<Wallet> getBalance({required String userToken}) {
    return _walletProvider.getBalance(userToken: userToken);
  }
}
