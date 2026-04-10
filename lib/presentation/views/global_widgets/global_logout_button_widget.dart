import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:delivery_app/core/utils/functions/hive_functions.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalLogoutButtonWidget extends StatelessWidget {
  const GlobalLogoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      onTap: () {
        logoutDialog(context, actionButtonCall: () async {
          await signOut(context);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: ColorManager.error,
          ),
          SizedBox(
            width: AppSize.s10.w,
          ),
          Text(
            "تسجيل الخروج",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorManager.error),
          ),
        ],
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    // Clear boxes
    await clearHiveBox<HomeBannerEntity>(boxName: kBannersBox);
    await clearHiveBox<HomeShopEntity>(boxName: kShopsBox);
    await clearHiveBox<HomeShopProductEntity>(boxName: kProductsBox);
    await clearHiveBox<DeliveryEntity>(boxName: kAllDeliveriesBox);
    await clearHiveBox<DeliveryEntity>(boxName: kAvailableDeliveryBox);
    await clearHiveBox<DeliveryEntity>(boxName: kUnAvailableDeliveryBox);
    await clearHiveBox<DeliveryEntity>(boxName: kBusyDeliveryBox);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.onBoardingRoute,
      (Route<dynamic> route) => false, // Removes all routes
    );
  }
}

void logoutDialog(
  BuildContext context, {
  required Function() actionButtonCall,
}) {
  showCustomDialog(
    context,
    dialogTitle: "تسجيل الخروج",
    actionButtonColor: ColorManager.error,
    actionButtonHint: "تسجيل الخروج",
    content: LogoutDialogContent(
      actionButtonCall: actionButtonCall,
    ),
  );
}

class LogoutDialogContent extends StatelessWidget {
  const LogoutDialogContent({super.key, required this.actionButtonCall});
  final Function() actionButtonCall;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s20.h),
        Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: ColorManager.hintColor),
        ),
        SizedBox(height: AppSize.s20.h),
        GlobalButtonWidget(
            text: " تاكيد",
            onTap: actionButtonCall,
            width: double.infinity,
            isButtonEnabled: true)
      ],
    );
  }
}
