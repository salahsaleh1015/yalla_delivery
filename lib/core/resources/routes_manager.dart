import 'package:delivery_app/data/models/banner_model.dart';
import 'package:delivery_app/data/models/delivery_model.dart';
import 'package:delivery_app/data/models/order_info_model.dart';
import 'package:delivery_app/data/models/shop_model.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:delivery_app/data/models/verification_args_model.dart';
import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/account_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/ads_partner_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/edit_account_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/add_order/views/choose_delivery_from_add_order_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/complete_authentication_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/failure_auth_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/sign_in_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/sign_up_vew.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/success_auth_view.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/views/verification_view.dart';
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

import '../../presentation/views/user_views/views/about_and_suggestions/views/about_and_suggestions_view.dart';
import '../../presentation/views/user_views/views/cart/views/order_summary_view.dart' show CartOrderSummaryView, OrderSummaryView;
import '../../presentation/views/user_views/views/home/view/banner_details_view.dart';

class AppPageRoute extends PageRouteBuilder {
  final Widget child;

  AppPageRoute({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade
            final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
            );

            // Slide (من تحت لفوق بسيط)
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            );

            return FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: child,
              ),
            );
          },
        );
}

class Routes {
  static const String onBoardingRoute = "/";
  static const String signUpRoute = "/signUp";
  static const String firstSignUpRoute = "/firstSignUp";
  static const String secondSignUpRoute = "/secondSignUp";
  static const String signInRoute = "/signIn";
  static const String verificationRoute = "/verification";
  static const String successAuthRoute = "/successAuth";
  static const String failureAuthRoute = "/failureAuth";
  static const String completeAuthRoute = "/completeAuth";
  static const String mainLayoutRoute = "/mainLayout";
  static const String homeRoute = "/home";
  static const String shopDetailsRoute = "/shopDetails";
  static const String chooseDeliveryRoute = "/chooseDelivery";
  static const String vendorsRoute =
      "/vendors"; // This was commented out in map but added here for completeness

  static const String userAboutAndSuggestionsRoute = "/userAboutAndSuggestions";
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
  static const String cartSummaryRoute = "/cartSummaryRoute";
  static const String chooseDeliveryFromAddOrderRoute =
      "/chooseDeliveryFromAddOrder";
  static const String orderSummaryFromAddOrderRoute =
      "/orderSummaryFromAddOrder";



}

class RouteGenerator {
  // PhoneAuthCubit? phoneAuthCubit;
  //
  // RouteGenerator() {
  //   phoneAuthCubit = PhoneAuthCubit();
  // }

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return AppPageRoute(child: OnBoardingView());

      case Routes.firstSignUpRoute:
        return AppPageRoute(child: FirstSignUpView());

      case Routes.secondSignUpRoute:
        final args = settings.arguments as FirstSignUpInfoModel;
        return AppPageRoute(
            child: SecondSignUpView(
          firstSignUpInfoModel: args,
        ));

      case Routes.signInRoute:
        return AppPageRoute(child: SignInView());

      // case Routes.signUpRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //       value: phoneAuthCubit!,
      //       child: const SignUpView(),
      //     ),
      //   );
      // case Routes.signInRoute:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //           value: phoneAuthCubit!, child: const SignInView()));
      // case Routes.verificationRoute:
      //   final args = settings.arguments as VerificationArgs;
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //             value: phoneAuthCubit!,
      //             child: VerificationView(
      //               isSignUpFlow: args.isSignUpFlow,
      //               userModel: args.userModel,
      //             ),
      //           ));
      case Routes.successAuthRoute:
        final args = settings.arguments as VerificationArgs;
        return AppPageRoute(
          child: SuccessAuthView(
            isSignUpFlow: args.isSignUpFlow,
            userModel: args.userModel,
          ),
        );
      case Routes.failureAuthRoute:
        return AppPageRoute(child: const FailureAuthView());
      case Routes.completeAuthRoute:
        final args = settings.arguments as VerificationArgs;
        return AppPageRoute(
            child: CompleteAuthenticationView(
          userModel: args.userModel,
          isSignUpFlow: args.isSignUpFlow,
        ));
      case Routes.mainLayoutRoute:
        return AppPageRoute(child: const MainLayoutView());
      case Routes.homeRoute:
        return AppPageRoute(child: const HomeView());
      case Routes.shopDetailsRoute:
        final args = settings.arguments as ShopModel;
        return AppPageRoute(
            child: ShopDetailsView(
          shop: args,
        ));
      case Routes.chooseDeliveryRoute:
        return AppPageRoute(child: const ChooseDeliveryView());
      case Routes.bannerDetailsRoute:
        final args = settings.arguments as BannerModel;
        return AppPageRoute(
            child: BannerDetailsView(
          bannerModel: args,
        ));
      case Routes.summaryRoute:
        return AppPageRoute(child: const SummaryView());
      case Routes.deliveryRoute:
        return AppPageRoute(child: const DeliveryView());
      case Routes.accountRoute:
        return AppPageRoute(child: const AccountView());
      case Routes.editAccountRoute:
        return AppPageRoute(child: const EditAccountView());
      case Routes.adsPartnerRoute:
        return AppPageRoute(child: const AdsPartnerView());
      case Routes.addOrderRoute:
        return AppPageRoute(child: const AddOrderView());
      case Routes.allVendorsRoute:
        return AppPageRoute(child: const AllVendorsView());
      case Routes.cartRoute:
        return AppPageRoute(
            child: CartView(

        ));
      case Routes.addOrderFromDeliveryRoute:
        final args = settings.arguments as DeliveryModel;
        return AppPageRoute(
            child: AddOrderFromDeliveryView(
          deliveryModel: args,
        ));
      case Routes.orderSummaryRoute:
        final args = settings.arguments as OrderInfoModel;
        return AppPageRoute(
            child: OrderSummaryView(
          orderInfoModel: args,
        ));
      case Routes.chooseDeliveryFromAddOrderRoute:
        final args = settings.arguments as String;
        return AppPageRoute(
            child: ChooseDeliveryFromAddOrderView(
          order: args,
        ));

      case Routes.userAboutAndSuggestionsRoute:
        return AppPageRoute(child: const AboutAndFeedbackView());
      case Routes.cartSummaryRoute:
        final args = settings.arguments as OrderEntity;
        return AppPageRoute(
            child: CartOrderSummaryView(order: args,
            ));
      case Routes.userChatMessageRoute:
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return AppPageRoute(
      child: Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("Route not defined")),
      ),
    );
  }
}
