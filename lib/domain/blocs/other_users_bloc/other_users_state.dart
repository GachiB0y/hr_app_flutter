part of 'other_users_bloc.dart';

@freezed
class OtherUserState with _$OtherUserState {
  const factory OtherUserState.loading() = OtherUserStateLoading;
  const factory OtherUserState.loaded({required List<User> listUsersLoaded}) =
      OtherUserStateLoaded;
  const factory OtherUserState.error() = OtherUserStateError;

  factory OtherUserState.fromJson(Map<String, dynamic> json) =>
      _$OtherUserStateFromJson(json);
}
