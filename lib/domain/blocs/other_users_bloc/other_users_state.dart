part of 'other_users_bloc.dart';

@freezed
class OtherUserState with _$OtherUserState {
  const factory OtherUserState.loading(
      {List<User>? listUsersLoaded,
      User? currentProfileUser}) = OtherUserStateLoading;
  const factory OtherUserState.loaded(
      {required List<User> listUsersLoaded,
      required User? currentProfileUser}) = OtherUserStateLoaded;
  const factory OtherUserState.error({
    String? errorText,
  }) = OtherUserStateError;

  factory OtherUserState.fromJson(Map<String, dynamic> json) =>
      _$OtherUserStateFromJson(json);
}
