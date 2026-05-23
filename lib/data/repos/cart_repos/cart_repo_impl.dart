import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/data_sources/cart_data_sources/cart_remote_data_source.dart';

import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:flutter/material.dart';

import '../../../domain/repos/cart_repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  OrdersRemoteDataSource ordersRemoteDataSource;
  CartRepoImpl({required this.ordersRemoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getUserOrdersByPhoneNumber(
      {required String userPhoneNumber}) async {
    try {
      List<OrderEntity> orders;
      orders = await ordersRemoteDataSource.getUserOrdersByPhoneNumber(
          userPhoneNumber: userPhoneNumber);
      debugPrint(" the deliveries from the internet");
      return Right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
