


import 'package:flutter/material.dart';

import '../../../global_widgets/global_tab_bar.dart';

class DeliveryOrderManagementTabBar extends StatelessWidget {
  const DeliveryOrderManagementTabBar({super.key});

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
