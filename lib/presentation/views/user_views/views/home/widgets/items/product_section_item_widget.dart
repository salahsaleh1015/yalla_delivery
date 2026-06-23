import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_search_card_item_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/lists/product_cards_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductsSectionItemWidget extends StatelessWidget {
  const ProductsSectionItemWidget({super.key, required this.shop});

  final HomeShopEntity shop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s10.h),
          Text(
            "المنتجات المقدمة",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorManager.black),
          ),
          SizedBox(height: AppSize.s10.h),
          // ✅ Expanded شغالة دلوقتي لأن أبوها Expanded في الـ Scaffold
          Expanded(
            child: ProductCardsListWidget(shop: shop),
          ),
        ],
      ),
    );
  }
}
