// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';

part 'participant.g.dart';

@freezed
class ParticipantEntity with _$ParticipantEntity {
  const factory ParticipantEntity({
    required final String lastName,
    required final String firstName,
    required final String patronymic,
    required final String id,
    required final String position,
  }) = _ParticipantEntity;

  factory ParticipantEntity.fromJson(Map<String, dynamic> json) =>
      _$ParticipantEntityFromJson(json);
}
