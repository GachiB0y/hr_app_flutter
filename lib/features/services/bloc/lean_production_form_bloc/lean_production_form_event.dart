part of 'lean_production_form_bloc.dart';

// @freezed
// class LeanProductionFormEvent with _$LeanProductionFormEvent {
//   const factory LeanProductionFormEvent.getMyLeanProductions() =
//       LeanProductionFormEventGetMyLeanProductions;
//   const factory LeanProductionFormEvent.createInitState() =
//       LeanProductionFormEventCreateInitState;
//   const factory LeanProductionFormEvent.submitForm(
//           {required LeanProductionFormEntity formEntity}) =
//       LeanProductionFormEventSubmitForm;

//   const factory LeanProductionFormEvent.downloadFileWithLeanProduction(
//           {required String url}) =
//       LeanProductionFormEventDownloadFileWithLeanProduction;
// }

/// Business Logic Component LeanProductionForm Events
@freezed
class LeanProductionFormEvent with _$LeanProductionFormEvent {
  const LeanProductionFormEvent._();

  /// Get My Lean Productions
  const factory LeanProductionFormEvent.getMyLeanProductions() =
      GetMyLeanProductionsLeanProductionFormEvent;

  // /// Create Init State
  // const factory LeanProductionFormEvent.createInitState() =
  //     CreateInitStateLeanProductionFormEvent;

  /// Submit Form
  const factory LeanProductionFormEvent.submitForm(
          {required LeanProductionFormEntity formEntity}) =
      SubmitFormLeanProductionFormEvent;

  /// Download File With Lean Production
  const factory LeanProductionFormEvent.downloadFileWithLeanProduction(
          {required String url}) =
      DownloadFileWithLeanProductionLeanProductionFormEvent;
}
