import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/repos/cart_repo/cart_repo.dart';
import 'package:delivery_app/domain/repos/delivery_management_repos/delivery_management_repos.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/delivery_management_entities/delivery_entity.dart';

class GetUserOrdersByPhoneNumberUseCase
    extends UseCase<List<OrderEntity>, String> {
  CartRepo cartRepo;

  GetUserOrdersByPhoneNumberUseCase(this.cartRepo);
  @override
  Future<Either<Failure, List<OrderEntity>>> call(String param) async {
    return await cartRepo.getUserOrdersByPhoneNumber(userPhoneNumber: param);
  }
}
