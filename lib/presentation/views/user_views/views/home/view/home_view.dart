import 'package:delivery_app/presentation/views/user_views/views/home/view/shop_details_view.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_app_bar.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_circular_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../../../../global_widgets/global_search_card_item_widget.dart';
import '../../../../global_widgets/global_user_card_widget.dart';
import '../../../../global_widgets/global_view_all_button.dart';
import '../../../../global_widgets/lists/global_advertisement_list_widget.dart';
import '../../../../global_widgets/lists/global_vendor_list_widget.dart';
import '../../cart/views/cart_view.dart';
import '../widgets/items/edit_location_card_item_widget.dart';
import '../widgets/items/notes_section_item_widget.dart';
import '../widgets/items/summary_delivery_item_widget.dart';
import '../widgets/items/summary_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'all_vendors_view.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
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
                const GlobalUserCardWidget(
                  radius: AppSize.s50, // screen util added inside the widget
                ),
                GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, CartView.id);
                  },
                  icon: Icons.shopping_cart_outlined,
                  iconColor: ColorManager.black,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.h,
            ),
            const GlobalSearchCardItemWidget(
              hintText: 'بحث',
            ),
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
                  "موزعي الخدمة",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.black),
                ),
                const Spacer(),
                GlobalViewAllButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllVendorsView.id);
                  },
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            GlobalVendorListWidget(
              onTap: () {
                Navigator.pushNamed(context, ShopDetailsView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
