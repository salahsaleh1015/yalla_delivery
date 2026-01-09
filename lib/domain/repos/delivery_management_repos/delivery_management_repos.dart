import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';



abstract class DeliveryManagementRepo {

  Future<Either<Failure, List<DeliveryEntity>>> getAllDeliveries();
  Future<Either<Failure, List<DeliveryEntity>>> getAvailableDeliveries(
      {required String status});
  Future<Either<Failure, List<DeliveryEntity>>> getBusyDeliveries(
      {required String status});
  Future<Either<Failure, List<DeliveryEntity>>> getUnAvailableDeliveries(
      {required String status});
}
