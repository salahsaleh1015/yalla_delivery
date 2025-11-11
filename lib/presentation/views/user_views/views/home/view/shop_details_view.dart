import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../models/shop_model.dart';
import '../widgets/items/price_card_item_wdget.dart';
import '../widgets/items/product_section_item_widget.dart';
import '../widgets/items/shop_image_item.dart';
import '../widgets/items/shop_info_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopDetailsView extends StatelessWidget {
  const ShopDetailsView({super.key, required this.shop});
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopImageItem(
            image: shop.shopImage,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          ShopInfoItemWidget(
            shop: shop,
          ),
          Divider(
            indent: AppSize.s20.w,
            endIndent: AppSize.s20.w,
            color: ColorManager.socialButtonColor,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          ProductsSectionItemWidget(
            shopId: shop.shopId!,
          ),
        ],
      ),
      // bottomNavigationBar: const PriceCardItemWidget(),
    );
  }
}
