part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.fetch({required String userToken}) =
      WalletEventFetch;
}
