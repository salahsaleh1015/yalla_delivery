
import 'package:delivery_app/presentation/features/views/delivery/views/order_summary_from_delivery_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/presentation/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrderFromDeliveryView extends StatelessWidget {
  const AddOrderFromDeliveryView({super.key});
  static String id = "AddOrderFromDeliveryView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalAppBar(

            title: "اضافة طلب",
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          Text(
            "أضف طلبك",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const GlobalCustomOrderTextField(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          GlobalButtonWidget(
            isButtonEnabled: true,
            text: "استمر",
            onTap: (){
              Navigator.pushNamed(context, OrderSummaryFromDeliveryView.id);
            },
            width: double.infinity,
          ),
        ],
      )),
    );
  }
}
