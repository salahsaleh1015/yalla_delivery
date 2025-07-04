import 'package:delivery_app/presentation/views/user_views/views/home/view/summary_view.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_app_bar.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../../../../global_widgets/lists/global_delivery_cards_for_shop_list_widget.dart';
import '../widgets/items/edit_location_card_item_widget.dart';
import '../widgets/items/notes_section_item_widget.dart';
import '../widgets/items/summary_delivery_item_widget.dart';
import '../widgets/items/summary_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChooseDeliveryView extends StatelessWidget {
  const ChooseDeliveryView({super.key,});
  static String id = 'ChooseDeliveryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalAppBar(

              title: "اختر التوصيل",
            ),
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
             height: MediaQuery.of(context).size.height*0.65,
           ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(AppPadding.p8.r),
        child: GlobalButtonWidget(
          isButtonEnabled: true,
          text: "استمر",
          onTap: () {
            Navigator.pushNamed(context, SummaryView.id);
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
