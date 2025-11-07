part of 'delivery_get_info_cubit.dart';


abstract class DeliveryGetInfoStates {}

final class DeliveryInfoInitialState extends DeliveryGetInfoStates {}

final class DeliveryGetInfoLoadingState extends DeliveryGetInfoStates {}

final class DeliveryGetInfoLoadedState extends DeliveryGetInfoStates {
  final DeliveryAccountEntity delivery;

  DeliveryGetInfoLoadedState({required this.delivery});
}

final class DeliveryGetInfoErrorState extends DeliveryGetInfoStates {
  final String errorMessage;

  DeliveryGetInfoErrorState({required this.errorMessage});
}








