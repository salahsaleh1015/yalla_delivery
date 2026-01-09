import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:delivery_app/domain/repos/delivery_management_repos/delivery_management_repos.dart';
import 'package:flutter/material.dart';

import '../../data_sources/delivery_management_data_sources/delivery_management_local_data_sources/delivery_management_local_data_sources.dart';
import '../../data_sources/delivery_management_data_sources/delivery_management_remote_data_sources/delivery_management_remote_data_sources.dart';

class DeliveryManagementRepoImpl extends DeliveryManagementRepo {
  DeliveryManagementLocalDataSource deliveryManagementLocalDataSource;

  DeliveryManagementRemoteDataSources deliveryManagementRemoteDataSources;

  DeliveryManagementRepoImpl(
      {required this.deliveryManagementLocalDataSource,
      required this.deliveryManagementRemoteDataSources});

  @override
  Future<Either<Failure, List<DeliveryEntity>>> getAllDeliveries() async {
    try {
      List<DeliveryEntity> deliveries;
      deliveries = deliveryManagementLocalDataSource.getAllDeliveries();
      if (deliveries.isNotEmpty) {
        return Right(deliveries);
      }
      deliveries = await deliveryManagementRemoteDataSources.getAllDeliveries();
      debugPrint(" the deliveries from the internet");
      return Right(deliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryEntity>>> getAvailableDeliveries(
      {required String status}) async {
    try {
      List<DeliveryEntity> deliveries;
      deliveries = deliveryManagementLocalDataSource.getAvailableDeliveries(
          status: status);
      if (deliveries.isNotEmpty) {
        return Right(deliveries);
      }
      deliveries = await deliveryManagementRemoteDataSources
          .getAvailableDeliveries(status: status);
      debugPrint(" the deliveries from the internet");
      return Right(deliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryEntity>>> getBusyDeliveries(
      {required String status}) async {
    try {
      List<DeliveryEntity> deliveries;
      deliveries =
          deliveryManagementLocalDataSource.getBusyDeliveries(status: status);
      if (deliveries.isNotEmpty) {
        return Right(deliveries);
      }
      deliveries = await deliveryManagementRemoteDataSources.getBusyDeliveries(
          status: status);
      debugPrint(" the deliveries from the internet");
      return Right(deliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryEntity>>> getUnAvailableDeliveries(
      {required String status}) async {
    try {
      List<DeliveryEntity> deliveries;
      deliveries = deliveryManagementLocalDataSource.getUnAvailableDeliveries(
          status: status);
      if (deliveries.isNotEmpty) {
        return Right(deliveries);
      }
      deliveries = await deliveryManagementRemoteDataSources
          .getUnAvailableDeliveries(status: status);
      debugPrint(" the deliveries from the internet");
      return Right(deliveries);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
