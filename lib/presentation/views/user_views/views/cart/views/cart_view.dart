
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/cart_app_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/order_management_tab_bar.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/widgets/orders_management_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/constants_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../injection.dart';
import '../../../../global_widgets/global_padding_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.phoneNumber});

final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: AppConstant.managementTabBarLength,
        child: GlobalPaddingWidget(
            child: Column(
              children: [
                const CartAppBar(),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                const OrderManagementTabBar(),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                OrdersManagementTabBarView(
                  phoneNumber: phoneNumber,
                ),

              ],
            )),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "هناك خطأ ما حاول مره اخرى لاحقا",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
    ;
  }
}
