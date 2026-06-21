import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class FetchCompletedOrdersStates {}


final class FetchCompletedOrdersInitialState extends FetchCompletedOrdersStates {}

final class FetchCompleteOrdersSuccessState extends FetchCompletedOrdersStates {
  final List<OrderEntity> completedOrders;

  FetchCompleteOrdersSuccessState({required this.completedOrders});
}

final class FetchCompleteOrdersFailureState extends FetchCompletedOrdersStates {
  final String errorMsg;

  FetchCompleteOrdersFailureState({required this.errorMsg});
}

final class FetchCompleteOrdersLoadingState extends FetchCompletedOrdersStates {

}
