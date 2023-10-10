import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_reward.freezed.dart';

part 'coins_reward.g.dart';

@freezed
class CoinsReward with _$CoinsReward {
  const factory CoinsReward({
    required int id,
    required int price,
    required String title,
  }) = _CoinsReward;

  factory CoinsReward.fromJson(Map<String, dynamic> json) =>
      _$CoinsRewardFromJson(json);
}
