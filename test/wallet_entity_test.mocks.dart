// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/wallet_entity_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart'
    as _i3;
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart'
    as _i5;
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_info/coins_info.dart'
    as _i6;
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart'
    as _i7;
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
  _i4.Future<bool> isAuth() => (super.noSuchMethod(
        Invocation.method(
          #isAuth,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> isExistToken({required bool? isRefrshToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #isExistToken,
          [],
          {#isRefrshToken: isRefrshToken},
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String?> cheskIsLiveAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #cheskIsLiveAccessToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
        returnValueForMissingStub: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<bool> getCode({required String? numberPhone}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCode,
          [],
          {#numberPhone: numberPhone},
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String?> makeJwtTokens({required String? refreshToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #makeJwtTokens,
          [],
          {#refreshToken: refreshToken},
        ),
        returnValue: _i4.Future<String?>.value(),
        returnValueForMissingStub: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getRefeshTokenInStorage() => (super.noSuchMethod(
        Invocation.method(
          #getRefeshTokenInStorage,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
        returnValueForMissingStub: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getAccessTokenInStorage() => (super.noSuchMethod(
        Invocation.method(
          #getAccessTokenInStorage,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
        returnValueForMissingStub: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<void> login({
    required String? numberPhone,
    required String? code,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
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
  bool isLiveToken({required String? jwtToken}) => (super.noSuchMethod(
        Invocation.method(
          #isLiveToken,
          [],
          {#jwtToken: jwtToken},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [IWalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIWalletRepository extends _i1.Mock implements _i5.IWalletRepository {
  @override
  _i4.Future<_i2.Wallet> getWallet({required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWallet,
          [],
          {#accessToken: accessToken},
        ),
        returnValue: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #getWallet,
            [],
            {#accessToken: accessToken},
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #getWallet,
            [],
            {#accessToken: accessToken},
          ),
        )),
      ) as _i4.Future<_i2.Wallet>);
  @override
  _i4.Future<List<_i6.CoinsInfo>> getCoinsInfo({required String? userToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCoinsInfo,
          [],
          {#userToken: userToken},
        ),
        returnValue: _i4.Future<List<_i6.CoinsInfo>>.value(<_i6.CoinsInfo>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i6.CoinsInfo>>.value(<_i6.CoinsInfo>[]),
      ) as _i4.Future<List<_i6.CoinsInfo>>);
  @override
  _i4.Future<List<_i7.CoinsReward>> getInfoCoinsReward(
          {required String? userToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInfoCoinsReward,
          [],
          {#userToken: userToken},
        ),
        returnValue:
            _i4.Future<List<_i7.CoinsReward>>.value(<_i7.CoinsReward>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i7.CoinsReward>>.value(<_i7.CoinsReward>[]),
      ) as _i4.Future<List<_i7.CoinsReward>>);
  @override
  _i4.Future<int> sendCoinsToOtherUser({
    required String? accessToken,
    required int? amount,
    required int? userId,
    required String? message,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendCoinsToOtherUser,
          [],
          {
            #accessToken: accessToken,
            #amount: amount,
            #userId: userId,
            #message: message,
          },
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<int> sendCoinsToBracer({
    required String? accessToken,
    required int? amount,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendCoinsToBracer,
          [],
          {
            #accessToken: accessToken,
            #amount: amount,
          },
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
