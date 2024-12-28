import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalDecoratedBottomContainer extends StatelessWidget {
  const GlobalDecoratedBottomContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30.r),
            topRight: Radius.circular(AppSize.s30.r),
          ),
          border: Border(
            top: BorderSide(
              color: ColorManager.primary, // Change this to your desired color
              width:AppSize.s2.w, // Change this to your desired width
            ),
          )),
      height: AppSize.s70.h,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30.r),
            topRight: Radius.circular(AppSize.s30.r),
          ),
          child:child
      ),
    );
  }
}