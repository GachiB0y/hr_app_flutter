part of 'statements_bloc.dart';

/// Business Logic Component statements_event Events
@freezed
class StatementsEvent with _$StatementsEvent {
  const StatementsEvent._();

  /// Create
  const factory StatementsEvent.create({required StatementEntity itemsForm}) =
      StatementsEventCreate;

  /// Fetch
  const factory StatementsEvent.fetch({required String id}) =
      StatementsEventFetch;
}
