// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtherUsersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
    required TResult Function(String findText) findUsers,
    required TResult Function() clearList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult? Function(String findText)? findUsers,
    TResult? Function()? clearList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult Function(String findText)? findUsers,
    TResult Function()? clearList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventGethUsersByPhoneNumber value)
        gethUsersByPhoneNumber,
    required TResult Function(OtherUsersEventFindUsers value) findUsers,
    required TResult Function(OtherUsersEventClearList value) clearList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult? Function(OtherUsersEventFindUsers value)? findUsers,
    TResult? Function(OtherUsersEventClearList value)? clearList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult Function(OtherUsersEventFindUsers value)? findUsers,
    TResult Function(OtherUsersEventClearList value)? clearList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUsersEventCopyWith<$Res> {
  factory $OtherUsersEventCopyWith(
          OtherUsersEvent value, $Res Function(OtherUsersEvent) then) =
      _$OtherUsersEventCopyWithImpl<$Res, OtherUsersEvent>;
}

/// @nodoc
class _$OtherUsersEventCopyWithImpl<$Res, $Val extends OtherUsersEvent>
    implements $OtherUsersEventCopyWith<$Res> {
  _$OtherUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OtherUsersEventGethUsersByPhoneNumberCopyWith<$Res> {
  factory _$$OtherUsersEventGethUsersByPhoneNumberCopyWith(
          _$OtherUsersEventGethUsersByPhoneNumber value,
          $Res Function(_$OtherUsersEventGethUsersByPhoneNumber) then) =
      __$$OtherUsersEventGethUsersByPhoneNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$OtherUsersEventGethUsersByPhoneNumberCopyWithImpl<$Res>
    extends _$OtherUsersEventCopyWithImpl<$Res,
        _$OtherUsersEventGethUsersByPhoneNumber>
    implements _$$OtherUsersEventGethUsersByPhoneNumberCopyWith<$Res> {
  __$$OtherUsersEventGethUsersByPhoneNumberCopyWithImpl(
      _$OtherUsersEventGethUsersByPhoneNumber _value,
      $Res Function(_$OtherUsersEventGethUsersByPhoneNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$OtherUsersEventGethUsersByPhoneNumber(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherUsersEventGethUsersByPhoneNumber
    extends OtherUsersEventGethUsersByPhoneNumber {
  const _$OtherUsersEventGethUsersByPhoneNumber({required this.phoneNumber})
      : super._();

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtherUsersEvent.gethUsersByPhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUsersEventGethUsersByPhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUsersEventGethUsersByPhoneNumberCopyWith<
          _$OtherUsersEventGethUsersByPhoneNumber>
      get copyWith => __$$OtherUsersEventGethUsersByPhoneNumberCopyWithImpl<
          _$OtherUsersEventGethUsersByPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
    required TResult Function(String findText) findUsers,
    required TResult Function() clearList,
  }) {
    return gethUsersByPhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult? Function(String findText)? findUsers,
    TResult? Function()? clearList,
  }) {
    return gethUsersByPhoneNumber?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult Function(String findText)? findUsers,
    TResult Function()? clearList,
    required TResult orElse(),
  }) {
    if (gethUsersByPhoneNumber != null) {
      return gethUsersByPhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventGethUsersByPhoneNumber value)
        gethUsersByPhoneNumber,
    required TResult Function(OtherUsersEventFindUsers value) findUsers,
    required TResult Function(OtherUsersEventClearList value) clearList,
  }) {
    return gethUsersByPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult? Function(OtherUsersEventFindUsers value)? findUsers,
    TResult? Function(OtherUsersEventClearList value)? clearList,
  }) {
    return gethUsersByPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult Function(OtherUsersEventFindUsers value)? findUsers,
    TResult Function(OtherUsersEventClearList value)? clearList,
    required TResult orElse(),
  }) {
    if (gethUsersByPhoneNumber != null) {
      return gethUsersByPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class OtherUsersEventGethUsersByPhoneNumber extends OtherUsersEvent {
  const factory OtherUsersEventGethUsersByPhoneNumber(
          {required final String phoneNumber}) =
      _$OtherUsersEventGethUsersByPhoneNumber;
  const OtherUsersEventGethUsersByPhoneNumber._() : super._();

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$OtherUsersEventGethUsersByPhoneNumberCopyWith<
          _$OtherUsersEventGethUsersByPhoneNumber>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherUsersEventFindUsersCopyWith<$Res> {
  factory _$$OtherUsersEventFindUsersCopyWith(_$OtherUsersEventFindUsers value,
          $Res Function(_$OtherUsersEventFindUsers) then) =
      __$$OtherUsersEventFindUsersCopyWithImpl<$Res>;
  @useResult
  $Res call({String findText});
}

/// @nodoc
class __$$OtherUsersEventFindUsersCopyWithImpl<$Res>
    extends _$OtherUsersEventCopyWithImpl<$Res, _$OtherUsersEventFindUsers>
    implements _$$OtherUsersEventFindUsersCopyWith<$Res> {
  __$$OtherUsersEventFindUsersCopyWithImpl(_$OtherUsersEventFindUsers _value,
      $Res Function(_$OtherUsersEventFindUsers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? findText = null,
  }) {
    return _then(_$OtherUsersEventFindUsers(
      findText: null == findText
          ? _value.findText
          : findText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherUsersEventFindUsers extends OtherUsersEventFindUsers {
  const _$OtherUsersEventFindUsers({required this.findText}) : super._();

  @override
  final String findText;

  @override
  String toString() {
    return 'OtherUsersEvent.findUsers(findText: $findText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUsersEventFindUsers &&
            (identical(other.findText, findText) ||
                other.findText == findText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, findText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUsersEventFindUsersCopyWith<_$OtherUsersEventFindUsers>
      get copyWith =>
          __$$OtherUsersEventFindUsersCopyWithImpl<_$OtherUsersEventFindUsers>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
    required TResult Function(String findText) findUsers,
    required TResult Function() clearList,
  }) {
    return findUsers(findText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult? Function(String findText)? findUsers,
    TResult? Function()? clearList,
  }) {
    return findUsers?.call(findText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult Function(String findText)? findUsers,
    TResult Function()? clearList,
    required TResult orElse(),
  }) {
    if (findUsers != null) {
      return findUsers(findText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventGethUsersByPhoneNumber value)
        gethUsersByPhoneNumber,
    required TResult Function(OtherUsersEventFindUsers value) findUsers,
    required TResult Function(OtherUsersEventClearList value) clearList,
  }) {
    return findUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult? Function(OtherUsersEventFindUsers value)? findUsers,
    TResult? Function(OtherUsersEventClearList value)? clearList,
  }) {
    return findUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult Function(OtherUsersEventFindUsers value)? findUsers,
    TResult Function(OtherUsersEventClearList value)? clearList,
    required TResult orElse(),
  }) {
    if (findUsers != null) {
      return findUsers(this);
    }
    return orElse();
  }
}

abstract class OtherUsersEventFindUsers extends OtherUsersEvent {
  const factory OtherUsersEventFindUsers({required final String findText}) =
      _$OtherUsersEventFindUsers;
  const OtherUsersEventFindUsers._() : super._();

  String get findText;
  @JsonKey(ignore: true)
  _$$OtherUsersEventFindUsersCopyWith<_$OtherUsersEventFindUsers>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherUsersEventClearListCopyWith<$Res> {
  factory _$$OtherUsersEventClearListCopyWith(_$OtherUsersEventClearList value,
          $Res Function(_$OtherUsersEventClearList) then) =
      __$$OtherUsersEventClearListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtherUsersEventClearListCopyWithImpl<$Res>
    extends _$OtherUsersEventCopyWithImpl<$Res, _$OtherUsersEventClearList>
    implements _$$OtherUsersEventClearListCopyWith<$Res> {
  __$$OtherUsersEventClearListCopyWithImpl(_$OtherUsersEventClearList _value,
      $Res Function(_$OtherUsersEventClearList) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OtherUsersEventClearList extends OtherUsersEventClearList {
  const _$OtherUsersEventClearList() : super._();

  @override
  String toString() {
    return 'OtherUsersEvent.clearList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUsersEventClearList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) gethUsersByPhoneNumber,
    required TResult Function(String findText) findUsers,
    required TResult Function() clearList,
  }) {
    return clearList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult? Function(String findText)? findUsers,
    TResult? Function()? clearList,
  }) {
    return clearList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? gethUsersByPhoneNumber,
    TResult Function(String findText)? findUsers,
    TResult Function()? clearList,
    required TResult orElse(),
  }) {
    if (clearList != null) {
      return clearList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherUsersEventGethUsersByPhoneNumber value)
        gethUsersByPhoneNumber,
    required TResult Function(OtherUsersEventFindUsers value) findUsers,
    required TResult Function(OtherUsersEventClearList value) clearList,
  }) {
    return clearList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult? Function(OtherUsersEventFindUsers value)? findUsers,
    TResult? Function(OtherUsersEventClearList value)? clearList,
  }) {
    return clearList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherUsersEventGethUsersByPhoneNumber value)?
        gethUsersByPhoneNumber,
    TResult Function(OtherUsersEventFindUsers value)? findUsers,
    TResult Function(OtherUsersEventClearList value)? clearList,
    required TResult orElse(),
  }) {
    if (clearList != null) {
      return clearList(this);
    }
    return orElse();
  }
}

abstract class OtherUsersEventClearList extends OtherUsersEvent {
  const factory OtherUsersEventClearList() = _$OtherUsersEventClearList;
  const OtherUsersEventClearList._() : super._();
}
