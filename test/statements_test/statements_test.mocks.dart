// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/statements_test/statements_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart'
    as _i3;
import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_form_bloc/statements_bloc.dart'
    as _i6;
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart'
    as _i5;
import 'package:hr_app_flutter/features/statements/model/participant/participant.dart'
    as _i7;
import 'package:hr_app_flutter/features/statements/model/statements/statements.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

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

class _FakeStatementTempalteEntity_0 extends _i1.SmartFake
    implements _i2.StatementTempalteEntity {
  _FakeStatementTempalteEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$StatementTempalteEntityCopyWith_1<$Res> extends _i1.SmartFake
    implements _i2.$StatementTempalteEntityCopyWith<$Res> {
  _Fake$StatementTempalteEntityCopyWith_1(
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

/// A class which mocks [IStatementsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIStatementsRepository extends _i1.Mock
    implements _i5.IStatementsRepository {
  @override
  _i4.Future<List<_i2.StatementFieldTypeEntity>> fetchListTypeStatements(
          {required String? accessToken}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchListTypeStatements,
          [],
          {#accessToken: accessToken},
        ),
        returnValue: _i4.Future<List<_i2.StatementFieldTypeEntity>>.value(
            <_i2.StatementFieldTypeEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.StatementFieldTypeEntity>>.value(
                <_i2.StatementFieldTypeEntity>[]),
      ) as _i4.Future<List<_i2.StatementFieldTypeEntity>>);
  @override
  _i4.Future<_i2.StatementTempalteEntity> fetchStatementForm({
    required String? accessToken,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchStatementForm,
          [],
          {
            #accessToken: accessToken,
            #id: id,
          },
        ),
        returnValue: _i4.Future<_i2.StatementTempalteEntity>.value(
            _FakeStatementTempalteEntity_0(
          this,
          Invocation.method(
            #fetchStatementForm,
            [],
            {
              #accessToken: accessToken,
              #id: id,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.StatementTempalteEntity>.value(
                _FakeStatementTempalteEntity_0(
          this,
          Invocation.method(
            #fetchStatementForm,
            [],
            {
              #accessToken: accessToken,
              #id: id,
            },
          ),
        )),
      ) as _i4.Future<_i2.StatementTempalteEntity>);
  @override
  _i4.Future<_i6.TypeOfAppplicationSigning> submitStatementForm({
    required String? accessToken,
    required _i2.StatementFormInfoToSubmit? formInfo,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitStatementForm,
          [],
          {
            #accessToken: accessToken,
            #formInfo: formInfo,
          },
        ),
        returnValue: _i4.Future<_i6.TypeOfAppplicationSigning>.value(
            _i6.TypeOfAppplicationSigning.daefult),
        returnValueForMissingStub:
            _i4.Future<_i6.TypeOfAppplicationSigning>.value(
                _i6.TypeOfAppplicationSigning.daefult),
      ) as _i4.Future<_i6.TypeOfAppplicationSigning>);
  @override
  _i4.Future<List<_i7.ParticipantEntity>> findParticipant({
    required String? accessToken,
    required String? name,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #findParticipant,
          [],
          {
            #accessToken: accessToken,
            #name: name,
          },
        ),
        returnValue: _i4.Future<List<_i7.ParticipantEntity>>.value(
            <_i7.ParticipantEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i7.ParticipantEntity>>.value(
                <_i7.ParticipantEntity>[]),
      ) as _i4.Future<List<_i7.ParticipantEntity>>);
  @override
  _i4.Future<void> signDocumentBySmsCode({
    required String? accessToken,
    required String? code,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signDocumentBySmsCode,
          [],
          {
            #accessToken: accessToken,
            #code: code,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [StatementTempalteEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockStatementTempalteEntity extends _i1.Mock
    implements _i2.StatementTempalteEntity {
  @override
  String get documentType => (super.noSuchMethod(
        Invocation.getter(#documentType),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#documentType),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.getter(#documentType),
        ),
      ) as String);
  @override
  List<_i2.TemplateField> get template => (super.noSuchMethod(
        Invocation.getter(#template),
        returnValue: <_i2.TemplateField>[],
        returnValueForMissingStub: <_i2.TemplateField>[],
      ) as List<_i2.TemplateField>);
  @override
  _i2.$StatementTempalteEntityCopyWith<_i2.StatementTempalteEntity>
      get copyWith => (super.noSuchMethod(
            Invocation.getter(#copyWith),
            returnValue: _Fake$StatementTempalteEntityCopyWith_1<
                _i2.StatementTempalteEntity>(
              this,
              Invocation.getter(#copyWith),
            ),
            returnValueForMissingStub: _Fake$StatementTempalteEntityCopyWith_1<
                _i2.StatementTempalteEntity>(
              this,
              Invocation.getter(#copyWith),
            ),
          ) as _i2
              .$StatementTempalteEntityCopyWith<_i2.StatementTempalteEntity>);
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