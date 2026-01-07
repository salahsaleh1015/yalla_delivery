


import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/constants.dart';

abstract class HomeLocalDataSource {
  List<HomeBannerEntity> getHomeBanners();

}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<HomeBannerEntity> getHomeBanners() {
    var box = Hive.box<HomeBannerEntity>(kBannersBox);
    return box.values.toList();
  }
}