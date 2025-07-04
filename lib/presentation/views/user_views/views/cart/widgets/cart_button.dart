import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p8.r),
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          width: double.infinity,
          height: AppSize.s40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s100.r),
            color: ColorManager.primary,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildAmountCircle(context),
                Text(
                  "استمر",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: ColorManager.white),
                ),
                Text(
                  "201 ج.م",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: ColorManager.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAmountCircle(context) {
    return Container(
      height: AppSize.s30.h,
      width: AppSize.s30.w,
      decoration: BoxDecoration(
          color: ColorManager.darkPrimary, shape: BoxShape.circle),
      child: Center(
        child: Text(
          "2",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorManager.white),
        ),
      ),
    );
  }
}
