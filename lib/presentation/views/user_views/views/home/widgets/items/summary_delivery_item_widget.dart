
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/font_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SummaryDeliveryItemWidget extends StatelessWidget {
  const SummaryDeliveryItemWidget({super.key, required this.deliveryName, required this.deliveryRate,});


  final String deliveryName;
  final int deliveryRate;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(AppPadding.p20.r),
      width: double.infinity,
     // height: AppSize.s100.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: ColorManager.socialButtonColor, width: AppSize.s1.w),
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اسم المندوب",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
               deliveryName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorManager.black),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalDividerWidget(),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "التقييم",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              RatingStars(
                value: deliveryRate.toDouble(),
                starCount: 5,
                starSize: AppSize.s20.r,
                starOffColor: ColorManager.inActiveRateColor,
                starColor: ColorManager.activeRateColor,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          const GlobalDividerWidget(),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "طريقة الدفع",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "نقدًا عند التسليم",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorManager.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
