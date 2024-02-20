part of 'coins_reward_bloc.dart';

/// {@template coins_reward_state_placeholder}
/// Entity placeholder for CoinsRewardState
/// {@endtemplate}
typedef CoinsRewardEntity = List<CoinsReward>;

/// {@template coins_reward_state}
/// CoinsRewardState.
/// {@endtemplate}
sealed class CoinsRewardState extends _$CoinsRewardStateBase {
  /// Idling state
  /// {@macro coins_reward_state}
  const factory CoinsRewardState.idle({
    required CoinsRewardEntity? data,
    String message,
  }) = CoinsRewardState$Idle;

  /// Processing
  /// {@macro coins_reward_state}
  const factory CoinsRewardState.processing({
    required CoinsRewardEntity? data,
    String message,
  }) = CoinsRewardState$Processing;

  /// Successful
  /// {@macro coins_reward_state}
  const factory CoinsRewardState.successful({
    required CoinsRewardEntity? data,
    String message,
  }) = CoinsRewardState$Successful;

  /// An error has occurred
  /// {@macro coins_reward_state}
  const factory CoinsRewardState.error({
    required CoinsRewardEntity? data,
    String message,
  }) = CoinsRewardState$Error;

  /// {@macro coins_reward_state}
  const CoinsRewardState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class CoinsRewardState$Idle extends CoinsRewardState
    with _$CoinsRewardState {
  /// {@nodoc}
  const CoinsRewardState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class CoinsRewardState$Processing extends CoinsRewardState
    with _$CoinsRewardState {
  /// {@nodoc}
  const CoinsRewardState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class CoinsRewardState$Successful extends CoinsRewardState
    with _$CoinsRewardState {
  /// {@nodoc}
  const CoinsRewardState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class CoinsRewardState$Error extends CoinsRewardState
    with _$CoinsRewardState {
  /// {@nodoc}
  const CoinsRewardState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$CoinsRewardState on CoinsRewardState {}

/// Pattern matching for [CoinsRewardState].
typedef CoinsRewardStateMatch<R, S extends CoinsRewardState> = R Function(
    S state);

/// {@nodoc}
@immutable
abstract base class _$CoinsRewardStateBase {
  /// {@nodoc}
  const _$CoinsRewardStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final CoinsRewardEntity? data;

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

  /// Pattern matching for [CoinsRewardState].
  R map<R>({
    required CoinsRewardStateMatch<R, CoinsRewardState$Idle> idle,
    required CoinsRewardStateMatch<R, CoinsRewardState$Processing> processing,
    required CoinsRewardStateMatch<R, CoinsRewardState$Successful> successful,
    required CoinsRewardStateMatch<R, CoinsRewardState$Error> error,
  }) =>
      switch (this) {
        CoinsRewardState$Idle s => idle(s),
        CoinsRewardState$Processing s => processing(s),
        CoinsRewardState$Successful s => successful(s),
        CoinsRewardState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CoinsRewardState].
  R maybeMap<R>({
    CoinsRewardStateMatch<R, CoinsRewardState$Idle>? idle,
    CoinsRewardStateMatch<R, CoinsRewardState$Processing>? processing,
    CoinsRewardStateMatch<R, CoinsRewardState$Successful>? successful,
    CoinsRewardStateMatch<R, CoinsRewardState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [CoinsRewardState].
  R? mapOrNull<R>({
    CoinsRewardStateMatch<R, CoinsRewardState$Idle>? idle,
    CoinsRewardStateMatch<R, CoinsRewardState$Processing>? processing,
    CoinsRewardStateMatch<R, CoinsRewardState$Successful>? successful,
    CoinsRewardStateMatch<R, CoinsRewardState$Error>? error,
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
