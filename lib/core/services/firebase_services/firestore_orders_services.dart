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

  Future<List<QueryDocumentSnapshot>> getDeliveryPendingOrdersByGmail({
    required String deliveryMail,

  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("deliveryMail", isEqualTo: deliveryMail)
        .where("userOrderStatus", isEqualTo: "المعلقة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDeliveryAcceptedOrdersByGmail({
    required String deliveryMail,

  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("deliveryMail", isEqualTo: deliveryMail)
        .where("userOrderStatus", isEqualTo: "المقبولة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }



  Future<List<QueryDocumentSnapshot>> getDeliveryCanceledOrdersByGmail({
    required String deliveryMail,

  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("deliveryMail", isEqualTo: deliveryMail)
        .where("userOrderStatus", isEqualTo: "الملغية")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDeliveryCompletedOrdersByGmail({
    required String deliveryMail,

  }) async {
    QuerySnapshot querySnapshot = await _ordersCollectionRef
        .where("deliveryMail", isEqualTo: deliveryMail)
        .where("userOrderStatus", isEqualTo: "المكتملة")
        .get();

    // Return the list of documents
    return querySnapshot.docs;
  }


  Future<void> editDeliveryOrderStatus(
      {required String orderId, required String newStatus}) async {
    await _ordersCollectionRef
        .doc(orderId)
        .update({"userOrderStatus": newStatus});
    print("Order $orderId status updated to $newStatus");
  }
}
