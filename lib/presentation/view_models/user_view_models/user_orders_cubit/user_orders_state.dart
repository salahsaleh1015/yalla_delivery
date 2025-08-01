part of 'user_orders_cubit.dart';


abstract class UserOrdersStates {}

final class UserOrdersInitial extends UserOrdersStates {}

final class UserOrdersAddOrderLoadingState extends UserOrdersStates {}

final class UserOrdersAddOrderSuccessState extends UserOrdersStates {}

final class UserOrdersAddOrderErrorState extends UserOrdersStates {
  final String error;

  UserOrdersAddOrderErrorState({required this.error});
}
