import 'package:delivery_app/core/resources/routes_manager.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../../../../global_widgets/global_search_card_item_widget.dart';
import '../../../../global_widgets/global_user_card_widget.dart';
import '../../../../global_widgets/lists/global_advertisement_list_widget.dart';
import '../../../../global_widgets/lists/global_vendor_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalPaddingWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalUserCardWidget(
                  radius: AppSize.s50.r, // screen util added inside the widget
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                // GlobalCircularButtonWidget(
                //   onTap: () {
                // Navigator.pushNamed(context, Routes.cartRoute);
                //   },
                //   icon: Icons.shopping_cart_outlined,
                //   iconColor: ColorManager.black,
                // ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            // const GlobalSearchCardItemWidget(
            //   hintText: 'بحث',
            // ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Text(
              "شركاء الإعلانات",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorManager.black),
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalAdvertisementListWidget(),
            Row(
              children: [
                Text(
                  "اقتراحات للشراء ",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.black),
                ),
                const Spacer(),
                // GlobalViewAllButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, AllVendorsView.id);
                //   },
                // ),
              ],
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            const GlobalVendorListWidget(),
          ],
        ),
      ),
    );
  }
}
