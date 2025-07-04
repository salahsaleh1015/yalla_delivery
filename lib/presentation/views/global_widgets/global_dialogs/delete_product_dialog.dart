
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deleteProductDialog(BuildContext context) {

  showCustomDialog(context,dialogTitle: "حذف المنتج",

      actionButtonColor: ColorManager.error,
      actionButtonHint: "حذف",actionButtonCallBack: (){},
      content:const DeleteProductDialogContent());
}

class DeleteProductDialogContent extends StatelessWidget {
  const DeleteProductDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10.h,),
        Text("هل أنت متأكد من أنك تريد حذف المنتج [اسم المنتج]؟ هذا الإجراء لا يمكن التراجع عنه.",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.hintColor,

        ),),
        SizedBox(height: AppSize.s10.h,),
      ],
    );
  }
}
