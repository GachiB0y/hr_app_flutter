// Mocks generated by Mockito 5.4.3 from annotations
// in hr_app_flutter/test/user_test/user_bloc_test.dart/user_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i9;
import 'dart:io' as _i5;
import 'dart:typed_data' as _i10;

import 'package:hr_app_flutter/features/services/model/birth_day_info/birth_day_info.dart'
    as _i4;
import 'package:hr_app_flutter/features/services/model/rookies_entity/rookies.dart'
    as _i2;
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart'
    as _i6;
import 'package:hr_app_flutter/features/user/model/user/user_info.dart' as _i3;
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

class _FakeRookies_0 extends _i1.SmartFake implements _i2.Rookies {
  _FakeRookies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserInfo_1 extends _i1.SmartFake implements _i3.UserInfo {
  _FakeUserInfo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBirthDayInfoEntity_2 extends _i1.SmartFake
    implements _i4.BirthDayInfoEntity {
  _FakeBirthDayInfoEntity_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_3 extends _i1.SmartFake implements _i5.File {
  _FakeFile_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_4 extends _i1.SmartFake implements Uri {
  _FakeUri_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDirectory_5 extends _i1.SmartFake implements _i5.Directory {
  _FakeDirectory_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileSystemEntity_6 extends _i1.SmartFake
    implements _i5.FileSystemEntity {
  _FakeFileSystemEntity_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_7 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRandomAccessFile_8 extends _i1.SmartFake
    implements _i5.RandomAccessFile {
  _FakeRandomAccessFile_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOSink_9 extends _i1.SmartFake implements _i5.IOSink {
  _FakeIOSink_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileStat_10 extends _i1.SmartFake implements _i5.FileStat {
  _FakeFileStat_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IUserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIUserRepository extends _i1.Mock implements _i6.IUserRepository {
  @override
  _i7.Future<_i2.Rookies> getRookiesInfo({
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
        returnValue: _i7.Future<_i2.Rookies>.value(_FakeRookies_0(
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
        returnValueForMissingStub: _i7.Future<_i2.Rookies>.value(_FakeRookies_0(
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
      ) as _i7.Future<_i2.Rookies>);
  @override
  _i7.Future<bool> saveTagsToSend({
    required List<_i3.TagUser>? tags,
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
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i3.UserInfo> getUserInfoById({required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserInfoById,
          [],
          {#userId: userId},
        ),
        returnValue: _i7.Future<_i3.UserInfo>.value(_FakeUserInfo_1(
          this,
          Invocation.method(
            #getUserInfoById,
            [],
            {#userId: userId},
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.UserInfo>.value(_FakeUserInfo_1(
          this,
          Invocation.method(
            #getUserInfoById,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i7.Future<_i3.UserInfo>);
  @override
  _i7.Future<_i4.BirthDayInfoEntity> getBirthDayInfo({
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
            _i7.Future<_i4.BirthDayInfoEntity>.value(_FakeBirthDayInfoEntity_2(
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
            _i7.Future<_i4.BirthDayInfoEntity>.value(_FakeBirthDayInfoEntity_2(
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
      ) as _i7.Future<_i4.BirthDayInfoEntity>);
  @override
  _i7.Future<List<_i3.UserInfo>> findUser({required String? findText}) =>
      (super.noSuchMethod(
        Invocation.method(
          #findUser,
          [],
          {#findText: findText},
        ),
        returnValue: _i7.Future<List<_i3.UserInfo>>.value(<_i3.UserInfo>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i3.UserInfo>>.value(<_i3.UserInfo>[]),
      ) as _i7.Future<List<_i3.UserInfo>>);
  @override
  _i7.Future<_i3.UserInfo> getUserInfo() => (super.noSuchMethod(
        Invocation.method(
          #getUserInfo,
          [],
        ),
        returnValue: _i7.Future<_i3.UserInfo>.value(_FakeUserInfo_1(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.UserInfo>.value(_FakeUserInfo_1(
          this,
          Invocation.method(
            #getUserInfo,
            [],
          ),
        )),
      ) as _i7.Future<_i3.UserInfo>);
  @override
  _i7.Future<List<_i3.UserInfo>> getUserByPhoneNumber(
          {required String? phoneNumber}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserByPhoneNumber,
          [],
          {#phoneNumber: phoneNumber},
        ),
        returnValue: _i7.Future<List<_i3.UserInfo>>.value(<_i3.UserInfo>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i3.UserInfo>>.value(<_i3.UserInfo>[]),
      ) as _i7.Future<List<_i3.UserInfo>>);
  @override
  _i7.Future<bool> sendAvatarWithProfile({required _i5.File? imageFile}) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendAvatarWithProfile,
          [],
          {#imageFile: imageFile},
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [File].
///
/// See the documentation for Mockito's code generation for more information.
class MockFile extends _i1.Mock implements _i5.File {
  @override
  _i5.File get absolute => (super.noSuchMethod(
        Invocation.getter(#absolute),
        returnValue: _FakeFile_3(
          this,
          Invocation.getter(#absolute),
        ),
        returnValueForMissingStub: _FakeFile_3(
          this,
          Invocation.getter(#absolute),
        ),
      ) as _i5.File);
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);
  @override
  Uri get uri => (super.noSuchMethod(
        Invocation.getter(#uri),
        returnValue: _FakeUri_4(
          this,
          Invocation.getter(#uri),
        ),
        returnValueForMissingStub: _FakeUri_4(
          this,
          Invocation.getter(#uri),
        ),
      ) as Uri);
  @override
  bool get isAbsolute => (super.noSuchMethod(
        Invocation.getter(#isAbsolute),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i5.Directory get parent => (super.noSuchMethod(
        Invocation.getter(#parent),
        returnValue: _FakeDirectory_5(
          this,
          Invocation.getter(#parent),
        ),
        returnValueForMissingStub: _FakeDirectory_5(
          this,
          Invocation.getter(#parent),
        ),
      ) as _i5.Directory);
  @override
  _i7.Future<_i5.File> create({
    bool? recursive = false,
    bool? exclusive = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {
            #recursive: recursive,
            #exclusive: exclusive,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #create,
            [],
            {
              #recursive: recursive,
              #exclusive: exclusive,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #create,
            [],
            {
              #recursive: recursive,
              #exclusive: exclusive,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  void createSync({
    bool? recursive = false,
    bool? exclusive = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #createSync,
          [],
          {
            #recursive: recursive,
            #exclusive: exclusive,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.File> rename(String? newPath) => (super.noSuchMethod(
        Invocation.method(
          #rename,
          [newPath],
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #rename,
            [newPath],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #rename,
            [newPath],
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  _i5.File renameSync(String? newPath) => (super.noSuchMethod(
        Invocation.method(
          #renameSync,
          [newPath],
        ),
        returnValue: _FakeFile_3(
          this,
          Invocation.method(
            #renameSync,
            [newPath],
          ),
        ),
        returnValueForMissingStub: _FakeFile_3(
          this,
          Invocation.method(
            #renameSync,
            [newPath],
          ),
        ),
      ) as _i5.File);
  @override
  _i7.Future<_i5.FileSystemEntity> delete({bool? recursive = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {#recursive: recursive},
        ),
        returnValue:
            _i7.Future<_i5.FileSystemEntity>.value(_FakeFileSystemEntity_6(
          this,
          Invocation.method(
            #delete,
            [],
            {#recursive: recursive},
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i5.FileSystemEntity>.value(_FakeFileSystemEntity_6(
          this,
          Invocation.method(
            #delete,
            [],
            {#recursive: recursive},
          ),
        )),
      ) as _i7.Future<_i5.FileSystemEntity>);
  @override
  void deleteSync({bool? recursive = false}) => super.noSuchMethod(
        Invocation.method(
          #deleteSync,
          [],
          {#recursive: recursive},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.File> copy(String? newPath) => (super.noSuchMethod(
        Invocation.method(
          #copy,
          [newPath],
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #copy,
            [newPath],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #copy,
            [newPath],
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  _i5.File copySync(String? newPath) => (super.noSuchMethod(
        Invocation.method(
          #copySync,
          [newPath],
        ),
        returnValue: _FakeFile_3(
          this,
          Invocation.method(
            #copySync,
            [newPath],
          ),
        ),
        returnValueForMissingStub: _FakeFile_3(
          this,
          Invocation.method(
            #copySync,
            [newPath],
          ),
        ),
      ) as _i5.File);
  @override
  _i7.Future<int> length() => (super.noSuchMethod(
        Invocation.method(
          #length,
          [],
        ),
        returnValue: _i7.Future<int>.value(0),
        returnValueForMissingStub: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  int lengthSync() => (super.noSuchMethod(
        Invocation.method(
          #lengthSync,
          [],
        ),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i7.Future<DateTime> lastAccessed() => (super.noSuchMethod(
        Invocation.method(
          #lastAccessed,
          [],
        ),
        returnValue: _i7.Future<DateTime>.value(_FakeDateTime_7(
          this,
          Invocation.method(
            #lastAccessed,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<DateTime>.value(_FakeDateTime_7(
          this,
          Invocation.method(
            #lastAccessed,
            [],
          ),
        )),
      ) as _i7.Future<DateTime>);
  @override
  DateTime lastAccessedSync() => (super.noSuchMethod(
        Invocation.method(
          #lastAccessedSync,
          [],
        ),
        returnValue: _FakeDateTime_7(
          this,
          Invocation.method(
            #lastAccessedSync,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeDateTime_7(
          this,
          Invocation.method(
            #lastAccessedSync,
            [],
          ),
        ),
      ) as DateTime);
  @override
  _i7.Future<dynamic> setLastAccessed(DateTime? time) => (super.noSuchMethod(
        Invocation.method(
          #setLastAccessed,
          [time],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  void setLastAccessedSync(DateTime? time) => super.noSuchMethod(
        Invocation.method(
          #setLastAccessedSync,
          [time],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<DateTime> lastModified() => (super.noSuchMethod(
        Invocation.method(
          #lastModified,
          [],
        ),
        returnValue: _i7.Future<DateTime>.value(_FakeDateTime_7(
          this,
          Invocation.method(
            #lastModified,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<DateTime>.value(_FakeDateTime_7(
          this,
          Invocation.method(
            #lastModified,
            [],
          ),
        )),
      ) as _i7.Future<DateTime>);
  @override
  DateTime lastModifiedSync() => (super.noSuchMethod(
        Invocation.method(
          #lastModifiedSync,
          [],
        ),
        returnValue: _FakeDateTime_7(
          this,
          Invocation.method(
            #lastModifiedSync,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeDateTime_7(
          this,
          Invocation.method(
            #lastModifiedSync,
            [],
          ),
        ),
      ) as DateTime);
  @override
  _i7.Future<dynamic> setLastModified(DateTime? time) => (super.noSuchMethod(
        Invocation.method(
          #setLastModified,
          [time],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  void setLastModifiedSync(DateTime? time) => super.noSuchMethod(
        Invocation.method(
          #setLastModifiedSync,
          [time],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.RandomAccessFile> open(
          {_i5.FileMode? mode = _i5.FileMode.read}) =>
      (super.noSuchMethod(
        Invocation.method(
          #open,
          [],
          {#mode: mode},
        ),
        returnValue:
            _i7.Future<_i5.RandomAccessFile>.value(_FakeRandomAccessFile_8(
          this,
          Invocation.method(
            #open,
            [],
            {#mode: mode},
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i5.RandomAccessFile>.value(_FakeRandomAccessFile_8(
          this,
          Invocation.method(
            #open,
            [],
            {#mode: mode},
          ),
        )),
      ) as _i7.Future<_i5.RandomAccessFile>);
  @override
  _i5.RandomAccessFile openSync({_i5.FileMode? mode = _i5.FileMode.read}) =>
      (super.noSuchMethod(
        Invocation.method(
          #openSync,
          [],
          {#mode: mode},
        ),
        returnValue: _FakeRandomAccessFile_8(
          this,
          Invocation.method(
            #openSync,
            [],
            {#mode: mode},
          ),
        ),
        returnValueForMissingStub: _FakeRandomAccessFile_8(
          this,
          Invocation.method(
            #openSync,
            [],
            {#mode: mode},
          ),
        ),
      ) as _i5.RandomAccessFile);
  @override
  _i7.Stream<List<int>> openRead([
    int? start,
    int? end,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #openRead,
          [
            start,
            end,
          ],
        ),
        returnValue: _i7.Stream<List<int>>.empty(),
        returnValueForMissingStub: _i7.Stream<List<int>>.empty(),
      ) as _i7.Stream<List<int>>);
  @override
  _i5.IOSink openWrite({
    _i5.FileMode? mode = _i5.FileMode.write,
    _i9.Encoding? encoding = const _i9.Utf8Codec(),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openWrite,
          [],
          {
            #mode: mode,
            #encoding: encoding,
          },
        ),
        returnValue: _FakeIOSink_9(
          this,
          Invocation.method(
            #openWrite,
            [],
            {
              #mode: mode,
              #encoding: encoding,
            },
          ),
        ),
        returnValueForMissingStub: _FakeIOSink_9(
          this,
          Invocation.method(
            #openWrite,
            [],
            {
              #mode: mode,
              #encoding: encoding,
            },
          ),
        ),
      ) as _i5.IOSink);
  @override
  _i7.Future<_i10.Uint8List> readAsBytes() => (super.noSuchMethod(
        Invocation.method(
          #readAsBytes,
          [],
        ),
        returnValue: _i7.Future<_i10.Uint8List>.value(_i10.Uint8List(0)),
        returnValueForMissingStub:
            _i7.Future<_i10.Uint8List>.value(_i10.Uint8List(0)),
      ) as _i7.Future<_i10.Uint8List>);
  @override
  _i10.Uint8List readAsBytesSync() => (super.noSuchMethod(
        Invocation.method(
          #readAsBytesSync,
          [],
        ),
        returnValue: _i10.Uint8List(0),
        returnValueForMissingStub: _i10.Uint8List(0),
      ) as _i10.Uint8List);
  @override
  _i7.Future<String> readAsString(
          {_i9.Encoding? encoding = const _i9.Utf8Codec()}) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAsString,
          [],
          {#encoding: encoding},
        ),
        returnValue: _i7.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #readAsString,
            [],
            {#encoding: encoding},
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #readAsString,
            [],
            {#encoding: encoding},
          ),
        )),
      ) as _i7.Future<String>);
  @override
  String readAsStringSync({_i9.Encoding? encoding = const _i9.Utf8Codec()}) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAsStringSync,
          [],
          {#encoding: encoding},
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #readAsStringSync,
            [],
            {#encoding: encoding},
          ),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #readAsStringSync,
            [],
            {#encoding: encoding},
          ),
        ),
      ) as String);
  @override
  _i7.Future<List<String>> readAsLines(
          {_i9.Encoding? encoding = const _i9.Utf8Codec()}) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAsLines,
          [],
          {#encoding: encoding},
        ),
        returnValue: _i7.Future<List<String>>.value(<String>[]),
        returnValueForMissingStub: _i7.Future<List<String>>.value(<String>[]),
      ) as _i7.Future<List<String>>);
  @override
  List<String> readAsLinesSync(
          {_i9.Encoding? encoding = const _i9.Utf8Codec()}) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAsLinesSync,
          [],
          {#encoding: encoding},
        ),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);
  @override
  _i7.Future<_i5.File> writeAsBytes(
    List<int>? bytes, {
    _i5.FileMode? mode = _i5.FileMode.write,
    bool? flush = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeAsBytes,
          [bytes],
          {
            #mode: mode,
            #flush: flush,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #writeAsBytes,
            [bytes],
            {
              #mode: mode,
              #flush: flush,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #writeAsBytes,
            [bytes],
            {
              #mode: mode,
              #flush: flush,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  void writeAsBytesSync(
    List<int>? bytes, {
    _i5.FileMode? mode = _i5.FileMode.write,
    bool? flush = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #writeAsBytesSync,
          [bytes],
          {
            #mode: mode,
            #flush: flush,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.File> writeAsString(
    String? contents, {
    _i5.FileMode? mode = _i5.FileMode.write,
    _i9.Encoding? encoding = const _i9.Utf8Codec(),
    bool? flush = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeAsString,
          [contents],
          {
            #mode: mode,
            #encoding: encoding,
            #flush: flush,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #writeAsString,
            [contents],
            {
              #mode: mode,
              #encoding: encoding,
              #flush: flush,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #writeAsString,
            [contents],
            {
              #mode: mode,
              #encoding: encoding,
              #flush: flush,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  void writeAsStringSync(
    String? contents, {
    _i5.FileMode? mode = _i5.FileMode.write,
    _i9.Encoding? encoding = const _i9.Utf8Codec(),
    bool? flush = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #writeAsStringSync,
          [contents],
          {
            #mode: mode,
            #encoding: encoding,
            #flush: flush,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<bool> exists() => (super.noSuchMethod(
        Invocation.method(
          #exists,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  bool existsSync() => (super.noSuchMethod(
        Invocation.method(
          #existsSync,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i7.Future<String> resolveSymbolicLinks() => (super.noSuchMethod(
        Invocation.method(
          #resolveSymbolicLinks,
          [],
        ),
        returnValue: _i7.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #resolveSymbolicLinks,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #resolveSymbolicLinks,
            [],
          ),
        )),
      ) as _i7.Future<String>);
  @override
  String resolveSymbolicLinksSync() => (super.noSuchMethod(
        Invocation.method(
          #resolveSymbolicLinksSync,
          [],
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #resolveSymbolicLinksSync,
            [],
          ),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #resolveSymbolicLinksSync,
            [],
          ),
        ),
      ) as String);
  @override
  _i7.Future<_i5.FileStat> stat() => (super.noSuchMethod(
        Invocation.method(
          #stat,
          [],
        ),
        returnValue: _i7.Future<_i5.FileStat>.value(_FakeFileStat_10(
          this,
          Invocation.method(
            #stat,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i5.FileStat>.value(_FakeFileStat_10(
          this,
          Invocation.method(
            #stat,
            [],
          ),
        )),
      ) as _i7.Future<_i5.FileStat>);
  @override
  _i5.FileStat statSync() => (super.noSuchMethod(
        Invocation.method(
          #statSync,
          [],
        ),
        returnValue: _FakeFileStat_10(
          this,
          Invocation.method(
            #statSync,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeFileStat_10(
          this,
          Invocation.method(
            #statSync,
            [],
          ),
        ),
      ) as _i5.FileStat);
  @override
  _i7.Stream<_i5.FileSystemEvent> watch({
    int? events = 15,
    bool? recursive = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {
            #events: events,
            #recursive: recursive,
          },
        ),
        returnValue: _i7.Stream<_i5.FileSystemEvent>.empty(),
        returnValueForMissingStub: _i7.Stream<_i5.FileSystemEvent>.empty(),
      ) as _i7.Stream<_i5.FileSystemEvent>);
}
