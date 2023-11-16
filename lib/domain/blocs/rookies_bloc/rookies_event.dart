part of 'rookies_bloc.dart';

// @freezed
// class RookiesEvent with _$RookiesEvent {
//   const factory RookiesEvent.fetch() = RookiesEventFetch;
// }

/// Business Logic Component Rookies Events
@freezed
class RookiesEvent with _$RookiesEvent {
  const RookiesEvent._();

  /// Fetch
  const factory RookiesEvent.fetch() = RookiesEventFetch;
}
