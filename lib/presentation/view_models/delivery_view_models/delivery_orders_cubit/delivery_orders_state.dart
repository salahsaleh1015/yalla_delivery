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


final class DeliveryEditOrderStatusLoadingState extends DeliveryOrdersStates {}
final class DeliveryEditOrderStatusSuccessState extends DeliveryOrdersStates {}

final class DeliveryEditOrderStatusErrorState extends DeliveryOrdersStates {
  final String error;
  DeliveryEditOrderStatusErrorState({required this.error});
}