


import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalDeliveryCardWidget extends StatelessWidget {
  const GlobalDeliveryCardWidget({super.key, required this.itemId, required this.isSelected, required this.onTap, required this.arrowOnTap});
  final String itemId;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback arrowOnTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppPadding.p4.h),
        width: double.infinity,
        height: AppSize.s80.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ?ColorManager.primary: ColorManager.socialButtonColor, width: AppSize.s1.w),
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
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
                  Text("محمد سعيد",style: Theme.of(context).textTheme.headlineMedium),
                  RatingStars(
                    value: 5,
                    starCount: 5,
                    starSize:AppSize.s20.r,
                    starOffColor:ColorManager.inActiveRateColor,
                    starColor: ColorManager.activeRateColor,
                  ),
                  Text("متاح",style: Theme.of(context).textTheme.labelSmall,),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: arrowOnTap, icon: Icon(Icons.arrow_forward,color: ColorManager.primary,size: AppSize.s25.r,),)
            ],
          ),
        ),
      ),
    );
  }
}
