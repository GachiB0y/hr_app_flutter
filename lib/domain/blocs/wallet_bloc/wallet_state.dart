part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.loading() = WalletStateLoading;
  const factory WalletState.loaded({required Wallet walletLoaded}) =
      WalletStateLoaded;
  const factory WalletState.error() = WalletStateError;

  factory WalletState.fromJson(Map<String, dynamic> json) =>
      _$WalletStateFromJson(json);
}
