part of 'delivery_orders_cubit.dart';


sealed class DeliveryOrdersStates {}

final class DeliveryOrdersInitialState extends DeliveryOrdersStates {}

final class DeliveryGetPendingOrdersLoadingState extends DeliveryOrdersStates {}
final class DeliveryGetPendingOrdersSuccessState extends DeliveryOrdersStates {
}

final class DeliveryGetPendingOrdersErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryGetPendingOrdersErrorState({required this.error});
}


final class DeliveryGetAcceptedOrdersLoadingState extends DeliveryOrdersStates {}
final class DeliveryGetAcceptedOrdersSuccessState extends DeliveryOrdersStates {
}

final class DeliveryGetAcceptedOrdersErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryGetAcceptedOrdersErrorState({required this.error});
}


final class DeliveryGetCanceledOrdersLoadingState extends DeliveryOrdersStates {}
final class DeliveryGetCanceledOrdersSuccessState extends DeliveryOrdersStates {
}

final class DeliveryGetCanceledOrdersErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryGetCanceledOrdersErrorState({required this.error});
}



final class DeliveryGetCompletedOrdersLoadingState extends DeliveryOrdersStates {}
final class DeliveryGetCompletedOrdersSuccessState extends DeliveryOrdersStates {
}

final class DeliveryGetCompletedOrdersErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryGetCompletedOrdersErrorState({required this.error});
}


final class DeliveryEditOrderStatusLoadingState extends DeliveryOrdersStates {}
final class DeliveryEditOrderStatusSuccessState extends DeliveryOrdersStates {}

final class DeliveryEditOrderStatusErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryEditOrderStatusErrorState({required this.error});
}