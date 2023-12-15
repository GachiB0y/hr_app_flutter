part of 'other_users_bloc.dart';

/// Business Logic Component OtherUsers Events
@freezed
class OtherUsersEvent with _$OtherUsersEvent {
  const OtherUsersEvent._();

  /// Geth users by phone number
  const factory OtherUsersEvent.gethUsersByPhoneNumber(
      {required String phoneNumber}) = OtherUsersEventGethUsersByPhoneNumber;

  /// Find users
  const factory OtherUsersEvent.findUsers({required String findText}) =
      OtherUsersEventFindUsers;

  /// Clear list
  const factory OtherUsersEvent.clearList() = OtherUsersEventClearList;
}
