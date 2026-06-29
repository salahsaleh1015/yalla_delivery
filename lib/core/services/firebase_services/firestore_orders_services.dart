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
        .orderBy("timeStamp", descending: true)
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserAcceptedOrdersByPhoneNumber({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "المقبولة")
        .orderBy("timeStamp", descending: true)
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserCanceledOrdersByPhoneNumber({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "الملغية")
        .orderBy("timeStamp", descending: true)
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserCompletedOrdersByPhoneNumber({
    required String phoneNumber,
  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("userPhoneNumber", isEqualTo: phoneNumber)
        .where("userOrderStatus", isEqualTo: "المكتملة")
        .orderBy("timeStamp", descending: true)
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<void> deleteOrder({required String orderId}) async {
    await _ordersCollectionRef.doc(orderId).delete();
  }
}
