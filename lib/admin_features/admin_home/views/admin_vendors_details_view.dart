import 'package:delivery_app/admin_features/admin_home/widgets/admin_add_product_for_shop_bar.dart';
import 'package:delivery_app/admin_features/admin_home/widgets/admin_products_list.dart';
import 'package:delivery_app/admin_features/admin_home/widgets/admin_shop_image_item.dart';
import 'package:delivery_app/features/home/widgets/items/shop_info_item_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminVendorDetailsView extends StatelessWidget {
  const AdminVendorDetailsView({super.key});

  static String id = "AdminShopDetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminShopImageItem(),
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
          const AdminAddProductForShopBar(),
          SizedBox(
            height: AppSize.s25.h,
          ),
          const AdminProductsList(),
        ],
      ),
    );
  }
}


