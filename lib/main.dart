import 'package:delivery_app/injection.dart';
import 'package:delivery_app/presentation/models/cached_user_model.dart';
import 'package:delivery_app/translations/codegen_loader.g.dart';
import 'package:delivery_app/yalla_delivery_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';


import 'core/resources/routes_manager.dart';
import 'core/services/shared_preferences_services/shared_preferences_services.dart';
import 'firebase_options.dart';

//late String initialRoute;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ////////////////////////////////////////////////////////////////////
  await Hive.initFlutter();
  // Register the User adapter
  Hive.registerAdapter(CachedUserModelAdapter());
  final cachedUserBox = await Hive.openBox<CachedUserModel>('cachedUserBox');
  await init(cachedUserBox); // use manual init
  ////////////////////////////////////////////////////////////////////
  // init shared preferences
  await CacheHelper.init();
  String startRoute;
  bool authorized = CacheHelper.getBool(key: "authorized") ?? false;

  if (!authorized) {
    startRoute = Routes.onBoardingRoute;
  } else {
    startRoute = Routes.mainLayoutRoute;
  }

  ///////////////////////////////////////////////////////////////////
  await EasyLocalization.ensureInitialized();
  //////////////////////////////////////////////////////////////////
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: const Locale(
        'ar',
      ),
      fallbackLocale: const Locale(
        'ar',
      ),
      child: YallaDeliveryApp(
        //startRoute: startRoute,
        startRoute: Routes.deliveryAuthenticationRoute,
      ),
    ),
  );
}
