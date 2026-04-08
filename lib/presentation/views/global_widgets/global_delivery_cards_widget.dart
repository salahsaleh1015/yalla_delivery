import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/delivery_card_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_custom_animation_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';

class GlobalDeliveryCardsWidget extends StatelessWidget {
  const GlobalDeliveryCardsWidget({super.key, required this.deliveryCardModel, required this.index});

  final DeliveryCardModel deliveryCardModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GlobalCustomAnimationWidget(
      index: index,
      child: GestureDetector(
        onTap: deliveryCardModel.deliveryStatus == 'متاح'
            ? deliveryCardModel.onTap
            : () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: AppPadding.p4.h),
          width: double.infinity,
          height: AppSize.s80.h,
          decoration: BoxDecoration(
            border: Border.all(
                color: deliveryCardModel.deliveryStatus == 'متاح'
                    ? ColorManager.primary
                    : ColorManager.socialButtonColor,
                width: AppSize.s1.w),
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p10.w,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s30.r,
                  backgroundImage: const AssetImage(
                    AssetsManager.deliveryAvatar,
                  ),
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deliveryCardModel.deliveryModel.deliveryName!,
                        style: Theme.of(context).textTheme.headlineMedium),
                    RatingStars(
                      value:
                          deliveryCardModel.deliveryModel.deliveryRate!.toDouble(),
                      starCount: 5,
                      starSize: AppSize.s20.r,
                      starOffColor: ColorManager.inActiveRateColor,
                      starColor: ColorManager.activeRateColor,
                    ),
                    Text(
                      deliveryCardModel.deliveryModel.deliveryStatus!,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: deliveryCardModel.deliveryStatus == 'متاح'
                      ? deliveryCardModel.arrowOnTap
                      : () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color:  deliveryCardModel.deliveryStatus == 'متاح'
                        ?ColorManager.primary:ColorManager.inActiveRateColor,
                    size: AppSize.s25.r,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
