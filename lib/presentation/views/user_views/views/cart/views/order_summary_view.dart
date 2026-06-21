import 'package:delivery_app/core/utils/app_extensions.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_status_card.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_padding_widget.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({super.key, required this.order});
  final OrderEntity order;

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
                  SizedBox(width: AppSize.s30.h),
                ],
              ),
              SizedBox(height: AppSize.s25.h),
              OrderStatusCard(
                statusColor: getStatusBadgeColor(order.orderStatus),
                deliveryStatusColor: getStatusTextColor(order.orderStatus),
                deliveryStatus: order.orderStatus,
              ),
              SizedBox(height: AppSize.s25.h),
              Text(
                "تفاصيل الطلب",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSize.s15.h),
              OrderSummaryCard(order: order),
              SizedBox(height: AppSize.s10.h),
              SizedBox(height: AppSize.s50.h),
              // order.orderStatus == "مكتملة"
              //     ? const SizedBox()
              //     : DeliveryDeleteOrderButton(
              //   deliveryOrderStatusModel: DeliveryOrderStatusModel(
              //     newStatus: order.orderStatus,
              //     orderId: order.orderId,
              //   ),
              // ),
              SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
