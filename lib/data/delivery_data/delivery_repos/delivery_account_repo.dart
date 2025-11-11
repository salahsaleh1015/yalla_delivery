import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/delivery_data/delivery_data_sources/local_data_sources/delivery_local_data_sources/delivery_account_local_data_source.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/functions/local_delivery_account_data_functions.dart';
import '../../../domain/delivery_domain/delivery_repos/delivery_info_repo.dart';
import '../delivery_data_sources/remote_data_sources/delivery_remote_data_sources/delivery_info_remote_data_source.dart';

class DeliveryInfoRepoImpl implements DeliveryInfoRepo {
  final DeliveryInfoLocalDataSource deliveryAccountLocalDataSource;
  final DeliveryInfoRemoteDataSource deliveryAccountRemoteDataSource;

  DeliveryInfoRepoImpl(this.deliveryAccountLocalDataSource,
      this.deliveryAccountRemoteDataSource);

  @override
  Future<Either<Failure, DeliveryInfoEntity>> fetchDeliveryAccountData({
    required String deliveryMail,
  }) async {
    try {
      DeliveryInfoEntity? deliveryAccount;

      try {
        // Try fetching locally first
        deliveryAccount =
            deliveryAccountLocalDataSource.fetchDeliveryAccountData();
      } catch (_) {
        // No saved data found locally — this is fine
        deliveryAccount = null;
      }

      // ✅ If we found a valid local copy, return it immediately
      if (deliveryAccount != null && deliveryAccount.deliveryPhone.isNotEmpty) {
        return Right(deliveryAccount);
      }

      // ✅ Otherwise, fetch from remote Firestore
      final remoteDelivery = await deliveryAccountRemoteDataSource
          .fetchDeliveryAccountData(deliveryMail: deliveryMail);

      // ✅ Save the remote data locally for next time
      deliveryAccountLocalDataSource.saveDeliveryAccountData(
        delivery: remoteDelivery,
      );

      return Right(remoteDelivery);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e));
    }
  }

  // @override
  // Future<Either<Failure, String>> getDeliveryStatus({
  //   required String deliveryMail,
  // }) async {
  //   try {
  //     String? status;
  //
  //     try {
  //       // Try to get status locally first
  //       status = deliveryAccountLocalDataSource.fetchDeliveryStatus(
  //         deliveryMail: deliveryMail,
  //       );
  //     } catch (_) {
  //       // No local data — continue to fetch from remote
  //       status = null;
  //     }
  //
  //     if (status != null && status.isNotEmpty) {
  //       return Right(status);
  //     }
  //
  //     // ✅ Otherwise, get it from Firestore
  //     final remoteStatus =
  //         await deliveryAccountRemoteDataSource.getDeliveryStatus(
  //       deliveryMail: deliveryMail,
  //     );
  //
  //     return Right(remoteStatus);
  //   } catch (e) {
  //     if (e is FirebaseException) {
  //       return Left(FirebaseFailure.fromFirebaseException(e));
  //     }
  //     return Left(FirebaseFailure.fromException(e));
  //   }
  // }

  String? _cachedStatus;

  @override
  Future<Either<Failure, String>> getDeliveryStatus({required String deliveryMail}) async {
    if (_cachedStatus != null) return Right(_cachedStatus!); // ✅ استخدم القيمة المخزنة

    // اقرأ من Local
    final localStatus = deliveryAccountLocalDataSource.fetchDeliveryStatus(deliveryMail: deliveryMail);
    if (localStatus != null && localStatus.isNotEmpty) {
      _cachedStatus = localStatus;
      return Right(localStatus);
    }

    // fetch من Firebase
    final remoteStatus = await deliveryAccountRemoteDataSource.getDeliveryStatus(deliveryMail: deliveryMail);
    _cachedStatus = remoteStatus;

    // خزّن في Local
    saveDeliveryStatus(status: remoteStatus, boxName: kDeliveryInfoBox);

    return Right(remoteStatus);
  }


  @override
  Future<Either<Failure, void>> editDeliveryAccountData({
    required DeliveryInfoEntity deliveryAccountEntity,
  }) async {
    try {
      // Step 1 — Update remote Firestore
      await deliveryAccountRemoteDataSource.editDeliveryAccountData(
        deliveryAccountEntity: deliveryAccountEntity,
      );

      // Step 2 — Update local Hive cache
      deliveryAccountLocalDataSource.editDeliveryAccountData(
        updatedDelivery: deliveryAccountEntity,
      );

      // Step 3 — Return success
      return const Right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e));
    }
  }
}
