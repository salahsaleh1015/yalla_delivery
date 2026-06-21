import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_secondary_button.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/delivery_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../data/models/cart_order_card_model.dart';

class CartOrderCard extends StatelessWidget {
  final CartOrderCardModel cartOrderCardModel;

  const CartOrderCard({super.key, required this.cartOrderCardModel});

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
          Row(
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
                  statusColor: cartOrderCardModel.statusColor,
                  deliveryStatus: cartOrderCardModel.deliveryStatus,
                  deliveryStatusColor: cartOrderCardModel.deliveryStatusColor),
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
          Padding(
            padding: EdgeInsets.all(AppSize.s2.r),
            child: GlobalButtonWidget(
              isButtonEnabled: true,
              height: AppSize.s33.h,
              color: ColorManager.primary,
              onTap: cartOrderCardModel.onActionButtonTap,
              width: MediaQuery.of(context).size.width * 0.9,
              text: cartOrderCardModel.actionButtonTitle ?? "ملخص الطلب",
            ),
          ),
        ],
      ),
    );
  }
}

