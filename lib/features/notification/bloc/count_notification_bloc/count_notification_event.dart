part of 'count_notification_bloc.dart';

/// Business Logic Component CountNotification Events
@freezed
class CountNotificationEvent with _$CountNotificationEvent {
  const CountNotificationEvent._();

  /// Fetch
  const factory CountNotificationEvent.fetch() = FetchCountNotificationEvent;
}
