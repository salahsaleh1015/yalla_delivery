import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/utils/app_extensions.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/delete_order_button.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_status_card.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_padding_widget.dart';

class CartOrderSummaryView extends StatelessWidget {
  const CartOrderSummaryView({super.key, required this.order});
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
              DeleteOrderButton(
                orderId: order.orderId,
              ),
              SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
