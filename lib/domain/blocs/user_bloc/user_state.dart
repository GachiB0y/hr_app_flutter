part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = UserStateLoading;
  const factory UserState.loaded({required User userLoaded}) = UserStateLoaded;
  const factory UserState.error() = UserStateError;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
