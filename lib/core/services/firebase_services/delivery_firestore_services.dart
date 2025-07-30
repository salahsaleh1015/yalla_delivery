import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryFirestoreServices {
  final CollectionReference _deliveryCollectionRef =
      FirebaseFirestore.instance.collection("Deliveries");

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Deliveries').doc();


  Future<List<QueryDocumentSnapshot>> getAllDeliveriesByStatus(
      {required String deliveryStatus}) async {
    var value = await _deliveryCollectionRef
        .where('deliveryStatus', isEqualTo: deliveryStatus)
        .get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getAllDeliveries() async {
    var value = await _deliveryCollectionRef.get();
    return value.docs;
  }
}
