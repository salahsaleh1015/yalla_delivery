import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_app/presentation/features/views/main_layout/cubit/bottom_nav_cubit.dart';
import 'package:delivery_app/presentation/global_widgets/global_bottom_nav_bar_widget.dart';

import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            bottomNavigationBar: GlobalBottomNavBarWidget(
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
