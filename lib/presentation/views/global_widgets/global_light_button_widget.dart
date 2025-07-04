import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalLightButtonWidget extends StatelessWidget {
  const GlobalLightButtonWidget({super.key, required this.onTap, required this.child, this.height, this.width});
  final VoidCallback onTap;
  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: onTap,
      child: Container(
          width: width?? double.infinity,
          height:height?? AppSize.s40.h,
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
