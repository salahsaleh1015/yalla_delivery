import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/repos/home_repos/home_repo.dart';

import '../../../core/usecase/usecase.dart';

class HomeGetBannersUseCase extends UseCase<List<HomeBannerEntity>, NoParam> {
  HomeRepo homeRepo;

  HomeGetBannersUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<HomeBannerEntity>>> call([NoParam? param]) async {
    return await homeRepo.getHomeBanners();
  }
}
