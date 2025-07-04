
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deleteAllOrdersDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "مسح الكل",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "مسح الكل",actionButtonCallBack: (){},
      content:const DeleteAllOrdersDialogContent());
}

class DeleteAllOrdersDialogContent extends StatelessWidget {
  const DeleteAllOrdersDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s20.h,),
        Text("هل أنت متأكد أنك تريد مسح كل الطلبات من السلة؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s20.h,),
      ],
    );
  }
}
