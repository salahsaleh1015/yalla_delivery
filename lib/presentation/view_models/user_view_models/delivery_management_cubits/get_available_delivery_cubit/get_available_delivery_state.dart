


import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class GetAvailableDeliveryStates {}

final class GetAvailableDeliveryInitialState extends GetAvailableDeliveryStates {}

final class GetAvailableDeliveryLoadingState extends GetAvailableDeliveryStates {}

final class GetAvailableDeliveryLoadedState extends GetAvailableDeliveryStates {
  final List<DeliveryEntity> deliveries;
  GetAvailableDeliveryLoadedState({required this.deliveries});
}

final class GetAvailableDeliveryErrorState extends GetAvailableDeliveryStates {
  final String errorMessage;

  GetAvailableDeliveryErrorState({required this.errorMessage});
}
