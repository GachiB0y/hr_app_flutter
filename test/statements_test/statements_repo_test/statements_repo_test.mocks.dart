// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/statements_test/statements_repo_test/statements_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_form_bloc/statements_bloc.dart'
    as _i5;
import 'package:hr_app_flutter/features/statements/data/rest_clietns/statement_provider.dart'
    as _i3;
import 'package:hr_app_flutter/features/statements/model/participant/participant.dart'
    as _i6;
import 'package:hr_app_flutter/features/statements/model/statements/statements.dart'
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

class _FakeTemplateFormStatementsEntity_1 extends _i1.SmartFake
    implements _i2.TemplateFormStatementsEntity {
  _FakeTemplateFormStatementsEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$StatementFormInfoToSubmitCopyWith_2<$Res> extends _i1.SmartFake
    implements _i2.$StatementFormInfoToSubmitCopyWith<$Res> {
  _Fake$StatementFormInfoToSubmitCopyWith_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StatementProviderImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockStatementProviderImpl extends _i1.Mock
    implements _i3.StatementProviderImpl {
  @override
  _i4.Future<List<_i2.StatementFieldTypeEntity>> fetchListTypeStatements() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchListTypeStatements,
          [],
        ),
        returnValue: _i4.Future<List<_i2.StatementFieldTypeEntity>>.value(
            <_i2.StatementFieldTypeEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.StatementFieldTypeEntity>>.value(
                <_i2.StatementFieldTypeEntity>[]),
      ) as _i4.Future<List<_i2.StatementFieldTypeEntity>>);
  @override
  _i4.Future<_i2.StatementTempalteEntity> fetchStatementForm(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchStatementForm,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i2.StatementTempalteEntity>.value(
            _FakeStatementTempalteEntity_0(
          this,
          Invocation.method(
            #fetchStatementForm,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.StatementTempalteEntity>.value(
                _FakeStatementTempalteEntity_0(
          this,
          Invocation.method(
            #fetchStatementForm,
            [],
            {#id: id},
          ),
        )),
      ) as _i4.Future<_i2.StatementTempalteEntity>);
  @override
  _i4.Future<_i5.TypeOfAppplicationSigning> submitStatementForm(
          {required _i2.StatementFormInfoToSubmit? formInfo}) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitStatementForm,
          [],
          {#formInfo: formInfo},
        ),
        returnValue: _i4.Future<_i5.TypeOfAppplicationSigning>.value(
            _i5.TypeOfAppplicationSigning.daefult),
        returnValueForMissingStub:
            _i4.Future<_i5.TypeOfAppplicationSigning>.value(
                _i5.TypeOfAppplicationSigning.daefult),
      ) as _i4.Future<_i5.TypeOfAppplicationSigning>);
  @override
  _i4.Future<List<_i6.ParticipantEntity>> findParticipant(
          {required String? name}) =>
      (super.noSuchMethod(
        Invocation.method(
          #findParticipant,
          [],
          {#name: name},
        ),
        returnValue: _i4.Future<List<_i6.ParticipantEntity>>.value(
            <_i6.ParticipantEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i6.ParticipantEntity>>.value(
                <_i6.ParticipantEntity>[]),
      ) as _i4.Future<List<_i6.ParticipantEntity>>);
  @override
  _i4.Future<void> signDocumentBySmsCode({required String? code}) =>
      (super.noSuchMethod(
        Invocation.method(
          #signDocumentBySmsCode,
          [],
          {#code: code},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [StatementFormInfoToSubmit].
///
/// See the documentation for Mockito's code generation for more information.
class MockStatementFormInfoToSubmit extends _i1.Mock
    implements _i2.StatementFormInfoToSubmit {
  @override
  String get documentType => (super.noSuchMethod(
        Invocation.getter(#documentType),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#documentType),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#documentType),
        ),
      ) as String);
  @override
  String get participantsTo => (super.noSuchMethod(
        Invocation.getter(#participantsTo),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#participantsTo),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#participantsTo),
        ),
      ) as String);
  @override
  _i2.TemplateFormStatementsEntity get template => (super.noSuchMethod(
        Invocation.getter(#template),
        returnValue: _FakeTemplateFormStatementsEntity_1(
          this,
          Invocation.getter(#template),
        ),
        returnValueForMissingStub: _FakeTemplateFormStatementsEntity_1(
          this,
          Invocation.getter(#template),
        ),
      ) as _i2.TemplateFormStatementsEntity);
  @override
  _i2.$StatementFormInfoToSubmitCopyWith<_i2.StatementFormInfoToSubmit>
      get copyWith => (super.noSuchMethod(
            Invocation.getter(#copyWith),
            returnValue: _Fake$StatementFormInfoToSubmitCopyWith_2<
                _i2.StatementFormInfoToSubmit>(
              this,
              Invocation.getter(#copyWith),
            ),
            returnValueForMissingStub:
                _Fake$StatementFormInfoToSubmitCopyWith_2<
                    _i2.StatementFormInfoToSubmit>(
              this,
              Invocation.getter(#copyWith),
            ),
          ) as _i2.$StatementFormInfoToSubmitCopyWith<
              _i2.StatementFormInfoToSubmit>);
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
