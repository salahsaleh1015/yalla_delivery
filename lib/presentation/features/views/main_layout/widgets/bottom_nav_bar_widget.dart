import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({super.key, required this.icon});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppSize.s10.h,
      ),
      child: Icon(
        icon,
        size: AppSize.s25.r,
      ),
    );
  }
}


