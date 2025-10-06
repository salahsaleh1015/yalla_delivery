part of 'delivery_authentication_cubit.dart';


abstract class DeliveryAuthenticationStates {}

final class DeliveryAuthenticationInitialState extends DeliveryAuthenticationStates {}

final class DeliveryAuthenticationLoadingState extends DeliveryAuthenticationStates {}

final class DeliveryAuthenticationErrorState extends DeliveryAuthenticationStates {
  final String errorMessage;
  DeliveryAuthenticationErrorState({required this.errorMessage});
}

final class DeliveryAuthenticationSuccessState extends DeliveryAuthenticationStates {}
