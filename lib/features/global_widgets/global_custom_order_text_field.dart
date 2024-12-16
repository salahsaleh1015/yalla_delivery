import 'package:delivery_app/features/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalCustomOrderTextField extends StatelessWidget {
  const GlobalCustomOrderTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppSize.s200.h,
      decoration: BoxDecoration(
        color: ColorManager.inputFillColor,
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s8.r),
        child: GlobalTextFieldWidget(
          height: AppSize.s200.h,
          hintText: "اكتب تفاصيل طلبك هنا...",
          textInputType: TextInputType.multiline,
        ),
      ),
    );
  }
}
