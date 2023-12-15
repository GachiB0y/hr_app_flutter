import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:hr_app_flutter/features/wallet/data/rest_clients/wallet_api_client.dart';
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_info/coins_info.dart';
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart';
import 'package:hr_app_flutter/features/wallet/model/wallet/wallet.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../wallet_entity_test.mocks.dart';
import 'wallet_repo_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IWalletProvider>(),
    MockSpec<CoinsInfo>(),
    MockSpec<CoinsReward>(),
  ],
)
void main() {
  group('WalletRepository', () {
    late IWalletProvider walletApiClient;
    late IWalletRepository walletRepository;
    const String accessToken = 'test_access_token';

    setUp(() {
// Создаем экземпляры мок-объектов
      walletApiClient = MockIWalletProvider();
// Создаем репозиторий
      walletRepository = WalletRepositoryImpl(
        walletProvider: walletApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal statements api client when not injected', () {
        expect(walletRepository, isNotNull);
      });
    });

//getWallet
    group('getWallet', () {
      test('calls getBalance with correct', () async {
        try {
          await walletRepository.getWallet(accessToken: accessToken);
        } catch (_) {}
        verify(walletApiClient.getBalance(accessToken: accessToken)).called(1);
      });
      test('throws when getBalance fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.getBalance(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => walletRepository.getWallet(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('calls getTransactions with correct', () async {
        try {
          await walletRepository.getWallet(accessToken: accessToken);
        } catch (_) {}
        verify(walletApiClient.getTransactions(accessToken: accessToken))
            .called(1);
      });
      test('throws when getTransactions fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.getTransactions(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => walletRepository.getWallet(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getWallet get', () async {
//Создаем баланс
        const ({int avarageCoins, int balance}) allBalance =
            (avarageCoins: 5, balance: 100);
// Создаем транзакции
        List<Transaction> listTransaction = MockWallet().transactions ?? [];
        when(walletApiClient.getBalance(accessToken: accessToken))
            .thenAnswer((_) async => allBalance);
        when(walletApiClient.getTransactions(accessToken: accessToken))
            .thenAnswer((_) async => listTransaction);
        final actual =
            await walletRepository.getWallet(accessToken: accessToken);
        expect(
            actual,
            Wallet(
                balance: allBalance.balance,
                avarageCoins: allBalance.avarageCoins,
                transactions: listTransaction));
      });
    });
//getCoinsInfo
    group('getCoinsInfo', () {
      test('calls getCoinsInfo with correct', () async {
        try {
          await walletRepository.getCoinsInfo(accessToken: accessToken);
        } catch (_) {}
        verify(walletApiClient.getCoinsInfo(accessToken: accessToken))
            .called(1);
      });
      test('throws when getCoinsInfo fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.getCoinsInfo(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async => walletRepository.getCoinsInfo(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getCoinsInfo get', () async {
//Создаем CoinsInfo
        final CoinsInfo coinsInfoFirst = MockCoinsInfo();
//Создаем list CoinsInfo
        final List<CoinsInfo> listInfo = [coinsInfoFirst];

        when(walletApiClient.getCoinsInfo(accessToken: accessToken))
            .thenAnswer((_) async => listInfo);

        final actual =
            await walletRepository.getCoinsInfo(accessToken: accessToken);
        expect(actual, listInfo);
      });
    });

//getInfoCoinsReward
    group('getInfoCoinsReward', () {
      test('calls getInfoCoinsReward with correct', () async {
        try {
          await walletRepository.getInfoCoinsReward(accessToken: accessToken);
        } catch (_) {}
        verify(walletApiClient.getInfoCoinsReward(accessToken: accessToken))
            .called(1);
      });
      test('throws when getInfoCoinsReward fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.getInfoCoinsReward(accessToken: accessToken))
            .thenThrow(exception);

        expect(
          () async =>
              walletRepository.getInfoCoinsReward(accessToken: accessToken),
          throwsA(exception),
        );
      });

      test('succesfull when getInfoCoinsReward get', () async {
//Создаем CoinsReward
        final CoinsReward coinsRewardFirst = MockCoinsReward();
//Создаем list CoinsReward
        final List<CoinsReward> listInfo = [coinsRewardFirst];

        when(walletApiClient.getInfoCoinsReward(accessToken: accessToken))
            .thenAnswer((_) async => listInfo);

        final actual =
            await walletRepository.getInfoCoinsReward(accessToken: accessToken);
        expect(actual, listInfo);
      });
    });
//sendCoinsToOtherUser
    group('sendCoinsToOtherUser', () {
      const int amount = 1;
      const int userId = 8900;
      test('calls sendCoinsToOtherUser with correct', () async {
        try {
          await walletRepository.sendCoinsToOtherUser(
              accessToken: accessToken,
              amount: amount,
              userId: userId,
              message: '');
        } catch (_) {}
        verify(walletApiClient.sendCoinsToOtherUser(
                accessToken: accessToken,
                amount: amount,
                userId: userId,
                message: ''))
            .called(1);
      });
      test('throws when sendCoinsToOtherUser fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.sendCoinsToOtherUser(
                accessToken: accessToken,
                amount: amount,
                userId: userId,
                message: ''))
            .thenThrow(exception);

        expect(
          () async => walletRepository.sendCoinsToOtherUser(
              accessToken: accessToken,
              amount: amount,
              userId: userId,
              message: ''),
          throwsA(exception),
        );
      });

      test('succesfull when sendCoinsToOtherUser get', () async {
//Создаем значение для нового баланса
        const int newBalance = 9;

        when(walletApiClient.sendCoinsToOtherUser(
                accessToken: accessToken,
                amount: amount,
                userId: userId,
                message: ''))
            .thenAnswer((_) async => newBalance);

        final actual = await walletRepository.sendCoinsToOtherUser(
            accessToken: accessToken,
            amount: amount,
            userId: userId,
            message: '');
        expect(actual, newBalance);
      });
    });

//sendCoinsToBracer
    group('sendCoinsToBracer', () {
      const int amount = 1;

      test('calls sendCoinsToBracer with correct', () async {
        try {
          await walletRepository.sendCoinsToBracer(
            accessToken: accessToken,
            amount: amount,
          );
        } catch (_) {}
        verify(walletApiClient.sendCoinsToBracer(
          accessToken: accessToken,
          amount: amount,
        )).called(1);
      });
      test('throws when sendCoinsToBracer fails', () async {
        final exception = Exception('oops');

        when(walletApiClient.sendCoinsToBracer(
          accessToken: accessToken,
          amount: amount,
        )).thenThrow(exception);

        expect(
          () async => walletRepository.sendCoinsToBracer(
            accessToken: accessToken,
            amount: amount,
          ),
          throwsA(exception),
        );
      });

      test('succesfull when sendCoinsToBracer get', () async {
//Создаем значение для нового баланса
        const int newBalance = 9;

        when(walletApiClient.sendCoinsToBracer(
          accessToken: accessToken,
          amount: amount,
        )).thenAnswer((_) async => newBalance);

        final actual = await walletRepository.sendCoinsToBracer(
          accessToken: accessToken,
          amount: amount,
        );
        expect(actual, newBalance);
      });
    });
  });
}
