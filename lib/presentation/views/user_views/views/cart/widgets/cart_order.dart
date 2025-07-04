
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_dialogs/delete_order_dialog.dart';
import '../../../../global_widgets/global_light_button_widget.dart';

class CartOrder extends StatelessWidget {
  const CartOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AssetsManager.productTest,
              fit: BoxFit.fill,
              width: AppSize.s80.w,
              height: AppSize.s70.h,
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "دجاج هارت أتاك “سنجل”",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "برجر دجاج مشوي مع إضافات مميزة.",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  r"$50",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: ColorManager.black),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        GlobalLightButtonWidget(
          onTap: () {
            deleteOrderDialog(context);
          },
          child: Text("إلغاء الطلب",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorManager.error)),
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
      ],
    );
  }
}