part of 'phone_auth_cubit.dart';


abstract class PhoneAuthStates {}

final class PhoneAuthInitial extends PhoneAuthStates {}

final class PhoneAuthLoading extends PhoneAuthStates {}

final class PhoneAuthError extends PhoneAuthStates {
  final String errorMsg;

  PhoneAuthError({required this.errorMsg});
}

final class PhoneAuthNumberSubmitted extends PhoneAuthStates {}

final class PhoneAuthOTPVerified extends PhoneAuthStates {}


