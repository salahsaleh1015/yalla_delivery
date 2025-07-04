

import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/choose_delivery_from_add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_view.dart';
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
                onTap: () {
                  Navigator.pushNamed(context, CartView.id);
                },
                icon: Icons.shopping_cart_outlined,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          Text(
            "أضف طلبك",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: AppSize.s30.h,
          ),
          const GlobalCustomOrderTextField(),
          SizedBox(
            height: AppSize.s30.h,
          ),
          GlobalButtonWidget(
            isButtonEnabled: true,
            text: "استمر",
            onTap: (){
              Navigator.pushNamed(context, ChooseDeliveryFromAddOrderView.id);
            },
            width: double.infinity,
          ),
        ],
      )),
    );
  }
}





