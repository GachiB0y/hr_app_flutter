part of 'user_birth_day_info_bloc.dart';

@freezed
class UserBirthDayInfoEvent with _$UserBirthDayInfoEvent {
  const factory UserBirthDayInfoEvent.fetch() = UserBirthDayInfoEventFetch;
}
