import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/shop_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_secondary_decorated_container.dart';

class GlobalVendorItemWidget extends StatelessWidget {
  const GlobalVendorItemWidget({super.key,  this.width, this.height, required this.onTap, required this.shop, });
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            topRight: Radius.circular(AppSize.s12.r),
          ),
          child: Image.network(
              fit: BoxFit.fill,
              width:width?? AppSize.s250.w,
              height:height?? AppSize.s160.h,
              shop.shopImage),
        ),
        GlobalSecondaryDecoratedContainer(
          width:width?? AppSize.s250.w,
          height: height?? AppSize.s160.h,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        shop.shopName,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        "${shop.shopRate}.0/5.0",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Icon(
                        Icons.star,
                        color: ColorManager.activeRateColor,
                        size: AppSize.s25.r,
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: AppSize.s25.r,
                      ),
                      SizedBox(
                        width: AppSize.s5.w,
                      ),
                      Text(
                        shop.shopAddress,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  GlobalButtonWidget(
                    isButtonEnabled: true,
                    width: double.infinity,
                    onTap: onTap,
                    text: "تفاصيل",
                  )
                ],
              ),
            )
        ),

      ],
    );
  }
}
