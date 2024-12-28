import 'package:delivery_app/features/home/widgets/items/advertisement_item_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AdsPartnerView extends StatelessWidget {
  const AdsPartnerView({super.key});
  static const id = 'ads-partner';
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
              height: AppSize.s20.h,
            ),
            Expanded(child: GridView.builder(
                itemCount: 10,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                   // childAspectRatio: 1.5,
                    crossAxisSpacing: AppSize.s10.w,
                    mainAxisSpacing: AppSize.s10.h
                ), itemBuilder: (context, index) =>  AdvertisementItemWidget(
                width: MediaQuery.of(context).size.width*0.5,
              height: AppSize.s100.h,
            ),),)
          ],
        ),
      ),
    );
  }
}
