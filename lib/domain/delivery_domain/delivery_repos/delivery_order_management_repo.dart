


import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class DeliveryOrderManagementRepo {

  Future<Either<Failure, void>> getDeliveryPendingOrders();
  Future<Either<Failure, void>> getDeliveryCompletedOrders();
  Future<Either<Failure, void>> getDeliveryCancelledOrders();
  Future<Either<Failure, void>> getDeliveryAcceptedOrders();

}