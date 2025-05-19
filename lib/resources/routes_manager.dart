import 'package:delivery_app/admin_features/admin_account/views/admin_account_view.dart';
import 'package:delivery_app/admin_features/admin_account/views/admin_add_ads_view.dart';
import 'package:delivery_app/admin_features/admin_account/views/admin_edit_account_view.dart';
import 'package:delivery_app/admin_features/admin_authentication/views/admin_authentication.dart';
import 'package:delivery_app/admin_features/admin_delivery_management/views/admin_delivery_management_view.dart';
import 'package:delivery_app/admin_features/admin_home/views/admin_add_vendor_view.dart';
import 'package:delivery_app/admin_features/admin_home/views/admin_home_view.dart';
import 'package:delivery_app/admin_features/admin_home/views/admin_vendors_details_view.dart';
import 'package:delivery_app/admin_features/admin_main_layout/views/admin_main_layout.dart';
import 'package:delivery_app/admin_features/admin_quick_add/views/admin_addition_view.dart';
import 'package:delivery_app/delivery_features/delivery_account/views/delivery_account_view.dart';
import 'package:delivery_app/delivery_features/delivery_account/views/delivery_edit_account_view.dart';
import 'package:delivery_app/delivery_features/delivery_chat/views/delivery_chat_view.dart';
import 'package:delivery_app/delivery_features/delivery_main_layout/views/delivery_main_layout_view.dart';
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
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../delivery_features/delivery_add_order/views/delivery_add_order_view.dart';
import '../delivery_features/delivery_add_order/views/delivery_order_summary_for_delivery.dart';
import '../delivery_features/delivery_authentecation/views/delivery_authentication_view.dart';
import '../delivery_features/delivery_order_management/views/delivery_order_management_view.dart';
import '../delivery_features/delivery_order_management/views/delivery_order_summary_view.dart';
import '../features/add_order/views/order_summary_from_add_order_view.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String signUpRoute = "/signUp";
  static const String signInRoute = "/signIn";
  static const String verificationRoute = "/verification";
  static const String mainLayoutRoute = "/mainLayout";
  static const String homeRoute = "/home";
  static const String shopDetailsRoute = "/shopDetails";
  static const String chooseDeliveryRoute = "/chooseDelivery";
  static const String vendorsRoute =
      "/vendors"; // This was commented out in map but added here for completeness
  static const String summaryRoute = "/summary";
  static const String deliveryRoute = "/delivery";
  static const String accountRoute = "/account";
  static const String editAccountRoute = "/editAccount";
  static const String adsPartnerRoute = "/adsPartner";
  static const String addOrderRoute = "/addOrder";
  static const String allVendorsRoute = "/allVendors";
  static const String cartRoute = "/cart";
  static const String cartChooseDeliveryRoute = "/cartChooseDelivery";
  static const String cartOrderSummaryRoute = "/cartOrderSummary";
  static const String addOrderFromDeliveryRoute = "/addOrderFromDelivery";
  static const String orderSummaryFromDeliveryRoute =
      "/orderSummaryFromDelivery";
  static const String chooseDeliveryFromAddOrderRoute =
      "/chooseDeliveryFromAddOrder";
  static const String orderSummaryFromAddOrderRoute =
      "/orderSummaryFromAddOrder";

  // Admin routes
  static const String adminMainLayoutRoute = "/adminMainLayout";
  static const String adminAdditionRoute = "/adminAddition";
  static const String adminAccountRoute = "/adminAccount";
  static const String adminEditAccountRoute = "/adminEditAccount";
  static const String adminAddAdsRoute = "/adminAddAds";
  static const String adminDeliveryManagementRoute = "/adminDeliveryManagement";
  static const String adminHomeRoute = "/adminHome";
  static const String adminVendorDetailsRoute = "/adminVendorDetails";
  static const String adminAddVendorRoute = "/adminAddVendor";
  static const String adminAuthenticationRoute = "/adminAuthentication";

  // Delivery routes
  static const String deliveryMainLayoutRoute = "/deliveryMainLayout";
  static const String deliveryOrderManagementRoute = "/deliveryOrderManagement";
  static const String deliveryOrderSummaryRoute = "/deliveryOrderSummary";
  static const String deliveryAccountRoute = "/deliveryAccount";
  static const String deliveryEditAccountRoute = "/deliveryEditAccount";
  static const String deliveryAddOrderRoute = "/deliveryAddOrder";
  static const String deliveryOrderSummaryForDeliveryRoute =
      "/deliveryOrderSummaryForDelivery";
  static const String deliveryChatRoute = "/deliveryChat";
  static const String deliveryAuthenticationRoute = "/deliveryAuthentication";
}



class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.verificationRoute:
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const MainLayoutView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.shopDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ShopDetailsView());
      case Routes.chooseDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const ChooseDeliveryView());
      // case Routes.vendorsRoute:
      //   return MaterialPageRoute(builder: (_) => const VendorsView());
      case Routes.summaryRoute:
        return MaterialPageRoute(builder: (_) => const SummaryView());
      case Routes.deliveryRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryView());
      case Routes.accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountView());
      case Routes.editAccountRoute:
        return MaterialPageRoute(builder: (_) => const EditAccountView());
      case Routes.adsPartnerRoute:
        return MaterialPageRoute(builder: (_) => const AdsPartnerView());
      case Routes.addOrderRoute:
        return MaterialPageRoute(builder: (_) => const AddOrderView());
      case Routes.allVendorsRoute:
        return MaterialPageRoute(builder: (_) => const AllVendorsView());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      case Routes.cartChooseDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const CartChooseDelivery());
      case Routes.cartOrderSummaryRoute:
        return MaterialPageRoute(builder: (_) => const CartOrderSummaryView());
      case Routes.addOrderFromDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const AddOrderFromDeliveryView());
      case Routes.orderSummaryFromDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const OrderSummaryFromDeliveryView());
      case Routes.chooseDeliveryFromAddOrderRoute:
        return MaterialPageRoute(builder: (_) => const ChooseDeliveryFromAddOrderView());
      case Routes.orderSummaryFromAddOrderRoute:
        return MaterialPageRoute(builder: (_) => const OrderSummaryFromAddOrderView());

    // Admin routes
      case Routes.adminMainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const AdminMainLayout());
      case Routes.adminAdditionRoute:
        return MaterialPageRoute(builder: (_) => const AdminAdditionView());
      case Routes.adminAccountRoute:
        return MaterialPageRoute(builder: (_) => const AdminAccountView());
      case Routes.adminEditAccountRoute:
        return MaterialPageRoute(builder: (_) => const AdminEditAccountView());
      case Routes.adminAddAdsRoute:
        return MaterialPageRoute(builder: (_) => const AdminAddAdsView());
      case Routes.adminDeliveryManagementRoute:
        return MaterialPageRoute(builder: (_) => const AdminDeliveryManagementView());
      case Routes.adminHomeRoute:
        return MaterialPageRoute(builder: (_) => const AdminHomeView());
      case Routes.adminVendorDetailsRoute:
        return MaterialPageRoute(builder: (_) => const AdminVendorDetailsView());
      case Routes.adminAddVendorRoute:
        return MaterialPageRoute(builder: (_) => const AdminAddVendorView());
      case Routes.adminAuthenticationRoute:
        return MaterialPageRoute(builder: (_) => const AdminAuthenticationView());

    // Delivery routes
      case Routes.deliveryMainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryMainLayoutView());
      case Routes.deliveryOrderManagementRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryOrderManagementView());
      case Routes.deliveryOrderSummaryRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryOrderSummaryView());
      case Routes.deliveryAccountRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryAccountView());
      case Routes.deliveryEditAccountRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryEditAccountView());
      case Routes.deliveryAddOrderRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryAddOrderView());
      case Routes.deliveryOrderSummaryForDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryOrderSummaryForDelivery());
      case Routes.deliveryChatRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryChatView());
      case Routes.deliveryAuthenticationRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryAuthenticationView());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("Route not defined")),
      ),
    );
  }
}


// Map<String, Widget Function(BuildContext)> routes = {
//   OnBoardingView.id: (context) => OnBoardingView(),
//   SignUpView.id: (context) => const SignUpView(),
//   SignInView.id: (context) => const SignInView(),
//   VerificationView.id: (context) => const VerificationView(),
//   MainLayoutView.id: (context) => const MainLayoutView(),
//   HomeView.id: (context) => const HomeView(),
//   ShopDetailsView.id: (context) => const ShopDetailsView(),
//   ChooseDeliveryView.id: (context) => const ChooseDeliveryView(),
//   //VendorsView.id: (context) => const VendorsView(),
//   SummaryView.id: (context) => const SummaryView(),
//   DeliveryView.id: (context) => const DeliveryView(),
//   AccountView.id: (context) => const AccountView(),
//   EditAccountView.id: (context) => const EditAccountView(),
//   AdsPartnerView.id: (context) => const AdsPartnerView(),
//   AddOrderView.id: (context) => const AddOrderView(),
//   AllVendorsView.id: (context) => const AllVendorsView(),
//   AddOrderFromDeliveryView.id: (context) => const AddOrderFromDeliveryView(),
//   OrderSummaryFromDeliveryView.id: (context) =>
//       const OrderSummaryFromDeliveryView(),
//   ChooseDeliveryFromAddOrderView.id: (context) =>
//       const ChooseDeliveryFromAddOrderView(),
//   OrderSummaryFromAddOrderView.id: (context) =>
//       const OrderSummaryFromAddOrderView(),
//   CartView.id: (context) => const CartView(),
//   CartOrderSummaryView.id: (context) => const CartOrderSummaryView(),
//   CartChooseDelivery.id: (context) => const CartChooseDelivery(),
//   AdminMainLayout.id: (context) => const AdminMainLayout(),
//   AdminAdditionView.id: (context) => const AdminAdditionView(),
//   AdminAccountView.id: (context) => const AdminAccountView(),
//   AdminEditAccountView.id: (context) => const AdminEditAccountView(),
//   AdminAddAdsView.id: (context) => const AdminAddAdsView(),
//   AdminDeliveryManagementView.id: (context) =>
//       const AdminDeliveryManagementView(),
//   AdminHomeView.id: (context) => const AdminHomeView(),
//   AdminVendorDetailsView.id: (context) => const AdminVendorDetailsView(),
//   AdminAddVendorView.id: (context) => const AdminAddVendorView(),
//   DeliveryMainLayoutView.id: (context) => const DeliveryMainLayoutView(),
//   DeliveryOrderManagementView.id: (context) =>
//       const DeliveryOrderManagementView(),
//   DeliveryOrderSummaryView.id: (context) => const DeliveryOrderSummaryView(),
//   DeliveryAccountView.id: (context) => const DeliveryAccountView(),
//   DeliveryEditAccountView.id: (context) => const DeliveryEditAccountView(),
//
//   DeliveryAddOrderView.id: (context) => const DeliveryAddOrderView(),
//   DeliveryOrderSummaryForDelivery.id: (context) =>
//       const DeliveryOrderSummaryForDelivery(),
//   DeliveryChatView.id: (context) => const DeliveryChatView(),
//   AdminAuthenticationView.id: (context) => const AdminAuthenticationView(),
//   DeliveryAuthenticationView.id: (context) =>
//       const DeliveryAuthenticationView(),
// };
