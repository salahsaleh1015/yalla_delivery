




import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void logoutDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "تسجيل الخروج",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "تسجيل الخروج",
      content:const LogoutDialogContent());
}


class LogoutDialogContent extends StatelessWidget {
  const LogoutDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s20.h,),
        Text("هل أنت متأكد أنك تريد تسجيل الخروج؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s20.h,),
      ],
    );
  }
}

