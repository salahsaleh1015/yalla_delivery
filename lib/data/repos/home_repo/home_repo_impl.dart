import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/domain/repos/home_repos/home_repo.dart';
import 'package:flutter/rendering.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners() async {
    try {
      List<HomeBannerEntity> banners;
      banners = homeLocalDataSource.getHomeBanners();
      if (banners.isNotEmpty) {
        return Right(banners);
      }
      banners = await homeRemoteDataSource.getHomeBanners();
      debugPrint(" the banners from the internet");
      return Right(banners);
    } catch (e) {
      if (e is FirebaseException) {

        return Left(FirebaseFailure.fromFirebaseException(e));
      }

      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeShopEntity>>> getHomeShops() async{
    try {
      List<HomeShopEntity> shops;
      shops = homeLocalDataSource.getHomeShops();
      if (shops.isNotEmpty) {
        return Right(shops);
      }
      shops = await homeRemoteDataSource.getHomeShops();
      debugPrint(" the shops from the internet");
      return Right(shops);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("ايه الكلمات");
        debugPrint(e.message);
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("ايه الكلمات");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeShopProductEntity>>> getHomeShopProducts({required String shopId}) async{
    try {
      List<HomeShopProductEntity> products;
      products = homeLocalDataSource.getShopProducts();
      if (products.isNotEmpty) {
        return Right(products);
      }
      products = await homeRemoteDataSource.getHomeShopProducts(shopId: shopId);
      debugPrint(" the products from the internet");
      return Right(products);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
