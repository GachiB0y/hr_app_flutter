part of 'statement_type_list_bloc.dart';

/// Business Logic Component StatementTypeList Events
@freezed
class StatementTypeListEvent with _$StatementTypeListEvent {
  const StatementTypeListEvent._();

  /// Fetch
  const factory StatementTypeListEvent.fetch({required int id}) =
      FetchStatementTypeListEvent;
}
