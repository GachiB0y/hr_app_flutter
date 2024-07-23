import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/features/notification/data/model_dto/notification_dto.dart';

abstract interface class INotificationRestClient {
  Future<Iterable<NotificationDto>> getNotifications();

  Future<void> sendNotifications(int idNotifications);
}

final class NotificationRestClient implements INotificationRestClient {
  const NotificationRestClient({required RestClient restClient}) : _restClient = restClient;
  final RestClient _restClient;

  @override
  Future<Iterable<NotificationDto>> getNotifications() async {
    final response = await _restClient.get('/auth/notifications');
    if (response == null) {
      return [];
    }
    if (response case {'result': final data as List<dynamic>}) {
      final result = data.map(
        (item) => NotificationDto.fromJson(item as Map<String, dynamic>),
      );

      return result;
    }
    throw Exception('Error fetching Notifications');
  }

  @override
  Future<void> sendNotifications(int idNotifications) async {
    final response = await _restClient.get('/auth/notifications');

    if (response case {'result': final data as List<dynamic>}) {
      final result = data.map((item) => NotificationDto.fromJson(item as Map<String, dynamic>)).toList();
    }
    throw Exception('Error send Notifications');
  }
}
