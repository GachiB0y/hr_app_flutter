// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_day_info.freezed.dart';

part 'birth_day_info.g.dart';

@freezed
class BirthDayInfoEntity with _$BirthDayInfoEntity {
  const factory BirthDayInfoEntity({
    required int count,
    required List<OneBirthDayInfo> birthdays,
  }) = _BirthDayInfoEntity;

  factory BirthDayInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$BirthDayInfoEntityFromJson(json);
}

@freezed
class OneBirthDayInfo with _$OneBirthDayInfo {
  const factory OneBirthDayInfo({
    @JsonKey(name: 'auto_card') required int autoCard,
    required String name,
    @JsonKey(name: 'name_i') required String nameI,
    @JsonKey(name: 'name_o') required String nameO,
    @JsonKey(name: 'date_birth') required String dateBirth,
    @JsonKey(name: 'staff_position') required String? staffPosition,
  }) = _OneBirthDayInfo;

  factory OneBirthDayInfo.fromJson(Map<String, dynamic> json) =>
      _$OneBirthDayInfoFromJson(json);
}
