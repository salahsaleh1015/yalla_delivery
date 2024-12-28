

import 'package:delivery_app/global_widgets/global_divider_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SummaryDeliveryItemWidget extends StatelessWidget {
  const SummaryDeliveryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(AppPadding.p20.r),
      width: double.infinity,
      height: AppSize.s100.h,
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
                "محمد سعيد",
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
              const RatingStars()
            ],
          ),
        ],
      ),
    );
  }
}
