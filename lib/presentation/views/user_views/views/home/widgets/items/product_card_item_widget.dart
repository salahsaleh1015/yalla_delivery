
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/product_model.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_amount_section.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/widgets/items/product_info_section.dart' show ProductInfoSection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCardItemWidget extends StatelessWidget {
  const ProductCardItemWidget({super.key, required this.product});

  final HomeShopProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p2.h),
      child: GlobalDecoratedContainer(

        child: Row(
          children: [
            Image.network(
              product.productImage,
              fit: BoxFit.fill,
              width: AppSize.s100.w,
              height: AppSize.s70.h,
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
             ProductInfoSection(product: product,),
          //  const ProductAmountSection(),

          ],
        ),
      ),
    );
  }
}




