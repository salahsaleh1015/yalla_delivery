import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/features/home/widgets/items/product_amount_section.dart';
import 'package:delivery_app/features/home/widgets/items/product_info_section.dart';
import 'package:delivery_app/resources/assets_manager.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/font_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardItemWidget extends StatelessWidget {
  const ProductCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p2.h),
      child: GlobalDecoratedContainer(

        child: Row(
          children: [
            Image.asset(
              AssetsManager.productTest,
              fit: BoxFit.fill,
              width: AppSize.s80.w,
              height: AppSize.s70.h,
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            const ProductInfoSection(),
            const ProductAmountSection(),

          ],
        ),
      ),
    );
  }
}




