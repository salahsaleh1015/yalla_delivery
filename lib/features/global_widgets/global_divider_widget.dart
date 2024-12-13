

import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalDividerWidget extends StatelessWidget {
  const GlobalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorManager.socialButtonColor,
      height: AppSize.s1.h,
    );
  }
}
