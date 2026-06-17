


import 'package:flutter/material.dart';

import '../../../../global_widgets/global_tab_bar.dart';

class OrderManagementTabBar extends StatelessWidget {
  const OrderManagementTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GlobalTabBar(tabs: [
      Tab(
        text: "المعلقة",
      ),
      Tab(
        text: "المقبولة",
      ),
      Tab(
        text: "الملغية",
      ),
      Tab(
        text: "المكتملة",
      ),
    ]);
  }
}