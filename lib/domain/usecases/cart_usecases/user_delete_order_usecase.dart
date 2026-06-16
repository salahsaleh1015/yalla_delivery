import 'package:dartz/dartz.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/repos/cart_repo/cart_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';

class UserDeleteOrderUseCase extends UseCase<void, String> {
  CartRepo cartRepo;
  UserDeleteOrderUseCase(this.cartRepo);
  @override
  Future<Either<Failure, void>> call(String param) async {
    // check permission
    return await cartRepo.userDeleteOrder(
      orderId: param,
    );
  }
}
