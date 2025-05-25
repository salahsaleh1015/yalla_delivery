


import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMainBar extends StatelessWidget {
  const AdminMainBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "الرئيسية",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Image.asset(
          AssetsManager.adminAvatar,
          width: AppSize.s55.w,
          height: AppSize.s50.h,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
