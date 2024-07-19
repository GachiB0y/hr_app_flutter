import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String title,
    required String description,
    required bool isRead,
    required DateTime date,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
