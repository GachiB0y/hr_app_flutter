part of 'lean_production_form_bloc.dart';

@freezed
class LeanProductionFormState with _$LeanProductionFormState {
  const factory LeanProductionFormState.loading() =
      LeanProductionFormStateLoading;
  const factory LeanProductionFormState.loaded(
      {LeanProductionFormEntity? formEntity,
      bool? isSubmitting}) = LeanProductionFormStateLoaded;
  const factory LeanProductionFormState.error({String? errorText}) =
      LeanProductionFormStateError;

  factory LeanProductionFormState.fromJson(Map<String, dynamic> json) =>
      _$LeanProductionFormStateFromJson(json);
}
