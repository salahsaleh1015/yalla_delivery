


import 'package:delivery_app/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addDeliveryDialog(BuildContext context) {
  showCustomDialog(context, content: const AddDeliveryDialogContent(),
      dialogTitle: "إضافة مندوب جديد",
      actionButtonHint: "إضافة",
      actionButtonCallBack: (){});
}




class AddDeliveryDialogContent extends StatelessWidget {
  const AddDeliveryDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("أسم مندوب التوصيل",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.text, hintText: "ادخل اسم مندوب التوصيل"),
        buildSpace(),
        Text("التليفون",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.phone, hintText: "ادخل رقم التلفيون"),
        buildSpace(),
        Text("العنوان",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.text, hintText: "ادخل عنوان المندوب"),
        buildSpace(),
        Text("التقييم",style: Theme.of(context).textTheme.bodyMedium,),
        buildSmallSpace(),
        const GlobalTextFieldWidget(textInputType: TextInputType.number, hintText: "ادخل تقييم المندوب"),
        buildSpace(),
      ],
    );
  }
 Widget buildSpace() {
    return  SizedBox(
      height: AppSize.s25.h,
    );
  }

  Widget buildSmallSpace() {
    return  SizedBox(
      height: AppSize.s5.h,
    );
  }
}
