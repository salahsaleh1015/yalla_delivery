



import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:hive/hive.dart';

void saveBannersData({required List<HomeBannerEntity> banners, required String boxName}) {
  var box = Hive.box<HomeBannerEntity>(boxName);
  box.addAll(banners);
}


void saveShopsData({required List<HomeShopEntity> shops, required String boxName}) {
  var box = Hive.box<HomeShopEntity>(boxName);
  box.addAll(shops);
}

Future<void> clearHiveBox<T>({required String boxName}) async {
  final box = Hive.box<T>(boxName);
  await box.clear();
}
