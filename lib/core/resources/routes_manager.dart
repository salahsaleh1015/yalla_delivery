import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/models/order_info_model.dart';
import 'package:delivery_app/presentation/models/order_summary_model.dart';
import 'package:delivery_app/presentation/models/user_model.dart';
import 'package:delivery_app/presentation/models/verification_args_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_account/views/admin_account_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_account/views/admin_add_ads_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_account/views/admin_edit_account_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_authentication/views/admin_authentication.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_delivery_management/views/admin_delivery_management_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/views/admin_add_vendor_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/views/admin_home_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_home/views/admin_vendors_details_view.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_main_layout/views/admin_main_layout.dart';
import 'package:delivery_app/presentation/views/admin_views/views/admin_quick_add/views/admin_addition_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_account/views/delivery_account_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_account/views/delivery_edit_account_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_add_order/views/delivery_add_order_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_add_order/views/delivery_order_summary_for_delivery.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_authentecation/views/delivery_authentication_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_chat/views/delivery_chat_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_main_layout/views/delivery_main_layout_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/views/delivery_order_management_view.dart';
import 'package:delivery_app/presentation/views/delivery_views/views/delivery_order_management/views/delivery_order_summary_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/account_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/ads_partner_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/edit_account_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/choose_delivery_from_add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/failure_auth_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/sign_in_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/sign_up_vew.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/success_auth_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/verification_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_choose_delivery.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_order_summary_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/cart/views/cart_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/delivery/views/add_order_from_delivery_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/delivery/views/delivery_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/summary/order_summary_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/all_vendors_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/choose_delivery_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/home_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/shop_details_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/home/view/summary_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/models/banner_model.dart';
import '../../presentation/models/user_and_delivery_combined_model.dart';
import '../../presentation/models/user_and_order_combined_model.dart';
import '../../presentation/views/global_widgets/lists/global_delivery_cards_filtered_list_widget.dart';
import '../../presentation/views/user_views/views/chat/views/chat_messages_view.dart';
import '../../presentation/views/user_views/views/chat/views/chats_view.dart';
import '../../presentation/views/user_views/views/home/view/banner_details_view.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String signUpRoute = "/signUp";
  static const String signInRoute = "/signIn";
  static const String verificationRoute = "/verification";
  static const String successAuthRoute = "/successAuth";
  static const String failureAuthRoute = "/failureAuth";
  static const String mainLayoutRoute = "/mainLayout";
  static const String homeRoute = "/home";
  static const String shopDetailsRoute = "/shopDetails";
  static const String chooseDeliveryRoute = "/chooseDelivery";
  static const String vendorsRoute =
      "/vendors"; // This was commented out in map but added here for completeness

  static const String userChatRoute = "/userChat";
  static const String userChatMessageRoute = "/userChatMessage";
  static const String summaryRoute = "/summary";
  static const String deliveryRoute = "/delivery";
  static const String accountRoute = "/account";
  static const String editAccountRoute = "/EditAccountView";
  static const String adsPartnerRoute = "/adsPartner";
  static const String bannerDetailsRoute = "/bannerDetails";
  static const String addOrderRoute = "/addOrder";
  static const String allVendorsRoute = "/allVendors";
  static const String cartRoute = "/cart";
  static const String cartChooseDeliveryRoute = "/cartChooseDelivery";
  static const String cartOrderSummaryRoute = "/cartOrderSummary";
  static const String addOrderFromDeliveryRoute = "/addOrderFromDelivery";
  static const String orderSummaryRoute = "/orderSummary";
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
  PhoneAuthCubit? phoneAuthCubit;

  RouteGenerator() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: const SignUpView(),
          ),
        );
      case Routes.signInRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!, child: const SignInView()));
      case Routes.verificationRoute:
        final args = settings.arguments as VerificationArgs;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: VerificationView(
                    isSignUpFlow: args.isSignUpFlow,

                    userModel: args.userModel,
                  ),
                ));
      case Routes.successAuthRoute:
        final args = settings.arguments as VerificationArgs;
        return MaterialPageRoute(
            builder: (_) => SuccessAuthView(
                  isSignUpFlow: args.isSignUpFlow,
                  userModel: args.userModel,
                ));
      case Routes.failureAuthRoute:
        return MaterialPageRoute(builder: (_) => const FailureAuthView());
      case Routes.mainLayoutRoute:
        //final args = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => MainLayoutView(
                  userModel:  UserModel(
                    phoneNumber:'01127504745',
                    userLocation:"existed user",
                    userName: "existed user",
                  ),
                ));
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.shopDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ShopDetailsView());
      case Routes.chooseDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const ChooseDeliveryView());
      case Routes.bannerDetailsRoute:
        final args = settings.arguments as BannerModel;
         return MaterialPageRoute(builder: (_) =>  BannerDetailsView(
           bannerModel: args,
         ));
      case Routes.summaryRoute:
        return MaterialPageRoute(builder: (_) => const SummaryView());
      case Routes.deliveryRoute:
        final args = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => DeliveryView(
                  userModel: args,
                ));
      case Routes.accountRoute:
        final args = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => AccountView(
                  userModel: args,
                ));
      case Routes.editAccountRoute:
        return MaterialPageRoute(builder: (_) => const EditAccountView());
      case Routes.adsPartnerRoute:
        return MaterialPageRoute(builder: (_) => const AdsPartnerView());
      case Routes.addOrderRoute:
        final args = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => AddOrderView(
                  userModel: args,
                ));
      case Routes.allVendorsRoute:
        return MaterialPageRoute(builder: (_) => const AllVendorsView());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      case Routes.cartChooseDeliveryRoute:
        return MaterialPageRoute(builder: (_) => const CartChooseDelivery());
      case Routes.cartOrderSummaryRoute:
        return MaterialPageRoute(builder: (_) => const CartOrderSummaryView());
      case Routes.addOrderFromDeliveryRoute:
        final args = settings.arguments as UserAndDeliveryCombinedModel;
        return MaterialPageRoute(
            builder: (_) => AddOrderFromDeliveryView(
                  userAndDeliveryCombinedModel: args,
                ));
      case Routes.orderSummaryRoute:
        final args = settings.arguments as OrderInfoModel;
        return MaterialPageRoute(
            builder: (_) => OrderSummaryView(
                  orderInfoModel: args,
                ));
      case Routes.chooseDeliveryFromAddOrderRoute:
        final args = settings.arguments as UserAndOrderCombinedModel;
        return MaterialPageRoute(
            builder: (_) => ChooseDeliveryFromAddOrderView(
                  userAndOrderCombined: args,
                ));

      case Routes.userChatRoute:
        return MaterialPageRoute(builder: (_) => const ChatsView());
      case Routes.userChatMessageRoute:
        final args = settings.arguments as ChatModel;
        return MaterialPageRoute(builder: (_) =>  ChatMessagesView(

          chatModel: args,
        ));

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
        return MaterialPageRoute(
            builder: (_) => const AdminDeliveryManagementView());
      case Routes.adminHomeRoute:
        return MaterialPageRoute(builder: (_) => const AdminHomeView());
      case Routes.adminVendorDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const AdminVendorDetailsView());
      case Routes.adminAddVendorRoute:
        return MaterialPageRoute(builder: (_) => const AdminAddVendorView());
      case Routes.adminAuthenticationRoute:
        return MaterialPageRoute(
            builder: (_) => const AdminAuthenticationView());

      // Delivery routes
      case Routes.deliveryMainLayoutRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryMainLayoutView());
      case Routes.deliveryOrderManagementRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryOrderManagementView());
      case Routes.deliveryOrderSummaryRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryOrderSummaryView());
      case Routes.deliveryAccountRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryAccountView());
      case Routes.deliveryEditAccountRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryEditAccountView());
      case Routes.deliveryAddOrderRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryAddOrderView());
      case Routes.deliveryOrderSummaryForDeliveryRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryOrderSummaryForDelivery());
      case Routes.deliveryChatRoute:
        return MaterialPageRoute(builder: (_) => const DeliveryChatView());
      case Routes.deliveryAuthenticationRoute:
        return MaterialPageRoute(
            builder: (_) => const DeliveryAuthenticationView());

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
