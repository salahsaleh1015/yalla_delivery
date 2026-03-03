import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_pop_scope.dart';
import 'package:delivery_app/presentation/views/global_widgets/lists/global_advertisement_grid_view_widget.dart';
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
            const GlobalAdvertisementGridViewWidget(),
          ],
        ),
      ),
    );
  }
}
