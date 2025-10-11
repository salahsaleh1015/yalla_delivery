import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDeliveryServices {
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

  Future<QueryDocumentSnapshot?> getDeliveryByMail(
      {required String mail}) async {
    var value = await _deliveryCollectionRef
        .where('deliveryMail', isEqualTo: mail)
        .limit(1)
        .get();
    if (value.docs.isNotEmpty) {
      return value.docs.first;
    } else {
      return null; // مفيش مستخدم بالبريد ده
    }
  }

  Future<void> editDeliveryInfoByEmail({
    required String email,
    required String name,
    required String location,
    required String phoneNumber,
  }) async {
    try {
      // Query the document that matches the provided email
      QuerySnapshot querySnapshot = await _deliveryCollectionRef
          .where('deliveryMail', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('❌ No delivery found with email: $email');
        return;
      }

      // Get the document ID of the first matched delivery
      final docId = querySnapshot.docs.first.id;

      // Update the document fields
      await _deliveryCollectionRef.doc(docId).update({
        'deliveryName': name,
        'deliveryLocation': location,
        'deliveryPhone': phoneNumber,
      });

      print('✅ Delivery info updated successfully for $email');
    } catch (e) {
      print('❌ Failed to update delivery info: $e');
      rethrow;
    }
  }

 Future<void> editDeliveryStatusByEmail({required String email, required String deliveryStatus}) async {
    await _deliveryCollectionRef
        .where('deliveryMail', isEqualTo: email)
        .limit(1)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        _deliveryCollectionRef.doc(docId).update({'deliveryStatus': deliveryStatus});
      }
    });
  }
}
