import 'package:delivery_app/translations/codegen_loader.g.dart';
import 'package:delivery_app/yalla_delivery_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//late String initialRoute;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     initialRoute = '/';
  //   } else {
  //     initialRoute = '/mainLayoutRoute';
  //   }
  // });

  runApp(EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: const Locale(
        'ar',
      ),
      fallbackLocale: const Locale(
        'ar',
      ),
      child: YallaDeliveryApp(),),);
}
