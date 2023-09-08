part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.fetch() = WalletEventFetch;

  const factory WalletEvent.sendCoinsToOtherUser(
      {required int amount,
      required int userId,
      required String message}) = WalletEventSendCoinsToOtherUser;
}
