part of 'lean_production_form_bloc.dart';

@freezed
class LeanProductionFormEvent with _$LeanProductionFormEvent {
  const factory LeanProductionFormEvent.submitForm(
          {required LeanProductionFormEntity formEntity}) =
      LeanProductionFormEventSubmitForm;
}
