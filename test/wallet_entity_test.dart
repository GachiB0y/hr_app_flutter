// ignore_for_file: unused_element

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';

import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';
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
  Future<Wallet> getWallet({required String? accessToken}) async {
    return walletPrevios;
  }

  @override
  Future<int> sendCoinsToOtherUser(
      {required String accessToken,
      required int amount,
      required int userId,
      required String message}) async {
    return walletNew.balance;
  }

  @override
  Future<int> sendCoinsToBracer(
      {required String accessToken, required int amount}) async {
    return walletNew.balance;
  }
}

void main() {
  group('Wallet Test BLoC', () {
    // Создайте экземпляры мок-объектов
    late IAuthRepository mockAuthRepository;
    late IWalletRepository mockWalletRepository;
    late IWalletRepository mockWalletRepositoryRelaxed;

    // Создайте экземпляр вашего BLoC
    late WalletBLoC walletBloc;
    late WalletBLoC walletBlocThrow;
    const String accessToken = 'test_access_token';

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом
      mockAuthRepository = MockIAuthRepository();
      mockWalletRepository = FakeWalletRepoImpl();
      mockWalletRepositoryRelaxed = MockIWalletRepository();
      walletBloc = WalletBLoC(
          authRepository: mockAuthRepository, walletRepo: mockWalletRepository);
      walletBlocThrow = WalletBLoC(
          authRepository: mockAuthRepository,
          walletRepo: mockWalletRepositoryRelaxed);
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
      when(mockAuthRepository.cheskIsLiveAccessToken())
          .thenAnswer((_) async => accessToken);
      mockWalletRepository.getWallet(accessToken: accessToken);

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
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockWalletRepositoryRelaxed.getWallet(accessToken: accessToken))
              .thenThrow(Exception('oops'));
        },
        build: () => WalletBLoC(
            authRepository: mockAuthRepository,
            walletRepo: mockWalletRepositoryRelaxed),
        act: (bloc) => bloc.add(const FetchWalletEvent()),
        errors: () => [isA<Exception>()]);
    blocTest<WalletBLoC, WalletState>(
        'emits [processing, error, idle] when getWallet  TimeOutException throws',
        setUp: () {
          when(mockAuthRepository.cheskIsLiveAccessToken())
              .thenAnswer((_) async => accessToken);
          when(mockWalletRepositoryRelaxed.getWallet(accessToken: accessToken))
              .thenThrow(TimeoutException('oops'));
        },
        build: () => WalletBLoC(
            authRepository: mockAuthRepository,
            walletRepo: mockWalletRepositoryRelaxed),
        act: (bloc) => bloc.add(const FetchWalletEvent()),
        errors: () => [isA<TimeoutException>()]);

    blocTest<WalletBLoC, WalletState>(
      'emits WalletState.successful when sendCoinsToOtherUser event is added',
      build: () => walletBloc,
      seed: () {
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        mockWalletRepository.sendCoinsToOtherUser(
            accessToken: accessToken,
            amount: 10,
            userId: 8900,
            message: 'test messange');
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
        when(mockAuthRepository.cheskIsLiveAccessToken())
            .thenAnswer((_) async => accessToken);
        mockWalletRepository.sendCoinsToOtherUser(
            accessToken: accessToken,
            amount: 10,
            userId: 8900,
            message: 'test messange');
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
