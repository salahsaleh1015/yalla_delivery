


import 'package:delivery_app/admin_features/admin_main_layout/views/admin_main_layout.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin_features/admin_authentication/views/admin_authentication.dart';
import 'delivery_features/delivery_authentecation/views/delivery_authentication_view.dart';
import 'resources/theme_manager.dart';

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
        initialRoute: DeliveryAuthenticationView.id,
      ),
    );
  }
}