import 'package:delivery_app/features/add_order/widgets/add_order_view_body.dart';
import 'package:delivery_app/features/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/features/home/view/choose_delivery_view.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});

  static String id = "AddOrderView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppSize.s30.w,
              ),
              Text(
                "اضافة طلب",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              GlobalCircularButtonWidget(
                onTap: () {},
                icon: Icons.shopping_cart_outlined,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
           const AddOrderViewBody(),
        ],
      )),
    );
  }
}





