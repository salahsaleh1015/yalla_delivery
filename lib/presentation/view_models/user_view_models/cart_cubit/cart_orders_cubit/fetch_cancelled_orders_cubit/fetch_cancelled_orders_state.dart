import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class FetchCancelledOrdersStates {}


final class FetchCancelledOrdersInitialState extends FetchCancelledOrdersStates {}

final class FetchCancelledOrdersSuccessState extends FetchCancelledOrdersStates {
  final List<OrderEntity> cancelledOrders;

  FetchCancelledOrdersSuccessState({required this.cancelledOrders});
}

final class FetchCancelledOrdersFailureState extends FetchCancelledOrdersStates {
  final String errorMsg;

  FetchCancelledOrdersFailureState({required this.errorMsg});
}

final class FetchCancelledOrdersLoadingState extends FetchCancelledOrdersStates {

}
