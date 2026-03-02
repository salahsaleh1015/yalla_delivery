part of 'mail_auth_cubit.dart';

abstract class MailAuthStates {}

final class MailAuthInitialState extends MailAuthStates {}

final class MailAuthSignInLoadingState extends MailAuthStates {}
final class MailAuthSignInSuccessState extends MailAuthStates {}
final class MailAuthSignInErrorState extends MailAuthStates {}


final class MailAuthSignUpLoadingState extends MailAuthStates {}
final class MailAuthSignUpSuccessState extends MailAuthStates {}
final class MailAuthSignUpErrorState extends MailAuthStates {
  final String errorMessage;

  MailAuthSignUpErrorState({required this.errorMessage});
}
final class MailAuthEmailAlreadyInUseState extends MailAuthStates{}
