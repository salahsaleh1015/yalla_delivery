import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DeliveryAccountRepo {
  Future<Either<Failure, DeliveryAccountEntity>> fetchDeliveryAccountData(
      {required String deliveryMail});
  Future<Either<Failure, void>> editDeliveryAccountData(
      {required DeliveryAccountEntity deliveryAccountEntity});
}
