import 'package:delivery_app/delivery_features/delivery_add_order/views/delivery_order_summary_for_delivery.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global_widgets/global_text_field_widget.dart';

class DeliveryAddOrderView extends StatelessWidget {
  const DeliveryAddOrderView({super.key});

  static String id = "DeliveryAddOrderView";
  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "اضافة مهمة",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
          Text(
            "إضافة طلب جديد",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s15.h,
          ),
          Text(
            "إضافة طلب غير مُسجل في النظام (مثل استلام طلب خاص أو شخصي).",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorManager.darkGrayColor,
                ),
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
          Text("اسم العميل", style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalTextFieldWidget(
            hintText: "محمد احمد",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
          Text("الموقع", style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalTextFieldWidget(
            hintText: "6 أكتوبر الحصري جنب البنزينة",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
          Text(
            "تفاصيل الطلب",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalCustomOrderTextField(),
          SizedBox(
            height: AppSize.s25.h,
          ),
          GlobalButtonWidget(
            text: "إضافة",
            onTap: () {
              Navigator.pushNamed(context, DeliveryOrderSummaryForDelivery.id);
            },
            width: double.infinity,
          ),
          SizedBox(
            height: AppSize.s25.h,
          ),
        ],
      ),
    ));
  }
}
