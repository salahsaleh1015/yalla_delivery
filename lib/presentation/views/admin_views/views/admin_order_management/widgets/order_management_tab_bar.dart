import 'package:delivery_app/presentation/views/global_widgets/global_tab_bar.dart';
import 'package:flutter/material.dart';

class AdminOrderManagementTabBar extends StatelessWidget {
  const AdminOrderManagementTabBar({super.key});

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
