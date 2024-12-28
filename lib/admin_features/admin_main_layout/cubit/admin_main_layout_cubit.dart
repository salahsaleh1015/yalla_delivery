import 'package:bloc/bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_app/admin_features/admin_account/views/admin_account_view.dart';
import 'package:delivery_app/admin_features/admin_addittion/views/admin_addition_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'admin_main_layout_state.dart';

class AdminMainLayoutCubit extends Cubit<AdminMainLayoutState> {
  AdminMainLayoutCubit() : super(AdminMainLayoutInitial());

  static AdminMainLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;


  void changeIndex(int index) {
    currentIndex = index;
    emit(AdminMainLayoutChangeBottomNavState());
  }


  List<TabItem> bottomNavTabs = [
    const TabItem(icon: FontAwesomeIcons.house, title: 'الرئيسية'),
    const TabItem(icon: Icons.delivery_dining, title: 'الديلفرات'),
    const TabItem(icon: Icons.add, title: 'اضف'),
    const TabItem(icon:  Icons.file_open_rounded, title: 'الطلبات'),
    const TabItem(icon: Icons.person, title: 'الحساب'),
  ];



  List<Widget> adminScreens = [
    Container(),
    Container(),
    const AdminAdditionView(),
    Container(),
    const AdminAccountView(),
  ];

}
