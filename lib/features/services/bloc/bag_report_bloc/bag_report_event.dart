part of 'bag_report_bloc.dart';

/// Business Logic Component BagReport Events
@freezed
class BagReportEvent with _$BagReportEvent {
  const BagReportEvent._();

  /// Create
  const factory BagReportEvent.create({required BagReportEntity formInfo}) =
      BagReportEventCreate;
}
