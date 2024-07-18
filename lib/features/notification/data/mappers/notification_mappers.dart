import 'package:hr_app_flutter/features/notification/data/model_dto/notification_dto.dart';
import 'package:hr_app_flutter/features/notification/model/notification.dart';

abstract interface class INotificationMappers {
  NotificationDto toDto(NotificationEntity notification);
  NotificationEntity fromDto(NotificationDto dto);
}

class NotificationMappers implements INotificationMappers {
  @override
  NotificationDto toDto(NotificationEntity notification) => NotificationDto(
        title: notification.title,
        description: notification.description,
        isRead: notification.isRead,
        date: notification.date,
      );

  @override
  NotificationEntity fromDto(NotificationDto dto) => NotificationEntity(
        description: dto.description,
        title: dto.title,
        isRead: dto.isRead ?? false,
        date: dto.date,
      );
}
