import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/presentation/models/banner_model.dart';

class FirestoreHomeServices {
  final CollectionReference _bannersCollectionRef =
      FirebaseFirestore.instance.collection("Banners");

  Future<void> addBannerToFireStore(BannerModel banner) async {
    String bannerId = _bannersCollectionRef.doc().id;
    return await _bannersCollectionRef.doc(bannerId).set(banner);
  }

  Future<List<QueryDocumentSnapshot>> getAllBanners() async {
    var value = await _bannersCollectionRef.get();
    return value.docs;
  }
}
