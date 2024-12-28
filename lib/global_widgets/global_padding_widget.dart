import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GlobalPaddingWidget extends StatelessWidget {
  const GlobalPaddingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.only(
      top: AppPadding.p40.h,
      left: AppPadding.p10.w,
      right: AppPadding.p10.w,
    ),
      child: child,
    );
  }
}
