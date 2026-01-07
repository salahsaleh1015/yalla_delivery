import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/data/models/banner_model.dart';

import '../../../../core/services/firebase_services/firestore_home_services.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/home_entities/home_banner_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeBannerEntity>> getHomeBanners();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  FirestoreHomeServices firestoreHomeServices;
  HomeRemoteDataSourceImpl(this.firestoreHomeServices);


  @override
  Future<List<HomeBannerEntity>> getHomeBanners() async {
    var data = await firestoreHomeServices.getAllBanners();
    List<HomeBannerEntity> banners = getBannersList(data);
    saveBannersData(books: banners, boxName: kBannersBox);
    return banners;
  }

  List<HomeBannerEntity> getBannersList(List<QueryDocumentSnapshot> docs) {
    List<HomeBannerEntity> orders = [];

    for (var doc in docs) {
      orders.add(BannerModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return orders;
  }
}
