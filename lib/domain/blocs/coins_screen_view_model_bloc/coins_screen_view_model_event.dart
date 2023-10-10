part of 'coins_screen_view_model_bloc.dart';

@freezed
class CoinsScreenViewModelEvent with _$CoinsScreenViewModelEvent {
  const factory CoinsScreenViewModelEvent.fetchInfo() =
      CoinsScreenViewModelEventFetchInfo;
  const factory CoinsScreenViewModelEvent.getCoinsInfo() =
      CoinsScreenViewModelEventGetCoinsInfo;
  const factory CoinsScreenViewModelEvent.getCoinsReward() =
      CoinsScreenViewModelEventGetCoinsReward;
}
