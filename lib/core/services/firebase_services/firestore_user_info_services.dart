import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/data/models/user_model.dart';



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

  Future<bool> checkUserExistsGMail(String gMail) async {
    final querySnapshot = await _userCollectionRef
        .where('userMail', isEqualTo: gMail)
        .limit(1)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<UserModel> getUserByPhoneNumber(String phoneNumber) async {
    final querySnapshot = await _userCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();

    final data = querySnapshot.docs.first.data() as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  Future<void> updateUserInfo(CachedUserModel cachedUserModel) async {

    // Step 1: Search for user by phone number
    final querySnapshot = await _userCollectionRef
        .where('userMail', isEqualTo: cachedUserModel.userMail)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception("User with phone number ${cachedUserModel.userMail} not found.");
    }

    // Step 2: Get the document ID
    final docId = querySnapshot.docs.first.id;

    // Step 3: Update the document
    await _userCollectionRef.doc(docId).update(cachedUserModel.toJson());
  }


 Future<String> getUserLocationByPhoneNumber({required String phoneNumber})async{
    final querySnapshot = await _userCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();
    final data = querySnapshot.docs.first.data() as Map<String, dynamic>;
    return data['userLocation'];
  }


  updateUserLocationByPhoneNumber({required String phoneNumber,required String userLocation})async{
    final querySnapshot = await _userCollectionRef
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();
    final docId = querySnapshot.docs.first.id;
    await _userCollectionRef.doc(docId).update({'userLocation':userLocation});
  }
}
