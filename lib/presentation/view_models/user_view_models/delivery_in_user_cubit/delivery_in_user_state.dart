part of 'delivery_in_user_cubit.dart';

abstract class DeliveryInUserStates {}

final class DeliveryInUserInitial extends DeliveryInUserStates {}

final class GetAllDeliveriesInUserByStatusSuccessState extends DeliveryInUserStates {}

final class GetAllDeliveriesInUserByStatusLoadingState extends DeliveryInUserStates {}

final class GetAllDeliveriesInUserByStatusErrorState extends DeliveryInUserStates {
  final String errorMsg;

  GetAllDeliveriesInUserByStatusErrorState({required this.errorMsg});
}


final class GetAllDeliveriesInUserSuccessState extends DeliveryInUserStates {}

final class GetAllDeliveriesInUsersLoadingState extends DeliveryInUserStates {}

final class GetAllDeliveriesInUserErrorState extends DeliveryInUserStates {
  final String errorMsg;

  GetAllDeliveriesInUserErrorState({required this.errorMsg});
}
