import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required int auto_card,
      required String name,
      @JsonKey(name: 'name_i') required String nameI,
      @JsonKey(name: 'name_o') required String nameO,
      @JsonKey(name: 'date_birth') required String dateBirth,
      required String email}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
