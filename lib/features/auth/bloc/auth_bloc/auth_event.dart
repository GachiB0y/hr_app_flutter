part of 'auth_bloc.dart';

/// Business Logic Component Auth Events
@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  /// Get SMS code on phone number

  const factory AuthEvent.getCode({required String phoneNumber}) =
      GetCodeAuthEvent;

  /// Auth user on phone number and SMS code
  const factory AuthEvent.authByCode(
      {required String phoneNumber,
      required String code}) = AuthByCodeAuthEvent;

  /// Logout
  const factory AuthEvent.logout() = LogoutAuthEvent;
}
