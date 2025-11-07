
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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





}
