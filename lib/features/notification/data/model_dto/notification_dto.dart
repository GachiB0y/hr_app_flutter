import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String title,
    required String description,
    @JsonKey(name: 'created_at') required DateTime date,
    @JsonKey(name: 'is_read') @Default(false) bool? isRead,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
