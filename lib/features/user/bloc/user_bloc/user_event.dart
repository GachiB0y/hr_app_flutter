part of 'user_bloc.dart';

/// Business Logic Component User Events
@freezed
class UserEvent with _$UserEvent {
  const UserEvent._();

  /// Fetch
  const factory UserEvent.fetch() = UserEventFetch;
}
