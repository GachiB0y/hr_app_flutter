import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class TagUser with _$TagUser {
  const factory TagUser({
    required int id,
    required String name,
  }) = _TagUser;

  factory TagUser.fromJson(Map<String, dynamic> json) =>
      _$TagUserFromJson(json);
}
