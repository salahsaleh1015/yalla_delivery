
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_custom_order_text_field.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_rrder_details_widget.dart';
import '../../home/widgets/items/edit_location_card_item_widget.dart';
import '../../home/widgets/items/notes_section_item_widget.dart';
import '../../home/widgets/items/summary_delivery_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_summary_from_delivery_view.dart';

class AddOrderFromDeliveryView extends StatelessWidget {
  const AddOrderFromDeliveryView({super.key});
  static String id = "AddOrderFromDeliveryView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalAppBar(

            title: "اضافة طلب",
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          Text(
            "أضف طلبك",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const GlobalCustomOrderTextField(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          GlobalButtonWidget(
            isButtonEnabled: true,
            text: "استمر",
            onTap: (){
              Navigator.pushNamed(context, OrderSummaryFromDeliveryView.id);
            },
            width: double.infinity,
          ),
        ],
      )),
    );
  }
}
