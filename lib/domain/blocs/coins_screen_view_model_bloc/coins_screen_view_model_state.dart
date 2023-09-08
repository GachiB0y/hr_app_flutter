part of 'coins_screen_view_model_bloc.dart';

@freezed
class CoinsScreenViewModelState with _$CoinsScreenViewModelState {
  const factory CoinsScreenViewModelState.loading() =
      CoinsScreenViewModelStateLoading;
  const factory CoinsScreenViewModelState.loaded(
          {required List<CoinsInfo> listCoinsInfoLoaded,
          required List<CoinsReward> listCoinsRewardLoaded}) =
      CoinsScreenViewModelStateLoaded;
  const factory CoinsScreenViewModelState.error() =
      CoinsScreenViewModelStateError;

  factory CoinsScreenViewModelState.fromJson(Map<String, dynamic> json) =>
      _$CoinsScreenViewModelStateFromJson(json);
}
