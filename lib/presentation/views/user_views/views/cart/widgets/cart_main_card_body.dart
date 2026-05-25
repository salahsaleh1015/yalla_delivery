import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/authentication_widgets/or_break_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_order_list_view.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_dialogs/delete_all_orders_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global_widgets/global_dialogs/delete_order_dialog.dart';
import '../../../../global_widgets/global_light_button_widget.dart';

class CartMainCardBody extends StatelessWidget {
  const CartMainCardBody({super.key, required this.order});

  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "تفاصيل الطلب",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              order.orderDate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // TextButton(
            //     onPressed: () {
            //       deleteAllOrdersDialog(context);
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           FontAwesomeIcons.trashCan,
            //           color: ColorManager.primary,
            //           size: AppSize.s15.r,
            //         ),
            //         SizedBox(
            //           width: AppSize.s5.w,
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(bottom: AppPadding.p2.h),
            //           child: Text(
            //             "مسح الكل",
            //             style: Theme.of(context).textTheme.labelLarge,
            //           ),
            //         )
            //       ],
            //     ))
          ],
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
       Divider(
thickness: 2,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        Text(
         order.orderDetails,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "حاله الطلب",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.box,
                  color: ColorManager.primary,
                  size: AppSize.s15.r,
                ),
                SizedBox(
                  width: AppSize.s5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppPadding.p2.h),
                  child: Text(
                    order.orderStatus,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                )
              ],
            )
          ],
        ),
        // GlobalLightButtonWidget(
        //   onTap: () {
        //     deleteOrderDialog(context);
        //   },
        //   child: Text("مسح الطلب",
        //       style: Theme.of(context)
        //           .textTheme
        //           .labelLarge!
        //           .copyWith(color: ColorManager.error)),
        // ),
      ],
    );
  }
}
