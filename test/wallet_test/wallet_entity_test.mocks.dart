// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/wallet_test/wallet_entity_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart'
    as _i5;
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart'
    as _i3;
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart'
    as _i6;
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_info/coins_info.dart'
    as _i7;
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart'
    as _i8;
import 'package:hr_app_flutter/features/wallet/model/wallet/wallet.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWallet_0 extends _i1.SmartFake implements _i2.Wallet {
  _FakeWallet_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$WalletCopyWith_1<$Res> extends _i1.SmartFake
    implements _i2.$WalletCopyWith<$Res> {
  _Fake$WalletCopyWith_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthRepository extends _i1.Mock implements _i3.IAuthRepository {
  @override
  _i4.Future<void> getCode({required String? numberPhone}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCode,
          [],
          {#numberPhone: numberPhone},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> signInWithPhoneAndCode({
    required String? numberPhone,
    required String? code,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithPhoneAndCode,
          [],
          {
            #numberPhone: numberPhone,
            #code: code,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Stream<_i5.AuthenticationStatus> getAuthStateChanges() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAuthStateChanges,
          [],
        ),
        returnValue: _i4.Stream<_i5.AuthenticationStatus>.empty(),
        returnValueForMissingStub: _i4.Stream<_i5.AuthenticationStatus>.empty(),
      ) as _i4.Stream<_i5.AuthenticationStatus>);
}

/// A class which mocks [IWalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIWalletRepository extends _i1.Mock implements _i6.IWalletRepository {
  @override
  _i4.Future<_i2.Wallet> getWallet() => (super.noSuchMethod(
        Invocation.method(
          #getWallet,
          [],
        ),
        returnValue: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #getWallet,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #getWallet,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Wallet>);
  @override
  _i4.Future<List<_i7.CoinsInfo>> getCoinsInfo() => (super.noSuchMethod(
        Invocation.method(
          #getCoinsInfo,
          [],
        ),
        returnValue: _i4.Future<List<_i7.CoinsInfo>>.value(<_i7.CoinsInfo>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i7.CoinsInfo>>.value(<_i7.CoinsInfo>[]),
      ) as _i4.Future<List<_i7.CoinsInfo>>);
  @override
  _i4.Future<List<_i8.CoinsReward>> getInfoCoinsReward() => (super.noSuchMethod(
        Invocation.method(
          #getInfoCoinsReward,
          [],
        ),
        returnValue:
            _i4.Future<List<_i8.CoinsReward>>.value(<_i8.CoinsReward>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i8.CoinsReward>>.value(<_i8.CoinsReward>[]),
      ) as _i4.Future<List<_i8.CoinsReward>>);
  @override
  _i4.Future<int> sendCoinsToOtherUser({
    required int? amount,
    required int? userId,
    required String? message,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendCoinsToOtherUser,
          [],
          {
            #amount: amount,
            #userId: userId,
            #message: message,
          },
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<int> sendCoinsToBracer({required int? amount}) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendCoinsToBracer,
          [],
          {#amount: amount},
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
}

/// A class which mocks [Wallet].
///
/// See the documentation for Mockito's code generation for more information.
class MockWallet extends _i1.Mock implements _i2.Wallet {
  @override
  int get balance => (super.noSuchMethod(
        Invocation.getter(#balance),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  int get avarageCoins => (super.noSuchMethod(
        Invocation.getter(#avarageCoins),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i2.$WalletCopyWith<_i2.Wallet> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$WalletCopyWith_1<_i2.Wallet>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub: _Fake$WalletCopyWith_1<_i2.Wallet>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$WalletCopyWith<_i2.Wallet>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
