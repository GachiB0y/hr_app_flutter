import 'package:hr_app_flutter/features/notification/data/mappers/notification_mappers.dart';
import 'package:hr_app_flutter/features/notification/data/rest_client/notification_rest_client.dart';
import 'package:hr_app_flutter/features/notification/model/notification.dart';

abstract interface class INotificationRepository {
  Future<Iterable<NotificationEntity>> getNotifications();
  Future<void> sendNotifications(int idNotifications);
}

class NotificationRepository implements INotificationRepository {
  const NotificationRepository({
    required INotificationRestClient restClient,
    required NotificationMappers notificationMappers,
  })  : _restClient = restClient,
        _notificationMappers = notificationMappers;
  final INotificationRestClient _restClient;
  final NotificationMappers _notificationMappers;

  @override
  Future<Iterable<NotificationEntity>> getNotifications() async {
    final response = await _restClient.getNotifications();
    return response.map(_notificationMappers.fromDto);
  }

  @override
  Future<void> sendNotifications(int idNotifications) async {
    await _restClient.sendNotifications(idNotifications);
  }
}
