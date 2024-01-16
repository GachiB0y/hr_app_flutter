part of 'lean_production_form_bloc.dart';

// @freezed
// class LeanProductionFormState with _$LeanProductionFormState {
//   const factory LeanProductionFormState.loading() =
//       LeanProductionFormStateLoading;
//   const factory LeanProductionFormState.loaded(
//       {List<MyLeanProductionsEntity>? myProposals,
//       bool? isSubmitting,
//       @Default(false) bool? isLoadingFile}) = LeanProductionFormStateLoaded;
//   const factory LeanProductionFormState.error(
//       {String? errorText,
//       ApiClientExceptionType? exception}) = LeanProductionFormStateError;

//   factory LeanProductionFormState.fromJson(Map<String, dynamic> json) =>
//       _$LeanProductionFormStateFromJson(json);
// }

/// {@template lean_production_form_state_placeholder}
/// Entity placeholder for LeanProductionFormState
/// {@endtemplate}
typedef LeanProductionFormEntityDef = ViewModelMyLeanProductions;

/// {@template lean_production_form_state}
/// LeanProductionFormState.
/// {@endtemplate}
sealed class LeanProductionFormState extends _$LeanProductionFormStateBase {
  /// Idling state
  /// {@macro lean_production_form_state}
  const factory LeanProductionFormState.idle({
    required LeanProductionFormEntityDef? data,
    String message,
  }) = LeanProductionFormState$Idle;

  /// Processing
  /// {@macro lean_production_form_state}
  const factory LeanProductionFormState.processing({
    required LeanProductionFormEntityDef? data,
    String message,
  }) = LeanProductionFormState$Processing;

  /// Successful
  /// {@macro lean_production_form_state}
  const factory LeanProductionFormState.successful({
    required LeanProductionFormEntityDef? data,
    String message,
  }) = LeanProductionFormState$Successful;

  /// An error has occurred
  /// {@macro lean_production_form_state}
  const factory LeanProductionFormState.error({
    required LeanProductionFormEntityDef? data,
    String message,
  }) = LeanProductionFormState$Error;

  /// {@macro lean_production_form_state}
  const LeanProductionFormState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class LeanProductionFormState$Idle extends LeanProductionFormState
    with _$LeanProductionFormState {
  /// {@nodoc}
  const LeanProductionFormState$Idle(
      {required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class LeanProductionFormState$Processing extends LeanProductionFormState
    with _$LeanProductionFormState {
  /// {@nodoc}
  const LeanProductionFormState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class LeanProductionFormState$Successful extends LeanProductionFormState
    with _$LeanProductionFormState {
  /// {@nodoc}
  const LeanProductionFormState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class LeanProductionFormState$Error extends LeanProductionFormState
    with _$LeanProductionFormState {
  /// {@nodoc}
  const LeanProductionFormState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$LeanProductionFormState on LeanProductionFormState {}

/// Pattern matching for [LeanProductionFormState].
typedef LeanProductionFormStateMatch<R, S extends LeanProductionFormState> = R
    Function(S state);

/// {@nodoc}
@immutable
abstract base class _$LeanProductionFormStateBase {
  /// {@nodoc}
  const _$LeanProductionFormStateBase(
      {required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final LeanProductionFormEntityDef? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [LeanProductionFormState].
  R map<R>({
    required LeanProductionFormStateMatch<R, LeanProductionFormState$Idle> idle,
    required LeanProductionFormStateMatch<R, LeanProductionFormState$Processing>
        processing,
    required LeanProductionFormStateMatch<R, LeanProductionFormState$Successful>
        successful,
    required LeanProductionFormStateMatch<R, LeanProductionFormState$Error>
        error,
  }) =>
      switch (this) {
        LeanProductionFormState$Idle s => idle(s),
        LeanProductionFormState$Processing s => processing(s),
        LeanProductionFormState$Successful s => successful(s),
        LeanProductionFormState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [LeanProductionFormState].
  R maybeMap<R>({
    LeanProductionFormStateMatch<R, LeanProductionFormState$Idle>? idle,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Processing>?
        processing,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Successful>?
        successful,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [LeanProductionFormState].
  R? mapOrNull<R>({
    LeanProductionFormStateMatch<R, LeanProductionFormState$Idle>? idle,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Processing>?
        processing,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Successful>?
        successful,
    LeanProductionFormStateMatch<R, LeanProductionFormState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
