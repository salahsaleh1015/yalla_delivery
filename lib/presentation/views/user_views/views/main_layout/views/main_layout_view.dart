import 'package:delivery_app/presentation/models/cached_user_model.dart';
import 'package:delivery_app/presentation/models/user_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_main_layout_cubit/bottom_nav_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_bottom_nav_bar_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/account_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/chat/views/chats_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/delivery/views/delivery_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutView extends StatelessWidget {
  MainLayoutView({
    super.key,
  });

  List<Widget> get screens => [
        const HomeView(),
        const DeliveryView(),
        const AddOrderView(),
        const ChatsView(),
        const AccountView(),
      ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavStates>(
        builder: (context, state) {
          var cubit = BottomNavCubit.get(context);
          return Scaffold(
            body: screens[cubit.currentIndex],
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
