part of 'lean_production_form_bloc.dart';

@freezed
class LeanProductionFormEvent with _$LeanProductionFormEvent {
  const factory LeanProductionFormEvent.getMyLeanProductions() =
      LeanProductionFormEventGetMyLeanProductions;
  const factory LeanProductionFormEvent.createInitState() =
      LeanProductionFormEventCreateInitState;
  const factory LeanProductionFormEvent.submitForm(
          {required LeanProductionFormEntity formEntity}) =
      LeanProductionFormEventSubmitForm;

  const factory LeanProductionFormEvent.downloadFileWithLeanProduction(
          {required String url}) =
      LeanProductionFormEventDownloadFileWithLeanProduction;
}
