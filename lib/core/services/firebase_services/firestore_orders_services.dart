import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/presentation/models/order_model.dart';

class FirestoreOrdersServices {
  final CollectionReference _ordersCollectionRef =
      FirebaseFirestore.instance.collection("Orders");

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Orders').doc();

  Future<void> addOrderToFireStore(OrderModel order) async {
    String orderId = documentReference.id;
    order.userOrderId = orderId;
    return await _ordersCollectionRef.doc(orderId).set(order.toJson());
  }
}
