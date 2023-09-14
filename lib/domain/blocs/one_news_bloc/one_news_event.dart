part of 'one_news_bloc.dart';

@freezed
class OneNewsEvent with _$OneNewsEvent {
  const factory OneNewsEvent.fetch({required String id}) = OneNewsEventFetch;
}
