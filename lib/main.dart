
import 'package:delivery_app/translations/codegen_loader.g.dart';
import 'package:delivery_app/yalla_delivery_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//كتنساش تغير اسم التطبيق و ال package name

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale:const Locale(
        'ar',
      ) ,
      fallbackLocale: const Locale(
        'ar',
      ),
      child: const YallaDeliveryApp()));
}


