import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class YallaDeliveryApp extends StatelessWidget {
  YallaDeliveryApp({
    super.key,
  });

  final routeGenerator = RouteGenerator();
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

        onGenerateRoute: routeGenerator.getRoute,
        //initialRoute: Routes.onBoardingRoute,
        initialRoute: Routes.mainLayoutRoute,
      ),
    );
  }
}
