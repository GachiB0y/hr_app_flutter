import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';

part 'view_model_my_lean_productions.freezed.dart';
part 'view_model_my_lean_productions.g.dart';

@freezed
class ViewModelMyLeanProductions with _$ViewModelMyLeanProductions {
  const factory ViewModelMyLeanProductions({
    required List<MyLeanProductionsEntity>? myProposals,
    bool? isSubmitting,
    @Default(false) bool? isLoadingFile,
    ApiClientExceptionType? exception,
  }) = _ViewModelMyLeanProductions;

  factory ViewModelMyLeanProductions.fromJson(Map<String, dynamic> json) =>
      _$ViewModelMyLeanProductionsFromJson(json);
}
