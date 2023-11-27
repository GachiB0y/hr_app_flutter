part of 'lean_production_form_bloc.dart';

@freezed
class LeanProductionFormState with _$LeanProductionFormState {
  const factory LeanProductionFormState.loading() =
      LeanProductionFormStateLoading;
  const factory LeanProductionFormState.loaded(
      {List<MyLeanProductionsEntity>? myProposals,
      bool? isSubmitting,
      @Default(false) bool? isLoadingFile}) = LeanProductionFormStateLoaded;
  const factory LeanProductionFormState.error(
      {String? errorText,
      ApiClientExceptionType? exception}) = LeanProductionFormStateError;

  factory LeanProductionFormState.fromJson(Map<String, dynamic> json) =>
      _$LeanProductionFormStateFromJson(json);
}
