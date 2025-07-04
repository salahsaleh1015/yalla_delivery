

import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deleteOrderDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "إالغاء الطلب",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "إلغاء الطلب",actionButtonCallBack: (){},
      content:const DeleteOrderDialogContent());
}

class DeleteOrderDialogContent extends StatelessWidget {
  const DeleteOrderDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("هل أنت متأكد أنك تريد إلغاء الطلب؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}







