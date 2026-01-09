

import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/domain/repos/home_repos/home_repo.dart';

import '../../../core/usecase/usecase.dart';

class HomeGetShopProductsUseCase extends UseCase<List<HomeShopProductEntity>, String> {
  HomeRepo homeRepo;

  HomeGetShopProductsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<HomeShopProductEntity>>> call(String param) async {
    return await homeRepo.getHomeShopProducts(shopId: param);
  }
}
