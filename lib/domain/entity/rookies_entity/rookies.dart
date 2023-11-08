// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rookies.freezed.dart';

part 'rookies.g.dart';

@freezed
class Rookies with _$Rookies {
  const factory Rookies({
    required int count,
    required List<OneRookiesInfo> rookies,
  }) = _Rookies;

  factory Rookies.fromJson(Map<String, dynamic> json) =>
      _$RookiesFromJson(json);
}

@freezed
class OneRookiesInfo with _$OneRookiesInfo {
  const factory OneRookiesInfo({
    @JsonKey(name: 'auto_card') required int autoCard,
    required String name,
    @JsonKey(name: 'name_i') required String nameI,
    @JsonKey(name: 'name_o') required String nameO,
    @JsonKey(name: 'date_birth') required String dateBirth,
    @JsonKey(name: 'staff_position') required String staffPosition,
  }) = _OneRookiesInfo;

  factory OneRookiesInfo.fromJson(Map<String, dynamic> json) =>
      _$OneRookiesInfoFromJson(json);
}
