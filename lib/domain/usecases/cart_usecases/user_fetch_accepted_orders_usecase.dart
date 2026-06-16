import 'package:dartz/dartz.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/repos/cart_repo/cart_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';

class UserFetchAcceptedOrdersUseCase
    extends UseCase<List<OrderEntity>, String> {
  CartRepo cartRepo;
  UserFetchAcceptedOrdersUseCase(this.cartRepo);
  @override
  Future<Either<Failure, List<OrderEntity>>> call(
      String param) async {
    // check permission
    return await cartRepo.userFetchAcceptedOrders(
      userPhoneNumber: param,
    );
  }
}