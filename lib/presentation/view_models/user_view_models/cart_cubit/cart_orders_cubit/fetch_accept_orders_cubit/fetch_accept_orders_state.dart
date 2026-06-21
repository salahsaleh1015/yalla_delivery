import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class FetchAcceptOrdersStates {}

final class FetchAcceptOrdersInitialState extends FetchAcceptOrdersStates {}

final class FetchAcceptedOrdersSuccessState extends FetchAcceptOrdersStates {
  final List<OrderEntity> acceptedOrders;

  FetchAcceptedOrdersSuccessState({required this.acceptedOrders});
}

final class FetchAcceptedOrdersFailureState extends FetchAcceptOrdersStates {
  final String errorMsg;

  FetchAcceptedOrdersFailureState({required this.errorMsg});
}

final class FetchAcceptOrdersLoadingState extends FetchAcceptOrdersStates {

}
