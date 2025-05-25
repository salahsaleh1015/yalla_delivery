import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButtonWidget extends StatelessWidget {
  const GlobalButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    this.height,
    this.color,
    this.borderRadius,
    required this.isButtonEnabled,
  });
  final double width;
  final String text;
  final VoidCallback onTap;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isButtonEnabled
              ? color ?? ColorManager.primary
              : ColorManager.inActiveRateColor,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s100.r),
        ),
        height: height ?? AppSize.s40.h,
        width: width,
        child: Center(
          child: Text(
            text,
            style: isButtonEnabled
                ? Theme.of(context)
                    .textTheme
                    .titleSmall

                : Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.white),
          ),
        ),
      ),
    );
  }
}
