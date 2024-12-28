import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalLightButtonWidget extends StatelessWidget {
  const GlobalLightButtonWidget({super.key, required this.onTap, required this.child});
  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: AppSize.s40.h,
          decoration: BoxDecoration(
            color: ColorManager.lightRedColor,
            borderRadius: BorderRadius.circular(AppSize.s100.r),
          ),
          child:
          Center(
            child:  child,
          )

      ),
    );
  }
}
