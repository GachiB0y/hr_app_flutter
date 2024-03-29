// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/event_entity_test/event_entity_repo_test/event_entity_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart'
    as _i3;
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

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

/// A class which mocks [IEventsEntityProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockIEventsEntityProvider extends _i1.Mock
    implements _i3.IEventsEntityProvider {
  @override
  _i4.Future<List<_i2.EventEntity>> getEvents() => (super.noSuchMethod(
        Invocation.method(
          #getEvents,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<_i2.EventEntity> getNewsById({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNewsById,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i2.EventEntity>.value(_FakeEventEntity_0(
          this,
          Invocation.method(
            #getNewsById,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.EventEntity>.value(_FakeEventEntity_0(
          this,
          Invocation.method(
            #getNewsById,
            [],
            {#id: id},
          ),
        )),
      ) as _i4.Future<_i2.EventEntity>);
  @override
  _i4.Future<List<_i2.EventEntity>> getApprovmentEvents() =>
      (super.noSuchMethod(
        Invocation.method(
          #getApprovmentEvents,
          [],
        ),
        returnValue:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.EventEntity>>.value(<_i2.EventEntity>[]),
      ) as _i4.Future<List<_i2.EventEntity>>);
  @override
  _i4.Future<List<_i2.Category>> getCategory() => (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Category>>.value(<_i2.Category>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Category>>.value(<_i2.Category>[]),
      ) as _i4.Future<List<_i2.Category>>);
  @override
  _i4.Future<bool> createNewEventEntity({
    required String? title,
    required String? description,
    required String? startDate,
    required String? endDate,
    required List<String>? paths,
    required List<String>? categories,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewEventEntity,
          [],
          {
            #title: title,
            #description: description,
            #startDate: startDate,
            #endDate: endDate,
            #paths: paths,
            #categories: categories,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> approvementNews({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #approvementNews,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> moveInArchiveNews({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #moveInArchiveNews,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [EventEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventEntity extends _i1.Mock implements _i2.EventEntity {
  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#title),
        ),
      ) as String);
  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
      ) as String);
  @override
  String get image => (super.noSuchMethod(
        Invocation.getter(#image),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#image),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
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

/// A class which mocks [Category].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategory extends _i1.Mock implements _i2.Category {
  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
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
        returnValueForMissingStub: _Fake$CategoryCopyWith_4<_i2.Category>(
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
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
