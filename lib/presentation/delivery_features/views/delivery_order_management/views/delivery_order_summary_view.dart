
import 'package:delivery_app/presentation/delivery_features/views/delivery_order_management/models/delivery_status_model.dart';
import 'package:delivery_app/presentation/delivery_features/views/delivery_order_management/widgets/delivery_delete_order_button.dart';
import 'package:delivery_app/presentation/delivery_features/views/delivery_order_management/widgets/delivery_order_status_card.dart';
import 'package:delivery_app/presentation/delivery_features/views/delivery_order_management/widgets/delivery_order_summary_card.dart';
import 'package:delivery_app/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryOrderSummaryView extends StatelessWidget {
  const DeliveryOrderSummaryView({
    super.key,
  });
  static String id = "DeliveryOrderSummaryView";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DeliveryStatusModel;
    return Scaffold(
      body: GlobalPaddingWidget(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
            SizedBox(
              height: AppSize.s25.h,
            ),
            DeliveryOrderStatusCard(
              statusColor: args.statusColor,
              deliveryStatusColor: args.deliveryStatusColor,
              deliveryStatus: args.deliveryStatus,
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            Text(
              "تفاصيل الطلب",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s15.h,
            ),
            const DeliveryOrderSummaryCard(),
            SizedBox(
              height: AppSize.s10.h,
            ),
            SizedBox(
              height: AppSize.s50.h,
            ),
            const DeliveryDeleteOrderButton(),
            SizedBox(
              height: AppSize.s50.h,
            ),
          ],
        ),
      )),
    );
  }
}
