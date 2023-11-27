// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/event_entity_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:io' as _i6;

import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart'
    as _i3;
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart'
    as _i5;
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart'
    as _i2;
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

class _FakeEventEntity_0 extends _i1.SmartFake implements _i2.EventEntity {
  _FakeEventEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_1 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWriter_2 extends _i1.SmartFake implements _i2.Writer {
  _FakeWriter_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$EventEntityCopyWith_3<$Res> extends _i1.SmartFake
    implements _i2.$EventEntityCopyWith<$Res> {
  _Fake$EventEntityCopyWith_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$CategoryCopyWith_4<$Res> extends _i1.SmartFake
    implements _i2.$CategoryCopyWith<$Res> {
  _Fake$CategoryCopyWith_4(
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
  MockIAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> isAuth() => (super.noSuchMethod(
        Invocation.method(
          #isAuth,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
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
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String?> cheskIsLiveAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #cheskIsLiveAccessToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
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
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getRefeshTokenInStorage() => (super.noSuchMethod(
        Invocation.method(
          #getRefeshTokenInStorage,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getAccessTokenInStorage() => (super.noSuchMethod(
        Invocation.method(
          #getAccessTokenInStorage,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
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
      ) as bool);
}

/// A class which mocks [IEventEntityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIEventEntityRepository extends _i1.Mock
    implements _i5.IEventEntityRepository {
  MockIEventEntityRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.EventEntity>> getEvents({required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEvents,
          [],
          {#accessToken: accessToken},
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<List<_i2.EventEntity>> getApprovmentEvents(
          {required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getApprovmentEvents,
          [],
          {#accessToken: accessToken},
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<List<_i2.Category>> getCategory({required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [],
          {#accessToken: accessToken},
        ),
        returnValue: _i4.Future<List<_i2.Category>>.value(<_i2.Category>[]),
      ) as _i4.Future<List<_i2.Category>>);
  @override
  _i4.Future<bool> createNewEventEntity({
    required String? accessToken,
    required String? title,
    required String? description,
    required String? startDate,
    required String? endDate,
    required _i6.File? imageFile,
    required List<String>? categories,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewEventEntity,
          [],
          {
            #accessToken: accessToken,
            #title: title,
            #description: description,
            #startDate: startDate,
            #endDate: endDate,
            #imageFile: imageFile,
            #categories: categories,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> approvementNews({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #approvementNews,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.EventEntity> getNewsById({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNewsById,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<_i2.EventEntity>.value(_FakeEventEntity_0(
          this,
          Invocation.method(
            #getNewsById,
            [],
            {
              #accessToken: accessToken,
              #id: id,
            },
          ),
        )),
      ) as _i4.Future<_i2.EventEntity>);
  @override
  _i4.Future<bool> moveInArchiveNews({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #moveInArchiveNews,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [EventEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventEntity extends _i1.Mock implements _i2.EventEntity {
  MockEventEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
      ) as int);
  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
      ) as String);
  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
      ) as String);
  @override
  String get image => (super.noSuchMethod(
        Invocation.getter(#image),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#image),
        ),
      ) as String);
  @override
  DateTime get startDate => (super.noSuchMethod(
        Invocation.getter(#startDate),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#startDate),
        ),
      ) as DateTime);
  @override
  DateTime get createdAt => (super.noSuchMethod(
        Invocation.getter(#createdAt),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#createdAt),
        ),
      ) as DateTime);
  @override
  DateTime get updatedAt => (super.noSuchMethod(
        Invocation.getter(#updatedAt),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#updatedAt),
        ),
      ) as DateTime);
  @override
  bool get isPublish => (super.noSuchMethod(
        Invocation.getter(#isPublish),
        returnValue: false,
      ) as bool);
  @override
  bool get isArchived => (super.noSuchMethod(
        Invocation.getter(#isArchived),
        returnValue: false,
      ) as bool);
  @override
  List<_i2.Category> get categories => (super.noSuchMethod(
        Invocation.getter(#categories),
        returnValue: <_i2.Category>[],
      ) as List<_i2.Category>);
  @override
  _i2.Writer get writer => (super.noSuchMethod(
        Invocation.getter(#writer),
        returnValue: _FakeWriter_2(
          this,
          Invocation.getter(#writer),
        ),
      ) as _i2.Writer);
  @override
  _i2.$EventEntityCopyWith<_i2.EventEntity> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$EventEntityCopyWith_3<_i2.EventEntity>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$EventEntityCopyWith<_i2.EventEntity>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [Category].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategory extends _i1.Mock implements _i2.Category {
  MockCategory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
      ) as int);
  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);
  @override
  _i2.$CategoryCopyWith<_i2.Category> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$CategoryCopyWith_4<_i2.Category>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$CategoryCopyWith<_i2.Category>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [IAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepo extends _i1.Mock implements _i3.IAuthRepository {
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

/// A class which mocks [IEventEntityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventEntityRepo extends _i1.Mock
    implements _i5.IEventEntityRepository {
  @override
  _i4.Future<List<_i2.EventEntity>> getEvents({required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEvents,
          [],
          {#accessToken: accessToken},
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<List<_i2.EventEntity>> getApprovmentEvents(
          {required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getApprovmentEvents,
          [],
          {#accessToken: accessToken},
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<List<_i2.Category>> getCategory({required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [],
          {#accessToken: accessToken},
        ),
        returnValue: _i4.Future<List<_i2.Category>>.value(<_i2.Category>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Category>>.value(<_i2.Category>[]),
      ) as _i4.Future<List<_i2.Category>>);
  @override
  _i4.Future<bool> createNewEventEntity({
    required String? accessToken,
    required String? title,
    required String? description,
    required String? startDate,
    required String? endDate,
    required _i6.File? imageFile,
    required List<String>? categories,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewEventEntity,
          [],
          {
            #accessToken: accessToken,
            #title: title,
            #description: description,
            #startDate: startDate,
            #endDate: endDate,
            #imageFile: imageFile,
            #categories: categories,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> approvementNews({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #approvementNews,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.EventEntity> getNewsById({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNewsById,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<_i2.EventEntity>.value(_FakeEventEntity_0(
          this,
          Invocation.method(
            #getNewsById,
            [],
            {
              #accessToken: accessToken,
              #id: id,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.EventEntity>.value(_FakeEventEntity_0(
          this,
          Invocation.method(
            #getNewsById,
            [],
            {
              #accessToken: accessToken,
              #id: id,
            },
          ),
        )),
      ) as _i4.Future<_i2.EventEntity>);
  @override
  _i4.Future<bool> moveInArchiveNews({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #moveInArchiveNews,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [EventEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsEntity extends _i1.Mock implements _i2.EventEntity {
  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
      ) as String);
  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
      ) as String);
  @override
  String get image => (super.noSuchMethod(
        Invocation.getter(#image),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#image),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#image),
        ),
      ) as String);
  @override
  DateTime get startDate => (super.noSuchMethod(
        Invocation.getter(#startDate),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#startDate),
        ),
        returnValueForMissingStub: _FakeDateTime_1(
          this,
          Invocation.getter(#startDate),
        ),
      ) as DateTime);
  @override
  DateTime get createdAt => (super.noSuchMethod(
        Invocation.getter(#createdAt),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#createdAt),
        ),
        returnValueForMissingStub: _FakeDateTime_1(
          this,
          Invocation.getter(#createdAt),
        ),
      ) as DateTime);
  @override
  DateTime get updatedAt => (super.noSuchMethod(
        Invocation.getter(#updatedAt),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.getter(#updatedAt),
        ),
        returnValueForMissingStub: _FakeDateTime_1(
          this,
          Invocation.getter(#updatedAt),
        ),
      ) as DateTime);
  @override
  bool get isPublish => (super.noSuchMethod(
        Invocation.getter(#isPublish),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get isArchived => (super.noSuchMethod(
        Invocation.getter(#isArchived),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  List<_i2.Category> get categories => (super.noSuchMethod(
        Invocation.getter(#categories),
        returnValue: <_i2.Category>[],
        returnValueForMissingStub: <_i2.Category>[],
      ) as List<_i2.Category>);
  @override
  _i2.Writer get writer => (super.noSuchMethod(
        Invocation.getter(#writer),
        returnValue: _FakeWriter_2(
          this,
          Invocation.getter(#writer),
        ),
        returnValueForMissingStub: _FakeWriter_2(
          this,
          Invocation.getter(#writer),
        ),
      ) as _i2.Writer);
  @override
  _i2.$EventEntityCopyWith<_i2.EventEntity> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$EventEntityCopyWith_3<_i2.EventEntity>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub: _Fake$EventEntityCopyWith_3<_i2.EventEntity>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$EventEntityCopyWith<_i2.EventEntity>);
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
