



import 'package:delivery_app/presentation/global_widgets/global_dialogs/global_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';


void deleteOrderFromDeliveryDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "مسح الطلب",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "مسح",actionButtonCallBack: (){},
      content:const DeleteOrderFromDeliveryDialogContent());
}

class DeleteOrderFromDeliveryDialogContent extends StatelessWidget {
  const DeleteOrderFromDeliveryDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("هل تريد حذف هذا الطلب نهائيًا؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}

