import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_app/features/global_widgets/global_decorated_bottom_container.dart';
import 'package:delivery_app/features/main_layout/cubit/bottom_nav_cubit.dart';
import 'package:delivery_app/features/main_layout/widgets/bottom_nav_bar_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});
  static String id = 'MainLayoutView';


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavStates>(
        builder: (context, state) {
          var cubit = BottomNavCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: ConvexAppBar(
              curve: Curves.fastOutSlowIn,
              color: ColorManager.secondaryTextColor,
              activeColor: ColorManager.primary,
              backgroundColor: ColorManager.white,
              height: AppSize.s50.h,
              initialActiveIndex: cubit.currentIndex,
                items: cubit.bottomNavTabs,
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
