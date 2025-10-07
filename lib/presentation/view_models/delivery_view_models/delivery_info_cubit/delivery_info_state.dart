part of 'delivery_info_cubit.dart';


abstract class DeliveryInfoStates {}

final class DeliveryInfoInitialState extends DeliveryInfoStates {}

final class DeliveryGetInfoLoadingState extends DeliveryInfoStates {}

final class DeliveryGetInfoLoadedState extends DeliveryInfoStates {}

final class DeliveryGetInfoErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryGetInfoErrorState({required this.errorMessage});
}
