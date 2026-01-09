
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:delivery_app/core/utils/constants.dart';

import '../../firebase_options.dart';

import '../resources/routes_manager.dart';
import '../services/shared_preferences_services/shared_preferences_services.dart';


class AppInitializer {
  static Future<void> initCore() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }


  static Future<void> initHive() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(CachedUserModelAdapter());
    Hive.registerAdapter(HomeBannerEntityAdapter());
    Hive.registerAdapter(HomeShopEntityAdapter());
    Hive.registerAdapter(HomeShopProductEntityAdapter());


    // Open boxes
    await Hive.openBox<CachedUserModel>('cachedUserBox');
    await Hive.openBox<HomeBannerEntity>(kBannersBox);
    await Hive.openBox<HomeShopEntity>(kShopsBox);
    await Hive.openBox<HomeShopProductEntity>(kProductsBox);

    // Clear boxes
    await clearHiveBox<HomeBannerEntity>(boxName: kBannersBox);
    await clearHiveBox<HomeShopEntity>(boxName: kShopsBox);
    await clearHiveBox<HomeShopProductEntity>(boxName: kProductsBox);

  }

  static Future<void> initCache() async {
    await CacheHelper.init();
  }

  static String getStartRoute() {
    final authorized = CacheHelper.getBool(key: "authorized") ?? false;
    if (!authorized) {
      return Routes.onBoardingRoute;
    } else {
      return Routes.mainLayoutRoute;
    }
  }
}
