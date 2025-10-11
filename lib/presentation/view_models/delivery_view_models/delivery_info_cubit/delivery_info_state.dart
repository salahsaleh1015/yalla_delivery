part of 'delivery_info_cubit.dart';


abstract class DeliveryInfoStates {}

final class DeliveryInfoInitialState extends DeliveryInfoStates {}

final class DeliveryGetInfoLoadingState extends DeliveryInfoStates {}

final class DeliveryGetInfoLoadedState extends DeliveryInfoStates {
  final DeliveryModel delivery;

  DeliveryGetInfoLoadedState({required this.delivery});
}

final class DeliveryGetInfoErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryGetInfoErrorState({required this.errorMessage});
}


class DeliveryUpdateInfoLoadingState extends DeliveryInfoStates {}

final class DeliveryUpdateInfoSavedState extends DeliveryInfoStates {}

final class DeliveryUpdateInfoErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryUpdateInfoErrorState({required this.errorMessage});
}


class DeliveryUpdateStatusLoadingState extends DeliveryInfoStates {}
class DeliveryUpdateStatusSuccessState extends DeliveryInfoStates {}
class DeliveryUpdateStatusErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryUpdateStatusErrorState({required this.errorMessage});
}
