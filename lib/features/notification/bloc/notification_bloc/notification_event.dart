part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const NotificationEvent._();

  /// Fetch notification
  const factory NotificationEvent.fetchNotification() =
      FetchNotificationNotificationEvent;
}
