
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_admin_add_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/add_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AdminAddProductForShopBar extends StatelessWidget {
  const AdminAddProductForShopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "المنتجات المقدمة",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            GlobalAdminAddButtonWidget(
              text: "إضافة منتج جديد",
              onTap: () {
                addProductDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
