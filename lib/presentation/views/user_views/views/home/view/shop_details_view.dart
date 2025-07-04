import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_app_bar.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_dialogs/confirm_order_dialog.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../widgets/items/edit_location_card_item_widget.dart';
import '../widgets/items/notes_section_item_widget.dart';
import '../widgets/items/price_card_item_wdget.dart';
import '../widgets/items/product_section_item_widget.dart';
import '../widgets/items/shop_image_item.dart';
import '../widgets/items/shop_info_item_widget.dart';
import '../widgets/items/summary_delivery_item_widget.dart';
import '../widgets/items/summary_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopDetailsView extends StatelessWidget {
  const ShopDetailsView({super.key});
  static String id = 'ShopDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  ShopImageItem(),
          SizedBox(
            height: AppSize.s10.h,
          ),
         const ShopInfoItemWidget(),
          Divider(
            indent: AppSize.s20.w,
            endIndent: AppSize.s20.w,
            color: ColorManager.socialButtonColor,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
         const ProductsSectionItemWidget(),

        ],
      ),
      bottomNavigationBar: const PriceCardItemWidget(),
    );
  }
}


