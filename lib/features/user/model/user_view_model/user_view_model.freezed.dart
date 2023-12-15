// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileViewModel _$UserProfileViewModelFromJson(Map<String, dynamic> json) {
  return _UserProfileViewModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileViewModel {
  User get authUser => throw _privateConstructorUsedError;
  User? get currentProfileUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileViewModelCopyWith<UserProfileViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileViewModelCopyWith<$Res> {
  factory $UserProfileViewModelCopyWith(UserProfileViewModel value,
          $Res Function(UserProfileViewModel) then) =
      _$UserProfileViewModelCopyWithImpl<$Res, UserProfileViewModel>;
  @useResult
  $Res call({User authUser, User? currentProfileUser});

  $UserCopyWith<$Res> get authUser;
  $UserCopyWith<$Res>? get currentProfileUser;
}

/// @nodoc
class _$UserProfileViewModelCopyWithImpl<$Res,
        $Val extends UserProfileViewModel>
    implements $UserProfileViewModelCopyWith<$Res> {
  _$UserProfileViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = null,
    Object? currentProfileUser = freezed,
  }) {
    return _then(_value.copyWith(
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User,
      currentProfileUser: freezed == currentProfileUser
          ? _value.currentProfileUser
          : currentProfileUser // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get authUser {
    return $UserCopyWith<$Res>(_value.authUser, (value) {
      return _then(_value.copyWith(authUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get currentProfileUser {
    if (_value.currentProfileUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentProfileUser!, (value) {
      return _then(_value.copyWith(currentProfileUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileViewModelCopyWith<$Res>
    implements $UserProfileViewModelCopyWith<$Res> {
  factory _$$_UserProfileViewModelCopyWith(_$_UserProfileViewModel value,
          $Res Function(_$_UserProfileViewModel) then) =
      __$$_UserProfileViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User authUser, User? currentProfileUser});

  @override
  $UserCopyWith<$Res> get authUser;
  @override
  $UserCopyWith<$Res>? get currentProfileUser;
}

/// @nodoc
class __$$_UserProfileViewModelCopyWithImpl<$Res>
    extends _$UserProfileViewModelCopyWithImpl<$Res, _$_UserProfileViewModel>
    implements _$$_UserProfileViewModelCopyWith<$Res> {
  __$$_UserProfileViewModelCopyWithImpl(_$_UserProfileViewModel _value,
      $Res Function(_$_UserProfileViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = null,
    Object? currentProfileUser = freezed,
  }) {
    return _then(_$_UserProfileViewModel(
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as User,
      currentProfileUser: freezed == currentProfileUser
          ? _value.currentProfileUser
          : currentProfileUser // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileViewModel implements _UserProfileViewModel {
  const _$_UserProfileViewModel(
      {required this.authUser, required this.currentProfileUser});

  factory _$_UserProfileViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileViewModelFromJson(json);

  @override
  final User authUser;
  @override
  final User? currentProfileUser;

  @override
  String toString() {
    return 'UserProfileViewModel(authUser: $authUser, currentProfileUser: $currentProfileUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileViewModel &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.currentProfileUser, currentProfileUser) ||
                other.currentProfileUser == currentProfileUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authUser, currentProfileUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileViewModelCopyWith<_$_UserProfileViewModel> get copyWith =>
      __$$_UserProfileViewModelCopyWithImpl<_$_UserProfileViewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileViewModelToJson(
      this,
    );
  }
}

abstract class _UserProfileViewModel implements UserProfileViewModel {
  const factory _UserProfileViewModel(
      {required final User authUser,
      required final User? currentProfileUser}) = _$_UserProfileViewModel;

  factory _UserProfileViewModel.fromJson(Map<String, dynamic> json) =
      _$_UserProfileViewModel.fromJson;

  @override
  User get authUser;
  @override
  User? get currentProfileUser;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileViewModelCopyWith<_$_UserProfileViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
