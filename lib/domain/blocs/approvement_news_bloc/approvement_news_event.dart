part of 'approvement_news_bloc.dart';

@freezed
class ApprovementEvent with _$ApprovementEvent {
  const factory ApprovementEvent.fetch() = ApprovementEventFetch;
  const factory ApprovementEvent.approvedNews({required String id}) =
      ApprovementEventApprovedNews;
}
