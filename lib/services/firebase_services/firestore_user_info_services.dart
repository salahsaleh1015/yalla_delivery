import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/features/models/user_model.dart';

class FirebaseUserServices {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Users");

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Users').doc();



  Future<void> addUserToFireStore(UserModel userModel) async {
    String userId = documentReference.id;
    userModel.userId = userId;
    return await _userCollectionRef.doc(userId).set(userModel.toJson());
  }




  Future<bool> checkUserExistsByPhone(String phoneNumber) async {
    final querySnapshot = await _userCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
