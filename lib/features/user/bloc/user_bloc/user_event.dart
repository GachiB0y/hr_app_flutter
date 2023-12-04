part of 'user_bloc.dart';

/// Business Logic Component User Events
@freezed
class UserEvent with _$UserEvent {
  const UserEvent._();

  /// Fetch
  const factory UserEvent.fetch() = UserEventFetch;

  /// Geth user by user id
  const factory UserEvent.gethUserByUserId({required String userId}) =
      UserEventGethUserByUserId;

  const factory UserEvent.saveTagsToSend(
      {required List<TagUser> tags,
      required int userId}) = UserEventSaveTagsToSend;
  const factory UserEvent.addTag({required TagUser tag}) = UserEventAddTag;
  const factory UserEvent.deleteTag({required TagUser tag}) =
      UserEventDeleteTag;
  const factory UserEvent.sendAvatarWithProfile(
      {required io.File imageFile,
      required int userId}) = UserEventSendAvatarWithProfile;
}
