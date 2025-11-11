
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_delete_order_button.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_order_status_card.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/widgets/delivery_order_summary_card.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/status_switch.dart';
import '../../../../../models/order_model.dart';


class DeliveryOrderSummaryView extends StatelessWidget {
  const DeliveryOrderSummaryView({
    super.key, required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
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
              statusColor:  getStatusBadgeColor(order.userOrderStatus),
              deliveryStatusColor:  getStatusTextColor(order.userOrderStatus),
              deliveryStatus: order.userOrderStatus,
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
             DeliveryOrderSummaryCard(
              order: order,
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            SizedBox(
              height: AppSize.s50.h,
            ),
            order.userOrderStatus == "المكتملة" ? const SizedBox() : DeliveryDeleteOrderButton(
               deliveryMail: order.deliveryMail,
              orderId: order.userOrderId!,
            ),
            SizedBox(
              height: AppSize.s50.h,
            ),
          ],
        ),
      )),
    );
  }
}
