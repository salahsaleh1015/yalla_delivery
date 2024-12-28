

import 'package:delivery_app/features/account/add_ads_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/lists/global_advertisement_grid_view_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAddAdsView extends StatelessWidget {
  const AdminAddAdsView({super.key});

  static String id = "AdminAddAdsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalCircularButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back),
                Text(
                  "شركاء الإعلانات",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: AppSize.s30.w,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            SizedBox(
              width: double.infinity,
              height: AppSize.s40.h,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المعلومات الشخصية",style: Theme.of(context).textTheme.bodyMedium,),
                  const AddAdsButtonWidget(),

                ],
              ),
            ),
            const GlobalAdvertisementGridViewWidget(),

          ],
        ),
      ),
    );
  }
}
