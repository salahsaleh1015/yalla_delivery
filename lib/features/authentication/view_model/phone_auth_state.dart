part of 'phone_auth_cubit.dart';

@immutable
class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneAuthError extends PhoneAuthState {
  final String errorMsg;

  PhoneAuthError({required this.errorMsg});
}

final class PhoneAuthNumberSubmitted extends PhoneAuthState {}

final class PhoneAuthOTPVerified extends PhoneAuthState {}
