import 'package:delivery_app/main.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.color});
    final Color color;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:AppSize.s10.h,
      width:AppSize.s10.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
