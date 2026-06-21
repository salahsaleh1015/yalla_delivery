import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/services/firebase_services/firestore_orders_services.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class CartRemoteDataSource {
  Future<List<OrderEntity>> fetchPendingOrders(
      {required String phoneNumber});
  Future<List<OrderEntity>> fetchCanceledOrders(
      {required String phoneNumber});
  Future<List<OrderEntity>> fetchCompletedOrders(
      {required String phoneNumber});
  Future<List<OrderEntity>> fetchAcceptedOrders(
      {required String phoneNumber});
  Future<void> deleteOrder({required String orderId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  CartRemoteDataSourceImpl(this.firestoreOrdersServices);
  FirestoreOrdersServices firestoreOrdersServices;

  @override
  Future<void> deleteOrder({required String orderId}) async {
    await firestoreOrdersServices.deleteOrder(orderId: orderId);
  }

  @override
  Future<List<OrderEntity>> fetchAcceptedOrders(
      {required String phoneNumber}) async {
    var data = await firestoreOrdersServices.getUserAcceptedOrdersByPhoneNumber(
        phoneNumber: phoneNumber);

    List<OrderEntity> acceptedOrders = getOrdersList(data);
    saveOrdersData(orders: acceptedOrders, boxName: kAcceptedOrdersBox);
    return acceptedOrders;
  }

  @override
  Future<List<OrderEntity>> fetchCanceledOrders(
      {required String phoneNumber}) async {
    var data = await firestoreOrdersServices.getUserCanceledOrdersByPhoneNumber(
        phoneNumber: phoneNumber);

    List<OrderEntity> canceledOrders = getOrdersList(data);
    saveOrdersData(orders: canceledOrders, boxName: kCanceledOrdersBox);
    return canceledOrders;
  }

  @override
  Future<List<OrderEntity>> fetchCompletedOrders(
      {required String phoneNumber}) async {
    var data = await firestoreOrdersServices
        .getUserCompletedOrdersByPhoneNumber(phoneNumber: phoneNumber);

    List<OrderEntity> completedOrders = getOrdersList(data);
    saveOrdersData(orders: completedOrders, boxName: kCompletedOrdersBox);
    return completedOrders;
  }

  @override
  Future<List<OrderEntity>> fetchPendingOrders(
      {required String phoneNumber}) async {
    var data = await firestoreOrdersServices.getUserPendingOrdersByPhoneNumber(
        phoneNumber: phoneNumber);

    List<OrderEntity> pendingOrders = getOrdersList(data);
    saveOrdersData(orders: pendingOrders, boxName: kPendingOrdersBox);
    return pendingOrders;
  }

  List<OrderEntity> getOrdersList(List<QueryDocumentSnapshot> docs) {
    List<OrderEntity> orders = [];

    for (var doc in docs) {
      orders.add(
        OrderModel.fromJson(doc.data() as Map<String, dynamic>),
      );
    }

    return orders;
  }
}
