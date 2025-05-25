
import 'package:delivery_app/presentation/features/views/cart/views/cart_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShopImageItem extends StatelessWidget {
  const ShopImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s150.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsManager.shopTest),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10.w,
          vertical: AppPadding.p50.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalCircularButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            ),
            GlobalCircularButtonWidget(
              onTap: () {
                Navigator.pushNamed(context, CartView.id);
              },
              icon: Icons.shopping_cart_sharp,
              iconColor: ColorManager.white,
              circleColor: ColorManager.circleButtonColor,
            )
          ],
        ),
      ),
    );
  }
}