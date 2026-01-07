import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:delivery_app/data/data_sources/home_data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
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
}
