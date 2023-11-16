part of 'user_birth_day_info_bloc.dart';

// @freezed
// class UserBirthDayInfoEvent with _$UserBirthDayInfoEvent {
//   const factory UserBirthDayInfoEvent.fetch() = UserBirthDayInfoEventFetch;
// }

/// Business Logic Component UserBirthDayInfo Events
@freezed
class UserBirthDayInfoEvent with _$UserBirthDayInfoEvent {
  const UserBirthDayInfoEvent._();

  /// Fetch
  const factory UserBirthDayInfoEvent.fetch(
      {final DateTime? startDate,
      final DateTime? endDate}) = UserBirthDayInfoEventFetch;
}
