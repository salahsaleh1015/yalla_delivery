import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/responsive_and_adaptive_manager.dart';
import 'package:delivery_app/resources/style_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      textTheme: TextTheme(
        displaySmall: getMediumTextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
            color: ColorManager.secondaryTextColor),
        titleLarge: getBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s32)),
        bodyLarge: getBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s32)),
        labelSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16)),
        titleSmall: getSemiBoldTextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16),
            color: ColorManager.white),
        bodySmall: getSemiBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16)),
        displayMedium: getBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s24)),
        headlineMedium: getRegularTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16)),
        bodyMedium: getMediumTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16)),
        headlineSmall: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
        labelMedium: getRegularTextStyle(
            color: ColorManager.secondaryTextColor,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s12)),
        headlineLarge: getBoldTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        titleMedium: getSemiBoldTextStyle(
            color: ColorManager.black,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20)),
        labelLarge: getMediumTextStyle(
            color: ColorManager.primary,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
          selectedLabelStyle: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14)),
          backgroundColor: ColorManager.white,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.hintColor));
}
