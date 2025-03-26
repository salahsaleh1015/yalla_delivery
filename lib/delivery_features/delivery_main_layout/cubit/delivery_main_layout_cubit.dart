
import 'package:delivery_app/delivery_features/delivery_account/views/delivery_account_view.dart';
import 'package:delivery_app/delivery_features/delivery_add_order/views/delivery_add_order_view.dart';
import 'package:delivery_app/delivery_features/delivery_chat/views/delivery_chat_view.dart';
import 'package:delivery_app/delivery_features/delivery_home/views/delivery_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../delivery_order_management/views/delivery_order_management_view.dart';

part 'delivery_main_layout_state.dart';

class DeliveryMainLayoutCubit extends Cubit<DeliveryMainLayoutStates> {
  DeliveryMainLayoutCubit() : super(DeliveryMainLayoutInitialState());

  static DeliveryMainLayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex =2;

  void changeIndex(int index){
    currentIndex= index;
    emit(DeliveryMainLayoutChangeBottomNavState());
  }

  List<TabItem> deliveryBottomNavTabs = [
     const TabItem(icon: FontAwesomeIcons.house, title: 'الرئيسية'),
    const TabItem(icon: Icons.file_open_rounded, title: 'الطلبات'),
    const TabItem(icon: Icons.add, title: 'اضف'),
    const TabItem(icon:  Icons.chat, title: 'المحادثات'),
    const TabItem(icon: Icons.person, title: 'الحساب'),
  ];



  List<Widget> deliveryScreens = const [
     DeliveryHomeView(),
     DeliveryOrderManagementView(),
     DeliveryAddOrderView(),
     DeliveryChatView(),
     DeliveryAccountView(),
  ];


}
