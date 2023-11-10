import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_report_entity.freezed.dart';

part 'bag_report_entity.g.dart';

@freezed
class BagReportEntity with _$BagReportEntity {
  const factory BagReportEntity({
    required final String title,
    required final String description,
    required List<String> pathsToFiles,
  }) = _BagReportEntity;

  factory BagReportEntity.fromJson(Map<String, dynamic> json) =>
      _$BagReportEntityFromJson(json);
}
