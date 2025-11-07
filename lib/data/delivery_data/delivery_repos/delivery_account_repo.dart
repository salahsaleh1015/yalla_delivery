import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/delivery_data/delivery_data_sources/local_data_sources/delivery_local_data_sources/delivery_account_local_data_source.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';

import '../../../domain/delivery_domain/delivery_repos/delivery_account_repo.dart';
import '../delivery_data_sources/remote_data_sources/delivery_remote_data_sources/delivery_account_remote_data_source.dart';

class DeliveryAccountRepoImpl implements DeliveryAccountRepo {
  final DeliveryAccountLocalDataSource deliveryAccountLocalDataSource;
  final DeliveryAccountRemoteDataSource deliveryAccountRemoteDataSource;

  DeliveryAccountRepoImpl(this.deliveryAccountLocalDataSource,
      this.deliveryAccountRemoteDataSource);

  @override
  Future<Either<Failure, void>> editDeliveryAccountData({

    required DeliveryAccountEntity deliveryAccountEntity,
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

  @override
  Future<Either<Failure, DeliveryAccountEntity>> fetchDeliveryAccountData({
    required String deliveryMail,
  }) async {
    try {
      DeliveryAccountEntity? deliveryAccount;

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

}
