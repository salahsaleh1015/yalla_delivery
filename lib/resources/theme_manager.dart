import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/responsive_font_size_manager.dart';
import 'package:delivery_app/resources/style_manager.dart';

import 'package:flutter/material.dart';


  //+4 fontSize for responsive


ThemeData getApplicationTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      textTheme: TextTheme(
        displaySmall: getMediumTextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s26),
            color: ColorManager.secondaryTextColor),
        titleLarge: getBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36)),
        bodyLarge: getBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36)),
        labelSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        titleSmall: getSemiBoldTextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
            color: ColorManager.white),
        bodySmall: getSemiBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        displayMedium: getBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s28)),
        headlineMedium: getRegularTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        bodyMedium: getMediumTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        headlineSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s24)),
        labelMedium: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16)),
        headlineLarge: getBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s24)),
        titleMedium: getSemiBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s24)),
        labelLarge: getMediumTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
          selectedLabelStyle: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
          backgroundColor: ColorManager.white,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.hintColor));
}
