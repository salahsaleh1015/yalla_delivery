import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_add_order/views/delivery_order_summary_for_delivery.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryAddOrderView extends StatefulWidget {
  const DeliveryAddOrderView({super.key});

  @override
  State<DeliveryAddOrderView> createState() => _DeliveryAddOrderViewState();
}

class _DeliveryAddOrderViewState extends State<DeliveryAddOrderView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController customerNameController = TextEditingController();

  final TextEditingController customerLocationController =
      TextEditingController();

  final TextEditingController customerOrderController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled = customerNameController.text.isNotEmpty &&
        customerLocationController.text.isNotEmpty &&
        customerOrderController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();

    customerNameController.addListener(_checkIfFieldAreFilled);
    customerLocationController.addListener(_checkIfFieldAreFilled);
    customerOrderController.addListener(_checkIfFieldAreFilled);
  }



  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
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
             GlobalTextFieldWidget(
              controller: customerNameController,
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
             GlobalTextFieldWidget(
              controller: customerLocationController,
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
            GlobalCustomOrderTextField(
              orderController: customerOrderController,
              onSaved: (value) {},
              validator: (value) {
                if (value!.length < 10) {
                  return " يرجى ادخال الطلب كامل";
                }
                return null;
              },
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            GlobalButtonWidget(
              isButtonEnabled: true,
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
      ),
    ));
  }
  @override
  void dispose() {
    customerNameController.dispose();
    customerLocationController.dispose();
    customerOrderController.dispose();
    super.dispose();
  }
}
