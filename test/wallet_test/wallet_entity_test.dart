// ignore_for_file: unused_element

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/wallet/bloc/wallet_bloc/wallet_bloc.dart';

import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:hr_app_flutter/features/wallet/model/wallet/wallet.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wallet_entity_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IAuthRepository>(),
    MockSpec<IWalletRepository>(),
    MockSpec<Wallet>(),
  ],
)
const walletPrevios = Wallet(balance: 100, avarageCoins: 10, transactions: []);
const walletNew = Wallet(balance: 90, avarageCoins: 10, transactions: []);

class FakeWAllet extends Fake implements Wallet {}

final Wallet _mockWallet = MockWallet();

class FakeAuthRepoImpl extends Fake implements IAuthRepository {}

class FakeWalletRepoImpl extends Fake implements IWalletRepository {
  @override
  Future<Wallet> getWallet() async {
    return walletPrevios;
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required int amount,
      required int userId,
      required String message}) async {
    return walletNew.balance;
  }

  @override
  Future<int> sendCoinsToBracer({required int amount}) async {
    return walletNew.balance;
  }
}

void main() {
  group('Wallet Test BLoC', () {
    // Создайте экземпляры мок-объектов

    late IWalletRepository mockWalletRepository;
    late IWalletRepository mockWalletRepositoryRelaxed;

    // Создайте экземпляр вашего BLoC
    late WalletBLoC walletBloc;

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом

      mockWalletRepository = FakeWalletRepoImpl();
      mockWalletRepositoryRelaxed = MockIWalletRepository();
      walletBloc = WalletBLoC(walletRepo: mockWalletRepository);
    });

    tearDown(() {
      walletBloc.close();
    });

    test('initial state is  data null', () {
      expect(walletBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(walletBloc.state, idleState);
    });

    test('emits WalletState.successful when fetch event is added', () async {
      // Arrange
      const wallet = Wallet(balance: 100, avarageCoins: 10, transactions: []);

      mockWalletRepository.getWallet();

      // Act
      walletBloc.add(const FetchWalletEvent());

      await expectLater(
        walletBloc.stream,
        emitsInOrder([
          processingState,
          successfulState.having(
            (state) => state.data,
            'data',
            wallet,
          ),
          idleState,
        ]),
      );
    });

    blocTest<WalletBLoC, WalletState>(
        'emits [processing, error, idle] when getWallet  Exception throws',
        setUp: () {
          when(mockWalletRepositoryRelaxed.getWallet())
              .thenThrow(Exception('oops'));
        },
        build: () => WalletBLoC(walletRepo: mockWalletRepositoryRelaxed),
        act: (bloc) => bloc.add(const FetchWalletEvent()),
        errors: () => [isA<Exception>()]);
    blocTest<WalletBLoC, WalletState>(
        'emits [processing, error, idle] when getWallet  Timeout Exception throws',
        setUp: () {
          when(mockWalletRepositoryRelaxed.getWallet())
              .thenThrow(TimeoutException('oops'));
        },
        build: () => WalletBLoC(walletRepo: mockWalletRepositoryRelaxed),
        act: (bloc) => bloc.add(const FetchWalletEvent()),
        errors: () => [isA<TimeoutException>()]);

    blocTest<WalletBLoC, WalletState>(
      'emits WalletState.successful when sendCoinsToOtherUser event is added',
      build: () => walletBloc,
      seed: () {
        mockWalletRepository.sendCoinsToOtherUser(
            amount: 10, userId: 8900, message: 'test messange');
        return const WalletState.idle(data: walletPrevios);
      },
      act: (bloc) => walletBloc.add(const WalletEventSendCoinsToOtherUser(
          amount: 10, userId: 8900, message: 'test send coin')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'data',
          walletNew,
        ),
        idleState,
      ],
    );

    blocTest<WalletBLoC, WalletState>(
      'emits WalletState.successful when sendCoinsToBracer event is added',
      build: () => walletBloc,
      seed: () {
        mockWalletRepository.sendCoinsToOtherUser(
            amount: 10, userId: 8900, message: 'test messange');
        return const WalletState.idle(data: walletPrevios);
      },
      act: (bloc) => walletBloc.add(const WalletEventSendCoinsToBracer(
        amount: 10,
      )),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'data',
          walletNew,
        ),
        idleState,
      ],
    );
  });
}

const idleState = TypeMatcher<WalletState$Idle>();
const errorState = TypeMatcher<WalletState$Error>();
const processingState = TypeMatcher<WalletState$Processing>();
const successfulState = TypeMatcher<WalletState$Successful>();
