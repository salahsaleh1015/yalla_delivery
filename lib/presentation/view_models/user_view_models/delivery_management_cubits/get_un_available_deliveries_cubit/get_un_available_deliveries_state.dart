
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class GetUnAvailableDeliveriesStates {}

final class GetUnAvailableDeliveriesInitialState extends GetUnAvailableDeliveriesStates{}

final class GetUnAvailableDeliveriesLoadingState extends GetUnAvailableDeliveriesStates{}

final class GetUnAvailableDeliveriesLoadedState extends GetUnAvailableDeliveriesStates{
  final List<DeliveryEntity> deliveriesList;
  GetUnAvailableDeliveriesLoadedState({required this.deliveriesList});
}

final class GetUnAvailableDeliveriesErrorState extends GetUnAvailableDeliveriesStates{
  final String errorMessage;
  GetUnAvailableDeliveriesErrorState({required this.errorMessage});
}
