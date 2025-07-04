
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DeliveryOrderSummaryForDelivery extends StatelessWidget {
  const DeliveryOrderSummaryForDelivery({super.key});

  static String id = "DeliveryOrderSummaryForDelivery";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GlobalPaddingWidget(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalCircularButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: Icons.arrow_back,
              ),
              Text(
                "ملخص الطلب",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: AppSize.s30.h,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
