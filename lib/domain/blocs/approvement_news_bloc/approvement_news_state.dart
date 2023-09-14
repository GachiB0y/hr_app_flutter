part of 'approvement_news_bloc.dart';

@freezed
class ApprovementNewsState with _$ApprovementNewsState {
  const factory ApprovementNewsState.loading() = ApprovementNewsStateLoading;
  const factory ApprovementNewsState.loaded(
          {required List<EventEntity> listApprovmentEventEntityLoaded}) =
      ApprovementNewsStateLoaded;
  const factory ApprovementNewsState.error() = ApprovementNewsStateError;

  factory ApprovementNewsState.fromJson(Map<String, dynamic> json) =>
      _$ApprovementNewsStateFromJson(json);
}
