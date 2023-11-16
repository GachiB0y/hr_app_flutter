part of 'rookies_bloc.dart';

// @freezed
// class RookiesState with _$RookiesState {
//   const factory RookiesState.loading() = RookiesStateLoading;
//   const factory RookiesState.loaded({required Rookies rookiesLoaded}) =
//       RookiesStateLoaded;
//   const factory RookiesState.error() = RookiesStateError;

//   factory RookiesState.fromJson(Map<String, dynamic> json) =>
//       _$RookiesStateFromJson(json);
// }

/// {@template rookies_state_placeholder}
/// Entity placeholder for RookiesState
/// {@endtemplate}
typedef RookiesEntity = Rookies;

/// {@template rookies_state}
/// RookiesState.
/// {@endtemplate}
sealed class RookiesState extends _$RookiesStateBase {
  /// Idling state
  /// {@macro rookies_state}
  const factory RookiesState.idle({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Idle;

  /// Processing
  /// {@macro rookies_state}
  const factory RookiesState.processing({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Processing;

  /// Successful
  /// {@macro rookies_state}
  const factory RookiesState.successful({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Successful;

  /// An error has occurred
  /// {@macro rookies_state}
  const factory RookiesState.error({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Error;

  /// {@macro rookies_state}
  const RookiesState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class RookiesState$Idle extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class RookiesState$Processing extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class RookiesState$Successful extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class RookiesState$Error extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$RookiesState on RookiesState {}

/// Pattern matching for [RookiesState].
typedef RookiesStateMatch<R, S extends RookiesState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$RookiesStateBase {
  /// {@nodoc}
  const _$RookiesStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final RookiesEntity? data;

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

  /// Pattern matching for [RookiesState].
  R map<R>({
    required RookiesStateMatch<R, RookiesState$Idle> idle,
    required RookiesStateMatch<R, RookiesState$Processing> processing,
    required RookiesStateMatch<R, RookiesState$Successful> successful,
    required RookiesStateMatch<R, RookiesState$Error> error,
  }) =>
      switch (this) {
        RookiesState$Idle s => idle(s),
        RookiesState$Processing s => processing(s),
        RookiesState$Successful s => successful(s),
        RookiesState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [RookiesState].
  R maybeMap<R>({
    RookiesStateMatch<R, RookiesState$Idle>? idle,
    RookiesStateMatch<R, RookiesState$Processing>? processing,
    RookiesStateMatch<R, RookiesState$Successful>? successful,
    RookiesStateMatch<R, RookiesState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [RookiesState].
  R? mapOrNull<R>({
    RookiesStateMatch<R, RookiesState$Idle>? idle,
    RookiesStateMatch<R, RookiesState$Processing>? processing,
    RookiesStateMatch<R, RookiesState$Successful>? successful,
    RookiesStateMatch<R, RookiesState$Error>? error,
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
