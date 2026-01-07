

import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/repos/home_repos/home_repo.dart';

import '../../../core/usecase/usecase.dart';

class HomeGetShopsUseCase extends UseCase<List<HomeShopEntity>, NoParam> {
  HomeRepo homeRepo;

  HomeGetShopsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<HomeShopEntity>>> call([NoParam? param]) async {
    return await homeRepo.getHomeShops();
  }
}