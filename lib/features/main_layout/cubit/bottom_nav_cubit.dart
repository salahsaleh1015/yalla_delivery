


import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_app/features/account/views/account_view.dart';
import 'package:delivery_app/features/delivery/views/delivery_view.dart';
import 'package:delivery_app/features/home/view/home_view.dart';
import 'package:delivery_app/features/main_layout/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialState());

  static BottomNavCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;


  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavChangeState());
  }


  List<TabItem> bottomNavTabs =[
    const TabItem(icon: FontAwesomeIcons.house, title: 'الرئيسية'),
    const TabItem(icon: Icons.delivery_dining, title: 'الديلفرات'),
    const TabItem(icon: Icons.add, title: 'Add'),
    const TabItem(icon:  Icons.chat, title: 'الدردشات'),
    const TabItem(icon: Icons.person, title: 'الحساب'),
  ];

  List<Widget> screens = [
    const HomeView(),
    const DeliveryView(),
    Container(),
    Container(),
    const AccountView(),
  ];

}
