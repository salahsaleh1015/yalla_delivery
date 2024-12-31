import 'package:delivery_app/global_widgets/global_tab_bar.dart';
import 'package:flutter/material.dart';

class OrderManagementTabBar extends StatelessWidget {
  const OrderManagementTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GlobalTabBar(tabs: [
      Tab(
        text: "الكل",
      ),
      Tab(
        text: "جاري",
      ),
      Tab(
        text: "ملغي",
      ),
      Tab(
        text: "مكتمل",
      ),
    ]);
  }
}
