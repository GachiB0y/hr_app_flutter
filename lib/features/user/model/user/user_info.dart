// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'auto_card') required int autoCard,
    required String name,
    @JsonKey(name: 'name_i') required String nameI,
    @JsonKey(name: 'name_o') required String nameO,
    @Default(null) @JsonKey(name: 'date_birth') String? dateBirth,
    @JsonKey(name: 'staff_position') required String staffPosition,
    @Default(null) String? email,
    @Default(null) @JsonKey(name: 'phone_1') String? phoneOne,
    @Default(null) @JsonKey(name: 'phone_2') String? phoneTwo,
    @JsonKey(name: 'avatar') required String avatar,
    required List<TagUser> tags,
    @Default(false) @JsonKey(name: 'edit_tags') bool editTags,
    required bool self,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
class TagUser with _$TagUser {
  const factory TagUser({
    @Default(null) int? id,
    required String name,
  }) = _TagUser;

  factory TagUser.fromJson(Map<String, dynamic> json) =>
      _$TagUserFromJson(json);
}
