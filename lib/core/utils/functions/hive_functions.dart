



import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:hive/hive.dart';

void saveBannersData({required List<HomeBannerEntity> books, required String boxName}) {
  var box = Hive.box<HomeBannerEntity>(boxName);
  box.addAll(books);
}


Future<void> clearHiveBox<T>({required String boxName}) async {
  final box = Hive.box<T>(boxName);
  await box.clear();
}
