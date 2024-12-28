



import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAddAdsPartnerBodyWidget extends StatelessWidget {
  const AdminAddAdsPartnerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "أسم المعلن",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل اسم المعلن"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "التليفون",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.text,
            hintText: "ادخل رقم التلفيون"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "العنوان",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        const GlobalTextFieldWidget(
            textInputType: TextInputType.phone,
            hintText: "ادخل العنوان"),
        SizedBox(
          height: AppSize.s20.h,
        ),
        GlobalButtonWidget(
          text: "إضافة",
          onTap: () {},
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}