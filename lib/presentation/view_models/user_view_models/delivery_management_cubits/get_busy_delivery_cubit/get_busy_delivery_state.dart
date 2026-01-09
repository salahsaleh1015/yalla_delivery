
import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class GetBusyDeliveryStates {}

final class GetBusyDeliveryInitialState extends GetBusyDeliveryStates {}


final class GetBusyDeliveryLoadingState extends GetBusyDeliveryStates {}


final class GetBusyDeliveryLoadedState extends GetBusyDeliveryStates {
  final List<DeliveryEntity> busyDeliveries;
  GetBusyDeliveryLoadedState({required this.busyDeliveries});
}

final class GetBusyDeliveryErrorState extends GetBusyDeliveryStates {
  final String errorMessage;
  GetBusyDeliveryErrorState({required this.errorMessage});
}
