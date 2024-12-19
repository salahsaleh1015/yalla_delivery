import 'package:delivery_app/features/account/views/account_view.dart';
import 'package:delivery_app/features/account/views/ads_partner_view.dart';
import 'package:delivery_app/features/account/views/edit_account_view.dart';
import 'package:delivery_app/features/add_order/views/add_order_view.dart';
import 'package:delivery_app/features/add_order/views/choose_delivery_from_add_order_view.dart';
import 'package:delivery_app/features/authentication/views/sign_in_view.dart';
import 'package:delivery_app/features/authentication/views/sign_up_vew.dart';
import 'package:delivery_app/features/authentication/views/verification_view.dart';
import 'package:delivery_app/features/cart/views/cart_choose_delivery.dart';
import 'package:delivery_app/features/cart/views/cart_order_summary_view.dart';
import 'package:delivery_app/features/cart/views/cart_view.dart';
import 'package:delivery_app/features/delivery/views/add_order_from_delivery_view.dart';
import 'package:delivery_app/features/delivery/views/delivery_view.dart';
import 'package:delivery_app/features/delivery/views/order_summary_from_delivery_view.dart';
import 'package:delivery_app/features/home/view/all_vendors_view.dart';
import 'package:delivery_app/features/home/view/choose_delivery_view.dart';
import 'package:delivery_app/features/home/view/home_view.dart';
import 'package:delivery_app/features/home/view/shop_details_view.dart';
import 'package:delivery_app/features/home/view/summary_view.dart';
import 'package:delivery_app/features/home/view/vendors_view.dart';
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../features/add_order/views/order_summary_from_add_order_view.dart';


Map<String, Widget Function(BuildContext)> routes = {
  OnBoardingView.id: (context) => OnBoardingView(),
  SignUpView.id: (context) => const SignUpView(),
  SignInView.id: (context) => const SignInView(),
  VerificationView.id: (context) => const VerificationView(),
  MainLayoutView.id: (context) =>  const MainLayoutView(),
  HomeView.id: (context) => const HomeView(),
  ShopDetailsView.id: (context) => const ShopDetailsView(),
  ChooseDeliveryView.id: (context) =>  ChooseDeliveryView(),
  //VendorsView.id: (context) => const VendorsView(),
  SummaryView.id: (context) => const SummaryView(),
  DeliveryView.id: (context) => const DeliveryView(),
  AccountView.id: (context) => const AccountView(),
  EditAccountView.id: (context) => const EditAccountView(),
  AdsPartnerView.id: (context) => const AdsPartnerView(),
  AddOrderView.id: (context) => const AddOrderView(),
  AllVendorsView.id: (context) => const AllVendorsView(),
  AddOrderFromDeliveryView.id: (context) => const AddOrderFromDeliveryView(),
  OrderSummaryFromDeliveryView.id: (context) => const OrderSummaryFromDeliveryView(),
  ChooseDeliveryFromAddOrderView.id: (context) => const ChooseDeliveryFromAddOrderView(),
  OrderSummaryFromAddOrderView.id: (context) => const OrderSummaryFromAddOrderView(),
  CartView.id: (context) => const CartView(),
  CartOrderSummaryView.id: (context) => const CartOrderSummaryView(),
  CartChooseDelivery.id: (context) => const CartChooseDelivery(),
};