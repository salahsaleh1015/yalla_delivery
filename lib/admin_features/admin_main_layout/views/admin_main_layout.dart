import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminMainLayout extends StatelessWidget {
  const AdminMainLayout({super.key});

  static String id = 'AdminMainLayout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: ConvexAppBar(
        curve: Curves.fastOutSlowIn,
        color: ColorManager.secondaryTextColor,
        activeColor: ColorManager.primary,
        backgroundColor: ColorManager.white,
        height: AppSize.s50.h,
        initialActiveIndex: 0,
        items: const [
          TabItem(icon: FontAwesomeIcons.house, title: 'الرئيسية'),
          TabItem(icon: Icons.delivery_dining, title: 'الديلفرات'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.chat, title: 'الدردشات'),
          TabItem(icon: Icons.person, title: 'الحساب'),
        ],
        onTap: (index) {},
      ),
    );
  }
}
