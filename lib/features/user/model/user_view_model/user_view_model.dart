// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_info.dart';

part 'user_view_model.freezed.dart';
part 'user_view_model.g.dart';

@freezed
class UserProfileViewModel with _$UserProfileViewModel {
  const factory UserProfileViewModel(
      {required UserInfo authUser,
      required UserInfo? currentProfileUser}) = _UserProfileViewModel;

  factory UserProfileViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileViewModelFromJson(json);
}
