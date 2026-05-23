import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/services/firebase_services/firestore_orders_services.dart';
import 'package:delivery_app/data/models/order_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderEntity>> getUserOrdersByPhoneNumber({
    required String userPhoneNumber,
  });
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  OrdersRemoteDataSourceImpl(this.firestoreOrdersServices);
  FirestoreOrdersServices firestoreOrdersServices;
  @override
  Future<List<OrderEntity>> getUserOrdersByPhoneNumber({
    required String userPhoneNumber,
  }) async {
    var data = await firestoreOrdersServices.getUserOrdersByPhoneNumber(
      userPhoneNumber: userPhoneNumber,
    );

    List<OrderEntity> orders = getOrdersList(data);

    return orders;
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
