part of 'wallet_bloc.dart';

// @freezed
// class WalletState with _$WalletState {
//   const factory WalletState.loading() = WalletStateLoading;
//   const factory WalletState.loaded({required Wallet walletLoaded}) =
//       WalletStateLoaded;
//   const factory WalletState.error() = WalletStateError;

//   factory WalletState.fromJson(Map<String, dynamic> json) =>
//       _$WalletStateFromJson(json);
// }

/// {@template wallet_state_placeholder}
/// Entity placeholder for WalletState
/// {@endtemplate}
typedef WalletEntity = Wallet;

/// {@template wallet_state}
/// WalletState.
/// {@endtemplate}
sealed class WalletState extends _$WalletStateBase {
  /// Idling state
  /// {@macro wallet_state}
  const factory WalletState.idle({
    required WalletEntity? data,
    String message,
  }) = WalletState$Idle;

  /// Processing
  /// {@macro wallet_state}
  const factory WalletState.processing({
    required WalletEntity? data,
    String message,
  }) = WalletState$Processing;

  /// Successful
  /// {@macro wallet_state}
  const factory WalletState.successful({
    required WalletEntity? data,
    String message,
  }) = WalletState$Successful;

  /// An error has occurred
  /// {@macro wallet_state}
  const factory WalletState.error({
    required WalletEntity? data,
    String message,
  }) = WalletState$Error;

  /// {@macro wallet_state}
  const WalletState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class WalletState$Idle extends WalletState with _$WalletState {
  /// {@nodoc}
  const WalletState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class WalletState$Processing extends WalletState with _$WalletState {
  /// {@nodoc}
  const WalletState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class WalletState$Successful extends WalletState with _$WalletState {
  /// {@nodoc}
  const WalletState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class WalletState$Error extends WalletState with _$WalletState {
  /// {@nodoc}
  const WalletState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$WalletState on WalletState {}

/// Pattern matching for [WalletState].
typedef WalletStateMatch<R, S extends WalletState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$WalletStateBase {
  /// {@nodoc}
  const _$WalletStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final WalletEntity? data;

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

  /// Pattern matching for [WalletState].
  R map<R>({
    required WalletStateMatch<R, WalletState$Idle> idle,
    required WalletStateMatch<R, WalletState$Processing> processing,
    required WalletStateMatch<R, WalletState$Successful> successful,
    required WalletStateMatch<R, WalletState$Error> error,
  }) =>
      switch (this) {
        WalletState$Idle s => idle(s),
        WalletState$Processing s => processing(s),
        WalletState$Successful s => successful(s),
        WalletState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [WalletState].
  R maybeMap<R>({
    WalletStateMatch<R, WalletState$Idle>? idle,
    WalletStateMatch<R, WalletState$Processing>? processing,
    WalletStateMatch<R, WalletState$Successful>? successful,
    WalletStateMatch<R, WalletState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [WalletState].
  R? mapOrNull<R>({
    WalletStateMatch<R, WalletState$Idle>? idle,
    WalletStateMatch<R, WalletState$Processing>? processing,
    WalletStateMatch<R, WalletState$Successful>? successful,
    WalletStateMatch<R, WalletState$Error>? error,
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
