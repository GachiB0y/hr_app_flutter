part of 'user_birth_day_info_bloc.dart';

@freezed
class UserBirthDayInfoState with _$UserBirthDayInfoState {
  const factory UserBirthDayInfoState.loading() = UserBirthDayInfoStateLoading;
  const factory UserBirthDayInfoState.loaded(
          {required BirthDayInfoEntity birthDayInfoLoaded}) =
      UserBirthDayInfoStateLoaded;
  const factory UserBirthDayInfoState.error() = UserBirthDayInfoStateError;

  factory UserBirthDayInfoState.fromJson(Map<String, dynamic> json) =>
      _$UserBirthDayInfoStateFromJson(json);
}
