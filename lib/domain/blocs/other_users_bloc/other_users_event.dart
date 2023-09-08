part of 'other_users_bloc.dart';

@freezed
class OtherUsersEvent with _$OtherUsersEvent {
  const factory OtherUsersEvent.gethUsersByPhoneNumber(
      {required String phoneNumber}) = OtherUsersEventFetch;
  const factory OtherUsersEvent.clearList() = OtherUsersEventClearList;
}
