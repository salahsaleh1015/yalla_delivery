import 'package:delivery_app/presentation/view_models/delivery_view_models/delivery_main_layout_cubit/delivery_main_layout_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/presentation/views/delivery_views/views/delivery_account/views/delivery_account_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_add_order/views/delivery_add_order_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_chat/views/delivery_chat_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_home/views/delivery_home_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/views/delivery_order_management_view.dart';

class DeliveryMainLayoutView extends StatelessWidget {
  const DeliveryMainLayoutView({super.key, required this.deliveryGmail});

  final String deliveryGmail;

  List<Widget>  get deliveryScreens => [
     DeliveryHomeView(
      deliveryGmail: deliveryGmail,
    ),
    const DeliveryOrderManagementView(),
    const DeliveryAddOrderView(),
    const DeliveryChatView(),
    DeliveryAccountView(
      deliveryGmail: deliveryGmail,

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryMainLayoutCubit(),
      child: BlocBuilder<DeliveryMainLayoutCubit, DeliveryMainLayoutStates>(
        builder: (context, state) {
          var cubit = DeliveryMainLayoutCubit.get(context);
          return Scaffold(
            body: deliveryScreens[cubit.currentIndex],
            bottomNavigationBar: GlobalBottomNavBarWidget(
              initialActiveIndex: cubit.currentIndex,
              items: cubit.deliveryBottomNavTabs,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
