

import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_secondary_decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalAdvertisementItemWidget extends StatelessWidget {
  const GlobalAdvertisementItemWidget({super.key, this.height, this.width});
final double? height , width;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12.r),
            topRight: Radius.circular(AppSize.s12.r),
          ),
          child: Image.asset(
              fit: BoxFit.fill,
              width:width?? AppSize.s150.w,
              height:height?? AppSize.s90.h,
              AssetsManager.shopTest),
        ),
        GlobalSecondaryDecoratedContainer(
          width:width?? AppSize.s150.w,
          height: AppSize.s40.h,
          child: Center(
            child: Text("هارت اتاك",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.primary
            ),),
          ),
        )

      ],
    );
  }
}
