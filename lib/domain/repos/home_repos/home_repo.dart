import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners();
  Future<Either<Failure, List<HomeShopEntity>>> getHomeShops();
  Future<Either<Failure, List<HomeShopProductEntity>>> getHomeShopProducts(
      {required String shopId});
}
