part of 'rookies_bloc.dart';

@freezed
class RookiesState with _$RookiesState {
  const factory RookiesState.loading() = RookiesStateLoading;
  const factory RookiesState.loaded({required Rookies rookiesLoaded}) =
      RookiesStateLoaded;
  const factory RookiesState.error() = RookiesStateError;

  factory RookiesState.fromJson(Map<String, dynamic> json) =>
      _$RookiesStateFromJson(json);
}
