
import 'package:delivery_app/presentation/views/global_widgets/global_tab_bar.dart';
import 'package:flutter/material.dart';


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
