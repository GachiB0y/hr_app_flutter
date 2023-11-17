part of 'rookies_bloc.dart';

/// Business Logic Component Rookies Events
@freezed
class RookiesEvent with _$RookiesEvent {
  const RookiesEvent._();

  /// Fetch
  const factory RookiesEvent.fetch(
      {final DateTime? startDate, final DateTime? endDate}) = RookiesEventFetch;
}
