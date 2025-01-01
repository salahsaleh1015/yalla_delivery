import 'package:delivery_app/features/account/views/ads_partner_view.dart';
import 'package:delivery_app/features/cart/views/cart_view.dart';

import 'package:delivery_app/features/home/view/all_vendors_view.dart';
import 'package:delivery_app/features/home/view/vendors_view.dart';
import 'package:delivery_app/global_widgets/lists/global_advertisement_list_widget.dart';
import 'package:delivery_app/global_widgets/lists/global_vendor_list_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_search_card_item_widget.dart';
import 'package:delivery_app/global_widgets/global_user_card_widget.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            const GlobalSearchCardItemWidget(hintText: 'بحث',),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Text("شركاء الإعلانات",style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.black
            ),),
             SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalAdvertisementListWidget(),

            Row(

              children: [
                Text("موزعي الخدمة",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorManager.black
                ),),
               const Spacer(),
               TextButton(onPressed: (){
                 Navigator.pushNamed(context, AllVendorsView.id);
               }, child: Row(
                 children: [
                   Text("عرض الكل",style: Theme.of(context).textTheme.bodySmall,),
                   Icon(Icons.arrow_forward,color: ColorManager.primary,),
                 ],
               )),

              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalVendorListWidget(),

          ],
        ),
      ),
    );
  }
}

