
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_choose_delivery.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_app_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_padding_widget.dart';
import '../widgets/cart_main_card_list_view.dart';

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
