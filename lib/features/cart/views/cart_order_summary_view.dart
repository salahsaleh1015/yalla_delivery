import 'package:delivery_app/features/home/widgets/items/notes_section_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/summary_delivery_item_widget.dart';
import 'package:delivery_app/global_widgets/global_app_bar.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_dialogs/confirm_order_dialog.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/items/edit_location_card_item_widget.dart';
import '../../home/widgets/items/summary_details_item_widget.dart';

class CartOrderSummaryView extends StatelessWidget {
  const CartOrderSummaryView({super.key});
  static String id = "CartOrderSummaryView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppBar(

                  title: "ملخص الطلب"),
              SizedBox(
                height: AppSize.s30.h,
              ),
              const EditLocationCardItemWidget(),
              SizedBox(
                height: AppSize.s15.h,
              ),
              Text("تفاصيل الطلب",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              const SummaryDetailsItemWidget(),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text("تفاصيل التوصيل",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: AppSize.s15.h,
              ),
              const SummaryDeliveryItemWidget(),
              SizedBox(
                height: AppSize.s15.h,
              ),
              const NotesSectionItemWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          isButtonEnabled: true,
          text: "استمر",
          onTap: () {
            confirmOrderDialog(context);
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
