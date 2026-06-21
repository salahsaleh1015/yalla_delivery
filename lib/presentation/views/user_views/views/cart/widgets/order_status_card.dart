
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key, required this.statusColor, required this.deliveryStatus, required this.deliveryStatusColor});
  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(AppPadding.p16.r),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: Row(
        children: [
          Text(
            "حالة الطلب",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: ColorManager.black),
          ),
          const Spacer(),
          Text(
            deliveryStatus,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: deliveryStatusColor),
          ),
        ],
      ),
    );
  }
}
