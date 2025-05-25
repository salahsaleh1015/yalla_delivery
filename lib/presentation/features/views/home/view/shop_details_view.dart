
import 'package:delivery_app/presentation/features/views/home/widgets/items/price_card_item_wdget.dart';
import 'package:delivery_app/presentation/features/views/home/widgets/items/product_section_item_widget.dart';
import 'package:delivery_app/presentation/features/views/home/widgets/items/shop_image_item.dart';
import 'package:delivery_app/presentation/features/views/home/widgets/items/shop_info_item_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
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


