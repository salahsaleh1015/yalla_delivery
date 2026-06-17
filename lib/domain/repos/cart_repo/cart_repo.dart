import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchPendingOrders(
      {required String phoneNumber});
  Future<Either<Failure, List<OrderEntity>>> fetchCompletedOrders(
      {required String phoneNumber});
  Future<Either<Failure, List<OrderEntity>>>fetchCancelledOrders(
      {required String phoneNumber});
  Future<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders(
      {required String phoneNumber});
  Future<Either<Failure, void>> userDeleteOrder({required String orderId});
}
