part of 'one_news_bloc.dart';

@freezed
class OneNewsState with _$OneNewsState {
  const factory OneNewsState.loading() = OneNewsStateLoading;
  const factory OneNewsState.loaded({required EventEntity oneNewsLoaded}) =
      OneNewsStateLoaded;
  const factory OneNewsState.error() = OneNewsStateError;

  factory OneNewsState.fromJson(Map<String, dynamic> json) =>
      _$OneNewsStateFromJson(json);
}
