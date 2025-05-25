

import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrBreakWidget extends StatelessWidget {
  const OrBreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyDivider(),
         SizedBox(
          width: AppSize.s10.w,
        ),
        Text("او", style: Theme.of(context).textTheme.labelSmall),
         SizedBox(
          width: AppSize.s10.w,
        ),
        const MyDivider(),
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: AppSize.s1.h,
      width:AppSize.s135.w,
      color: ColorManager.socialButtonColor,
    );
  }
}
