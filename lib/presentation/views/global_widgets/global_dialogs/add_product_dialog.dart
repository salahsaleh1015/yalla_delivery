
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/add_image_section.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addProductDialog(BuildContext context) {
  showCustomDialog(context,
      content: const AddProductDialogContent(),
      dialogTitle: "إضافة منتج",
      actionButtonHint: "إضافة",
      actionButtonCallBack: () {});
}


class AddProductDialogContent extends StatelessWidget {
  const AddProductDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s5.h,
            ),
            const AddImageSection(),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Text(
              "أسم المنتج",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalTextFieldWidget(
                textInputType: TextInputType.text,
                hintText: "ادخل اسم المنتج"),

            SizedBox(
              height: AppSize.s20.h,
            ),
            Text(
              "وصف المنتج",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
             GlobalTextFieldWidget(
              height: AppSize.s100.h,
                textInputType: TextInputType.multiline,
                hintText: "ادخل وصف المنتج"),


            SizedBox(
              height: AppSize.s20.h,
            ),
            Text(
              "السعر",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalTextFieldWidget(
                textInputType: TextInputType.number,
                hintText: "ادخل سعر المنتج"),

            SizedBox(
              height: AppSize.s20.h,
            ),


          ],
        ),
      ),
    );
  }
}
