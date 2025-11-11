part of 'delivery_info_cubit.dart';


abstract class DeliveryInfoStates {}

final class DeliveryInfoInitialState extends DeliveryInfoStates {}


final class DeliveryGetInfoLoadingState extends DeliveryInfoStates {}

final class DeliveryGetInfoLoadedState extends DeliveryInfoStates {
  final DeliveryInfoEntity delivery;

  DeliveryGetInfoLoadedState({required this.delivery});
}

final class DeliveryGetInfoErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryGetInfoErrorState({required this.errorMessage});
}




class DeliveryEditInfoLoadingState extends DeliveryInfoStates {}

final class DeliveryEditInfoSavedState extends DeliveryInfoStates {}

final class DeliveryEditInfoErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryEditInfoErrorState({required this.errorMessage});
}



class DeliveryEditStatusLoadingState extends DeliveryInfoStates {}
class DeliveryEditStatusSuccessState extends DeliveryInfoStates {
}
class DeliveryEditStatusErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryEditStatusErrorState({required this.errorMessage});
}



final class DeliveryGetStatusLoadingState extends DeliveryInfoStates {}

final class DeliveryGetStatusLoadedState extends DeliveryInfoStates {
  final String deliveryStatus;

  DeliveryGetStatusLoadedState({required this.deliveryStatus});
}

final class DeliveryGetStatusErrorState extends DeliveryInfoStates {
  final String errorMessage;

  DeliveryGetStatusErrorState({required this.errorMessage});
}

