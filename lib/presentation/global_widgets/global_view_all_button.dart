

import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';



class GlobalViewAllButton extends StatelessWidget {
  const GlobalViewAllButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed, child: Row(
      children: [
        Text("عرض الكل",style: Theme.of(context).textTheme.bodySmall,),
        SizedBox(width: AppSize.s5.w,),
        Icon(Icons.arrow_forward,color: ColorManager.primary,size: AppSize.s20.r,),
      ],
    ));
  }
}
