





import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
abstract class GetAllDeliveriesStates {}

final class GetAllDeliveriesInitialState extends GetAllDeliveriesStates {}

final class GetAllDeliveriesLoadingState extends GetAllDeliveriesStates {}

final class GetAllDeliveriesLoadedState extends GetAllDeliveriesStates {
  final List<DeliveryEntity> deliveries;
  GetAllDeliveriesLoadedState({required this.deliveries});
}

final class GetAllDeliveriesErrorState extends GetAllDeliveriesStates {
  final String errorMessage;
  GetAllDeliveriesErrorState({required this.errorMessage});
}