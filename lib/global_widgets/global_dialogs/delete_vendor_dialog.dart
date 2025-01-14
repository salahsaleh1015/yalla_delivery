






import 'package:delivery_app/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void  deleteVendorDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: " حذف موزع الخدمة؟",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "حذف",actionButtonCallBack: (){},
      content:const DeleteVendorDialogContent());
}

class DeleteVendorDialogContent extends StatelessWidget {
  const DeleteVendorDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("سيتم حذف جميع البيانات المرتبطة بموزع الخدمة هذا. لا يمكن التراجع عن هذه العملية.",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}