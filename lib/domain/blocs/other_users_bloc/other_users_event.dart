part of 'other_users_bloc.dart';

@freezed
class OtherUsersEvent with _$OtherUsersEvent {
  const factory OtherUsersEvent.gethUsersByPhoneNumber(
      {required String phoneNumber}) = OtherUsersEventGethUsersByPhoneNumber;
  const factory OtherUsersEvent.gethUsersByUserId({required String userId}) =
      OtherUsersEventGethUsersByUserId;
  const factory OtherUsersEvent.findUsers({required String findText}) =
      OtherUsersEventFindUsers;
  const factory OtherUsersEvent.clearList() = OtherUsersEventClearList;
  const factory OtherUsersEvent.addTag(
      {required List<TagUser> tags,
      required int idUser}) = OtherUsersEventAddTag;
}
