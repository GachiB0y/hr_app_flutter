import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_info.freezed.dart';

part 'coins_info.g.dart';

@freezed
class CoinsInfo with _$CoinsInfo {
  const factory CoinsInfo({
    required int id,
    required int price,
    required String title,
  }) = _CoinsInfo;

  factory CoinsInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinsInfoFromJson(json);
}
