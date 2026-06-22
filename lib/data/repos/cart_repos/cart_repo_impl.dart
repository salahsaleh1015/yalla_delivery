import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/data_sources/cart_data_sources/cart_local_data_source.dart';
import 'package:delivery_app/data/data_sources/cart_data_sources/cart_remote_data_source.dart';

import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:flutter/material.dart';

import '../../../domain/repos/cart_repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  CartRemoteDataSource cartRemoteDataSource;
  CartLocalDataSource cartLocalDataSource;
  CartRepoImpl(
      {required this.cartRemoteDataSource, required this.cartLocalDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchAcceptedOrders(
      {required String phoneNumber}) async {
    try {
      List<OrderEntity> orders;
      orders = cartLocalDataSource.fetchAcceptedOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await cartRemoteDataSource.fetchAcceptedOrders(
          phoneNumber: phoneNumber);
      debugPrint("cart from internet");
      return Right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("cart error////////////1");
        debugPrint(e.message.toString());
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("cart error////////////2");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));

    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchCancelledOrders(
      {required String phoneNumber}) async {
    try {
      List<OrderEntity> orders;
      orders = cartLocalDataSource.fetchCanceledOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await cartRemoteDataSource.fetchCanceledOrders(
          phoneNumber: phoneNumber);
      debugPrint("cart from internet");
      return Right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchCompletedOrders(
      {required String phoneNumber}) async {
    try {
      List<OrderEntity> orders;
      orders = cartLocalDataSource.fetchCompletedOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await cartRemoteDataSource.fetchCompletedOrders(
          phoneNumber: phoneNumber);
      debugPrint("cart from internet");
      return Right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchPendingOrders(
      {required String phoneNumber}) async {
    try {
      List<OrderEntity> orders;
      orders = cartLocalDataSource.fetchPendingOrders();
      if (orders.isNotEmpty) {
        return Right(orders);
      }
      orders = await cartRemoteDataSource.fetchPendingOrders(
          phoneNumber: phoneNumber);
      debugPrint("cart from internet");
      return Right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> userDeleteOrder(
      {required String orderId}) async {
    try {
      await cartRemoteDataSource.deleteOrder(
        orderId: orderId,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
