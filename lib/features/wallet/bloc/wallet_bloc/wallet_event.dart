part of 'wallet_bloc.dart';

// @freezed
// class WalletEvent with _$WalletEvent {
//   const factory WalletEvent.fetch() = WalletEventFetch;

//   const factory WalletEvent.sendCoinsToOtherUser(
//       {required int amount,
//       required int userId,
//       required String message}) = WalletEventSendCoinsToOtherUser;
//   const factory WalletEvent.sendCoinsToBracer({
//     required int amount,
//   }) = WalletEventSendCoinsToBracer;
// }

/// Business Logic Component Wallet Events
@freezed
class WalletEvent with _$WalletEvent {
  const WalletEvent._();

  /// Fetch
  const factory WalletEvent.fetch() = FetchWalletEvent;

  /// SendCoinsToBracer
  const factory WalletEvent.sendCoinsToBracer({required int amount}) =
      WalletEventSendCoinsToBracer;

  /// SendCoinsToOtherUser
  const factory WalletEvent.sendCoinsToOtherUser(
      {required int amount,
      required int userId,
      required String message}) = WalletEventSendCoinsToOtherUser;
}
