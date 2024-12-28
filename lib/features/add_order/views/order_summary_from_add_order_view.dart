
import 'package:delivery_app/features/home/view/summary_view.dart';
import 'package:delivery_app/features/home/widgets/items/edit_location_card_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/notes_section_item_widget.dart';
import 'package:delivery_app/features/home/widgets/items/summary_delivery_item_widget.dart';
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_dialogs/confirm_order_dialog.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_rrder_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global_widgets/global_app_bar.dart';
import '../../../resources/values_manager.dart';


class OrderSummaryFromAddOrderView extends StatelessWidget {
  const OrderSummaryFromAddOrderView({super.key});
static String id = 'OrderSummaryFromAddOrderView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 body: GlobalPaddingWidget(child:Column(
   crossAxisAlignment:  CrossAxisAlignment.start,
   children: [
     const GlobalAppBar(title: "ملخص الطلب"),
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
     const GlobalOrderDetailsWidget(),
     SizedBox(
       height: AppSize.s20.h,
     ),
     const SummaryDeliveryItemWidget(),
     SizedBox(
       height: AppSize.s15.h,
     ),
     const NotesSectionItemWidget()
   ],
 ) ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          text: "تأكيد الطلب",
          onTap: () {
            confirmOrderDialog(context);
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
