

import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin_features/admin_delivery_management/widgets/delivery_status_badge.dart';
import '../../../global_widgets/global_button_widget.dart';
import '../../../global_widgets/global_decorated_container.dart';
import '../../../global_widgets/global_secondary_button.dart';
import '../../../global_widgets/global_tab_bar.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';
import '../widgets/delivery_order_management_tab_bar.dart';


class DeliveryManagementOrderCard extends StatelessWidget {

  final Color statusColor;
  final String deliveryStatus;
  final Color deliveryStatusColor;
  final String? actionButtonTitle;
  final String? backButtonTitle;
  final VoidCallback onActionButtonTap;

  const DeliveryManagementOrderCard({super.key, required this.statusColor, required this.deliveryStatus, required this.deliveryStatusColor, this.actionButtonTitle, this.backButtonTitle, required this.onActionButtonTap});


  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(

      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p16.w,
        vertical: AppPadding.p24.h,
      ),
      child: Column(
        spacing: AppSize.s12.h,
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "رقم الطلب: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "50#",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              DeliveryStatusBadge(
                  statusColor: statusColor,
                  deliveryStatus: deliveryStatus,
                  deliveryStatusColor: deliveryStatusColor),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "المستخدم: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "محمد علي",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الموزع: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "ابن البلد",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "العنوان: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "مدينة 6 أكتوبر, محافظة الجيزة",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الوقت: ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGrayColor),
              ),
              Text(
                "03:00 م",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalSecondaryButton(
                  height: AppSize.s40.h,
                  text:  backButtonTitle ?? "إلغاء الطلب",
                  width: MediaQuery.of(context).size.width * 0.4,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(AppSize.s2.r),
                child: GlobalButtonWidget(
                  height: AppSize.s40.h,
                  color:  ColorManager.primary,
                  onTap: onActionButtonTap,
                  width: MediaQuery.of(context).size.width * 0.4,
                  text: actionButtonTitle ?? "ملخص الطلب",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

