
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/utils/functions/service_locator_setup.dart';
import 'package:delivery_app/data/models/cached_user_model.dart';
import 'package:delivery_app/translations/codegen_loader.g.dart';
import 'package:delivery_app/yalla_delivery_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'core/init/app_initializer.dart';
import 'injection.dart';



//late String initialRoute;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();




  // Step 1: Initialize core dependencies
  await AppInitializer.initCore();

  // Step 2: Initialize local storage
  await AppInitializer.initHive();

  // Step 3: Initialize dependency injection
  serviceLocatorSetup();

  // Step 4: Initialize shared preferences
  await AppInitializer.initCache();

  // Step 5: Initialize localization
  await EasyLocalization.ensureInitialized();
  // Step 6: Determine the start route
  final startRoute = AppInitializer.getStartRoute();


  final cachedUserBox = await Hive.openBox<CachedUserModel>('cachedUserBox');
  await init(cachedUserBox);

  // Step 7: Run the app
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      child: YallaDeliveryApp(
    //startRoute: Routes.onBoardingRoute,
       startRoute: startRoute,
      ),
    ),
  );
}


