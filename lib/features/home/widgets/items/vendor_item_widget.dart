
import 'package:delivery_app/features/home/view/shop_details_view.dart';
import 'package:delivery_app/global_widgets/global_secondary_button.dart';
import 'package:delivery_app/global_widgets/global_secondary_decorated_container.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorItemWidget extends StatelessWidget {
  const VendorItemWidget({super.key,  this.width, this.height, });
  final double? height;
  final double? width;
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
          child: Image.asset(
              fit: BoxFit.fill,
              width:width?? AppSize.s250.w,
              height:height?? AppSize.s140.h,
              AssetsManager.shopTest),
        ),
        GlobalSecondaryDecoratedContainer(
          width:width?? AppSize.s250.w,
          height: height?? AppSize.s140.h,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ابن البلد",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        "4.0/5.0",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Icon(
                        Icons.star,
                        color: ColorManager.activeRateColor,
                        size: 20,
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
                        "مدينة 6 أكتوبر، محافظة الجيزة",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  GlobalSecondaryButton(
                    width: double.infinity,
                    onTap: (){
                      Navigator.pushNamed(context, ShopDetailsView.id);
                    },
                    text: "اطلب",
                  )
                ],
              ),
            )
        ),

      ],
    );
  }
}
