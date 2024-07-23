part of 'coins_reward_bloc.dart';

/// Business Logic Component CoinsReward Events
@freezed
class CoinsRewardEvent with _$CoinsRewardEvent {
  const CoinsRewardEvent._();

  /// Fetch CoinsReward
  const factory CoinsRewardEvent.getCoinsReward() = GetCoinsRewardEvent;

  /// Fetch CoinsInfo
  const factory CoinsRewardEvent.getCoinsInfo() = GetCoinsInfoEvent;
}
