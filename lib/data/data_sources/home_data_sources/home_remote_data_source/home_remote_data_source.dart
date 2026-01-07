import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/data/models/banner_model.dart';
import 'package:delivery_app/data/models/shop_model.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';

import '../../../../core/services/firebase_services/firestore_home_services.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/home_entities/home_banner_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeBannerEntity>> getHomeBanners();
  Future<List<HomeShopEntity>> getHomeShops();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  FirestoreHomeServices firestoreHomeServices;
  HomeRemoteDataSourceImpl(this.firestoreHomeServices);


  @override
  Future<List<HomeBannerEntity>> getHomeBanners() async {
    var data = await firestoreHomeServices.getAllBanners();
    List<HomeBannerEntity> banners = getBannersList(data);
    saveBannersData(banners: banners, boxName: kBannersBox);
    return banners;
  }

  List<HomeBannerEntity> getBannersList(List<QueryDocumentSnapshot> docs) {
    List<HomeBannerEntity> banners = [];

    for (var doc in docs) {
      banners.add(BannerModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return banners;
  }

  @override
  Future<List<HomeShopEntity>> getHomeShops() async{
    var data = await firestoreHomeServices.getAllShops();
    List<HomeShopEntity> shops = getShopsList(data);
    saveShopsData(shops: shops, boxName: kShopsBox);
    return shops;
  }


  List<HomeShopEntity> getShopsList(List<QueryDocumentSnapshot> docs) {
    List<HomeShopEntity> shops = [];

    for (var doc in docs) {
      shops.add(ShopModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return shops;
  }
}
