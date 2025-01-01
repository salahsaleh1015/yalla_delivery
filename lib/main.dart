
import 'package:delivery_app/admin_features/admin_main_layout/views/admin_main_layout.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_app/resources/theme_manager.dart';
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

class YallaDeliveryApp extends StatelessWidget {
  const YallaDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: getApplicationTheme(context),
        debugShowCheckedModeBanner: false,
        title: 'Yalla Delivery app',
        routes: routes,
        initialRoute: AdminMainLayout.id,
      ),
    );
  }
}
