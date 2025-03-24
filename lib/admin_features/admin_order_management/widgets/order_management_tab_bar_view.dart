



import 'package:delivery_app/admin_features/admin_order_management/widgets/order_management_cards_list.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class AdminOrderManagementTabBarView extends StatelessWidget {
  const AdminOrderManagementTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: TabBarView(children:[
        OrderManagementCardsList(
          orderStatusColor: ColorManager.primary,
          orderStatus: "الكل",
          statusColor: const Color(0xFFffe1d8),
        ),
        OrderManagementCardsList(
          orderStatusColor: ColorManager.primary,
          orderStatus: "جاري",
          statusColor: const Color(0xFFffe1d8),
        ),
        OrderManagementCardsList(
          orderStatusColor: ColorManager.error,
          orderStatus: "ملغي",
          statusColor: const Color(0xFFffe1d8),
        ),
        const OrderManagementCardsList(
          orderStatusColor: Colors.green,
          orderStatus: "مكتمل",
          statusColor: Color(0xFFcff7d1),
        ),
      ]),
    );
  }
}
