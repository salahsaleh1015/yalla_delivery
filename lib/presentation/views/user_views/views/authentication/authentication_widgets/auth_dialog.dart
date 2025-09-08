


import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
      ),
    ),
  );
  showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog);
}