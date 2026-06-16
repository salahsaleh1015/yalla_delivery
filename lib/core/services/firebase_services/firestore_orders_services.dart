import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/data/models/order_model.dart';

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

  Future<List<QueryDocumentSnapshot>> getUserPendingOrdersByPhoneNumber({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "المعلقة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserAcceptedOrdersByGmail({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "المقبولة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserCanceledOrdersByGmail({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "الملغية")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserCompletedOrdersByGmail({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "المكتملة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<void> deleteOrder({required String orderId}) async {
    await _ordersCollectionRef.doc(orderId).delete();
  }
}
