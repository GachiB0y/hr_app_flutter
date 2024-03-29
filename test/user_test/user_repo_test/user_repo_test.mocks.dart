// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/user_test/user_repo_test/user_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:hr_app_flutter/features/services/model/birth_day_info/birth_day_info.dart'
    as _i3;
import 'package:hr_app_flutter/features/services/model/rookies_entity/rookies.dart'
    as _i4;
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart'
    as _i5;
import 'package:hr_app_flutter/features/user/model/user/user_info.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

class _FakeUserInfo_0 extends _i1.SmartFake implements _i2.UserInfo {
  _FakeUserInfo_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBirthDayInfoEntity_1 extends _i1.SmartFake
    implements _i3.BirthDayInfoEntity {
  _FakeBirthDayInfoEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRookies_2 extends _i1.SmartFake implements _i4.Rookies {
  _FakeRookies_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$UserInfoCopyWith_3<$Res> extends _i1.SmartFake
    implements _i2.$UserInfoCopyWith<$Res> {
  _Fake$UserInfoCopyWith_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$BirthDayInfoEntityCopyWith_4<$Res> extends _i1.SmartFake
    implements _i3.$BirthDayInfoEntityCopyWith<$Res> {
  _Fake$BirthDayInfoEntityCopyWith_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$RookiesCopyWith_5<$Res> extends _i1.SmartFake
    implements _i4.$RookiesCopyWith<$Res> {
  _Fake$RookiesCopyWith_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IUserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockIUserProvider extends _i1.Mock implements _i5.IUserProvider {
  @override
  _i6.Future<_i2.UserInfo> getUserInfo() => (super.noSuchMethod(
        Invocation.method(
          #getUserInfo,
          [],
        ),
        returnValue: _i6.Future<_i2.UserInfo>.value(_FakeUserInfo_0(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.UserInfo>.value(_FakeUserInfo_0(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
      ) as _i6.Future<_i2.UserInfo>);
  @override
  _i6.Future<bool> saveTagsToSend({
    required List<String>? tags,
    required int? userId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTagsToSend,
          [],
          {
            #tags: tags,
            #userId: userId,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.UserInfo> getUserInfoById({required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInfoById,
          [],
          {#userId: userId},
        ),
        returnValue: _i6.Future<_i2.UserInfo>.value(_FakeUserInfo_0(
          this,
          Invocation.method(
            #getUserInfoById,
            [],
            {#userId: userId},
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.UserInfo>.value(_FakeUserInfo_0(
          this,
          Invocation.method(
            #getUserInfoById,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i6.Future<_i2.UserInfo>);
  @override
  _i6.Future<List<_i2.UserInfo>> findUser({required String? findText}) =>
      (super.noSuchMethod(
        Invocation.method(
          #findUser,
          [],
          {#findText: findText},
        ),
        returnValue: _i6.Future<List<_i2.UserInfo>>.value(<_i2.UserInfo>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.UserInfo>>.value(<_i2.UserInfo>[]),
      ) as _i6.Future<List<_i2.UserInfo>>);
  @override
  _i6.Future<_i3.BirthDayInfoEntity> getBirthDayInfo({
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBirthDayInfo,
          [],
          {
            #startDate: startDate,
            #endDate: endDate,
          },
        ),
        returnValue:
            _i6.Future<_i3.BirthDayInfoEntity>.value(_FakeBirthDayInfoEntity_1(
          this,
          Invocation.method(
            #getBirthDayInfo,
            [],
            {
              #startDate: startDate,
              #endDate: endDate,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.BirthDayInfoEntity>.value(_FakeBirthDayInfoEntity_1(
          this,
          Invocation.method(
            #getBirthDayInfo,
            [],
            {
              #startDate: startDate,
              #endDate: endDate,
            },
          ),
        )),
      ) as _i6.Future<_i3.BirthDayInfoEntity>);
  @override
  _i6.Future<_i4.Rookies> getRookiesInfo({
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRookiesInfo,
          [],
          {
            #startDate: startDate,
            #endDate: endDate,
          },
        ),
        returnValue: _i6.Future<_i4.Rookies>.value(_FakeRookies_2(
          this,
          Invocation.method(
            #getRookiesInfo,
            [],
            {
              #startDate: startDate,
              #endDate: endDate,
            },
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i4.Rookies>.value(_FakeRookies_2(
          this,
          Invocation.method(
            #getRookiesInfo,
            [],
            {
              #startDate: startDate,
              #endDate: endDate,
            },
          ),
        )),
      ) as _i6.Future<_i4.Rookies>);
  @override
  _i6.Future<List<_i2.UserInfo>> getUserByPhoneNumber(
          {required String? phoneNumber}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserByPhoneNumber,
          [],
          {#phoneNumber: phoneNumber},
        ),
        returnValue: _i6.Future<List<_i2.UserInfo>>.value(<_i2.UserInfo>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i2.UserInfo>>.value(<_i2.UserInfo>[]),
      ) as _i6.Future<List<_i2.UserInfo>>);
  @override
  _i6.Future<bool> sendAvatarWithProfile({required List<String>? paths}) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendAvatarWithProfile,
          [],
          {#paths: paths},
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [UserInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserInfo extends _i1.Mock implements _i2.UserInfo {
  @override
  int get autoCard => (super.noSuchMethod(
        Invocation.getter(#autoCard),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);
  @override
  String get nameI => (super.noSuchMethod(
        Invocation.getter(#nameI),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nameI),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nameI),
        ),
      ) as String);
  @override
  String get nameO => (super.noSuchMethod(
        Invocation.getter(#nameO),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nameO),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nameO),
        ),
      ) as String);
  @override
  String get staffPosition => (super.noSuchMethod(
        Invocation.getter(#staffPosition),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#staffPosition),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#staffPosition),
        ),
      ) as String);
  @override
  String get avatar => (super.noSuchMethod(
        Invocation.getter(#avatar),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#avatar),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#avatar),
        ),
      ) as String);
  @override
  List<_i2.TagUser> get tags => (super.noSuchMethod(
        Invocation.getter(#tags),
        returnValue: <_i2.TagUser>[],
        returnValueForMissingStub: <_i2.TagUser>[],
      ) as List<_i2.TagUser>);
  @override
  bool get editTags => (super.noSuchMethod(
        Invocation.getter(#editTags),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get self => (super.noSuchMethod(
        Invocation.getter(#self),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i2.$UserInfoCopyWith<_i2.UserInfo> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$UserInfoCopyWith_3<_i2.UserInfo>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub: _Fake$UserInfoCopyWith_3<_i2.UserInfo>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$UserInfoCopyWith<_i2.UserInfo>);
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

/// A class which mocks [BirthDayInfoEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockBirthDayInfoEntity extends _i1.Mock
    implements _i3.BirthDayInfoEntity {
  @override
  int get count => (super.noSuchMethod(
        Invocation.getter(#count),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  List<_i3.OneBirthDayInfo> get birthdays => (super.noSuchMethod(
        Invocation.getter(#birthdays),
        returnValue: <_i3.OneBirthDayInfo>[],
        returnValueForMissingStub: <_i3.OneBirthDayInfo>[],
      ) as List<_i3.OneBirthDayInfo>);
  @override
  _i3.$BirthDayInfoEntityCopyWith<_i3.BirthDayInfoEntity> get copyWith =>
      (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$BirthDayInfoEntityCopyWith_4<_i3.BirthDayInfoEntity>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub:
            _Fake$BirthDayInfoEntityCopyWith_4<_i3.BirthDayInfoEntity>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i3.$BirthDayInfoEntityCopyWith<_i3.BirthDayInfoEntity>);
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

/// A class which mocks [Rookies].
///
/// See the documentation for Mockito's code generation for more information.
class MockRookies extends _i1.Mock implements _i4.Rookies {
  @override
  int get count => (super.noSuchMethod(
        Invocation.getter(#count),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  List<_i4.OneRookiesInfo> get rookies => (super.noSuchMethod(
        Invocation.getter(#rookies),
        returnValue: <_i4.OneRookiesInfo>[],
        returnValueForMissingStub: <_i4.OneRookiesInfo>[],
      ) as List<_i4.OneRookiesInfo>);
  @override
  _i4.$RookiesCopyWith<_i4.Rookies> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$RookiesCopyWith_5<_i4.Rookies>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub: _Fake$RookiesCopyWith_5<_i4.Rookies>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i4.$RookiesCopyWith<_i4.Rookies>);
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
