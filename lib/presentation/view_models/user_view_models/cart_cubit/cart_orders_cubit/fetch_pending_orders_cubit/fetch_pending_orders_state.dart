import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class FetchPendingOrdersStates {}


final class FetchPendingOrdersInitialState extends FetchPendingOrdersStates {}

final class FetchPendingOrdersSuccessState extends FetchPendingOrdersStates {
  final List<OrderEntity> pendingOrders;

  FetchPendingOrdersSuccessState({required this.pendingOrders});
}

final class FetchPendingOrdersFailureState extends FetchPendingOrdersStates {
  final String errorMsg;

  FetchPendingOrdersFailureState({required this.errorMsg});
}

final class FetchPendingOrdersLoadingState extends FetchPendingOrdersStates {

}
