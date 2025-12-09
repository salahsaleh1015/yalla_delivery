
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:delivery_app/core/utils/constants.dart';

import '../../firebase_options.dart';
import '../../presentation/models/cached_user_model.dart';
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


    // Open boxes
    await Hive.openBox<CachedUserModel>('cachedUserBox');

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
