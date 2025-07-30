import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalCustomOrderTextField extends StatelessWidget {
  const GlobalCustomOrderTextField({super.key, required this.orderController, this.onSaved, this.validator});

  final TextEditingController orderController;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
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
          controller: orderController,
          onSaved: onSaved,
          validator: validator,

        ),
      ),
    );
  }
}
