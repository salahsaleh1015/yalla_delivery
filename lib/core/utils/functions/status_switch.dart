import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';


Color getStatusBadgeColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.lightGrayColor;
    case "المقبولة":
      return ColorManager.lightSecondary;
    case "الملغية":
      return ColorManager.lightPrimary;
    case "المكتملة":
      return ColorManager.lightGreenColor;
    default:
      return ColorManager.primary;
  }
}

Color getStatusTextColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.darkGrayColor;
    case "المقبولة":
      return ColorManager.primary;
    case "الملغية":
      return ColorManager.error;
    case "المكتملة":
      return ColorManager.greenColor;
    default:
      return ColorManager.white;
  }
}