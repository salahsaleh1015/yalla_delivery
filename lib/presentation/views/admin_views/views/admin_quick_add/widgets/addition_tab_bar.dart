import 'package:delivery_app/presentation/views/global_widgets/global_tab_bar.dart';
import 'package:flutter/material.dart';

class AdditionTabBar extends StatelessWidget {
  const AdditionTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalTabBar(
      tabs: [
        Tab(
          text: "إضافة موزع خدمة",
        ),
        Tab(
          text: "إضافة مندوب توصيل",
        ),
      ],
    );
  }
}

