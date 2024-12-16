import 'package:delivery_app/features/add_order/views/order_summary_from_add_order_view.dart';
import 'package:delivery_app/features/global_widgets/global_app_bar.dart';
import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/features/global_widgets/lists/global_delivery_cards_for_shop_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';

class ChooseDeliveryFromAddOrderView extends StatelessWidget {
  const ChooseDeliveryFromAddOrderView({super.key});
  static String id = "ChooseOrderFromAddOrderView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalAppBar(title: "اختر التوصيل"),
          SizedBox(
            height: AppSize.s50.h,
          ),
          Text(
            "جميع مندوبي التوصيل المتاحين",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          GlobalDeliveryCardsForShopListWidget(
            height: MediaQuery.of(context).size.height * 0.65,
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          text: "استمر",
          onTap: () {
            Navigator.pushNamed(context, OrderSummaryFromAddOrderView.id);
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
