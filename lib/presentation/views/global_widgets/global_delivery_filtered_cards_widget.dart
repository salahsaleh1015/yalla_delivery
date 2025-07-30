import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/delivery_cards_filtered_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class GlobalDeliveryFilteredCardsWidget extends StatelessWidget {
  const GlobalDeliveryFilteredCardsWidget({
    super.key,
    required this.deliveryFilteredCardsModel,
  });

  final DeliveryFilteredCardsModel deliveryFilteredCardsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: deliveryFilteredCardsModel.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppPadding.p4.h),
        width: double.infinity,
        height: AppSize.s80.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: deliveryFilteredCardsModel.isSelected
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
                  Text(deliveryFilteredCardsModel.deliveryModel.deliveryName,
                      style: Theme.of(context).textTheme.headlineMedium),
                  RatingStars(
                    value: deliveryFilteredCardsModel.deliveryModel.deliveryRate
                        .toDouble(),
                    starCount: 5,
                    starSize: AppSize.s20.r,
                    starOffColor: ColorManager.inActiveRateColor,
                    starColor: ColorManager.activeRateColor,
                  ),
                  Text(
                    deliveryFilteredCardsModel.deliveryModel.deliveryStatus,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed:deliveryFilteredCardsModel.arrowOnTap,
                icon: Icon(
                  Icons.arrow_forward,
                  color: deliveryFilteredCardsModel.isSelected ? ColorManager.primary: ColorManager.socialButtonColor,
                  size: AppSize.s25.r,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


