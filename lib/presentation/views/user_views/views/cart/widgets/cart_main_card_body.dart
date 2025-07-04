import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_order_list_view.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_dialogs/delete_all_orders_dialog.dart';
import '../../../../global_widgets/global_dialogs/delete_order_dialog.dart';
import '../../../../global_widgets/global_light_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartMainCardBody extends StatelessWidget {
  const CartMainCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تفاصيل الطلب",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                  onPressed: () {
                    deleteAllOrdersDialog(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.trashCan,
                        color: ColorManager.primary,
                        size: AppSize.s15.r,
                      ),
                      SizedBox(
                        width: AppSize.s5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppPadding.p2.h),
                        child: Text(
                          "مسح الكل",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ))
            ],
          ),
          const CartOrderListView(),
        ],
      ),
    );
  }
}
