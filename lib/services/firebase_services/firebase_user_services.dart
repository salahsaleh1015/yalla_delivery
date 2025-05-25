


import 'package:cloud_firestore/cloud_firestore.dart';

import '../../presentation/features/models/user_model.dart';



class FirebaseUserServices{

  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("Users");

  final DocumentReference documentReference =
  FirebaseFirestore.instance.collection('Users').doc();



  Future<void> addUserToFireStore(UserModel userModel)async {
    String userId = documentReference.id;
    return  await _userCollectionRef.doc(userId).set(userModel.toJson());
  }



}