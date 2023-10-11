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
    @JsonKey(name: 'date_birth') required String dateBirth,
    @JsonKey(name: 'staff_position') required String staffPosition,
    required String email,
    @JsonKey(name: 'phone_1') required String phoneOne,
    @JsonKey(name: 'phone_2') required String phoneTwo,
    @JsonKey(name: 'avatar') required String avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
