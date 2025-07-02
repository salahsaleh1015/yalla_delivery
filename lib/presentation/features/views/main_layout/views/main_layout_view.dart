
import 'package:delivery_app/presentation/features/models/user_model.dart';
import 'package:delivery_app/presentation/features/views/home/view/home_view.dart';
import 'package:delivery_app/presentation/features/views/main_layout/cubit/bottom_nav_cubit.dart';
import 'package:delivery_app/presentation/global_widgets/global_bottom_nav_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/presentation/features/views/account/views/account_view.dart';
import 'package:delivery_app/presentation/features/views/add_order/views/add_order_view.dart';
import 'package:delivery_app/presentation/features/views/chat/views/chats_view.dart';
import 'package:delivery_app/presentation/features/views/delivery/views/delivery_view.dart';



class MainLayoutView extends StatelessWidget {
   MainLayoutView({super.key, required this.userModel});
  static String id = 'MainLayoutView';


  final UserModel userModel;

   List<Widget> get screens => [
     const HomeView(),
     const DeliveryView(),
     const AddOrderView(),
     const ChatsView(),
     AccountView(userModel: userModel),
   ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavStates>(
        builder: (context, state) {
          var cubit = BottomNavCubit.get(context);
          return Scaffold(
            body:screens[cubit.currentIndex],
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
