import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class CartGetOrdersStates {}

final class CartGetOrdersInitialState extends CartGetOrdersStates {}

final class CartGetOrdersLoadingState extends CartGetOrdersStates {}

final class CartGetOrderSuccessState extends CartGetOrdersStates {
  final List<OrderEntity> orders;

  CartGetOrderSuccessState({required this.orders});
}
final class CartGetOrdersErrorState extends CartGetOrdersStates {
  final String errorMsg;

  CartGetOrdersErrorState({required this.errorMsg});
}
