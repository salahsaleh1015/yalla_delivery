

import 'package:delivery_app/presentation/features/views/cart/views/cart_choose_delivery.dart';
import 'package:delivery_app/presentation/features/views/cart/widgets/cart_app_bar.dart';
import 'package:delivery_app/presentation/features/views/cart/widgets/cart_button.dart';
import 'package:delivery_app/presentation/features/views/cart/widgets/cart_main_card_list_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static String id = "CartView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CartAppBar(),
            SizedBox(
              height: AppSize.s30.h,
            ),
            const CartMainCardListView(),
          ],
        ),
      )),
      bottomNavigationBar: CartButton(
        onTap: () {
          Navigator.pushNamed(context, CartChooseDelivery.id);
        },
      ),
    );
  }
}
