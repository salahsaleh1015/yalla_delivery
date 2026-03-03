import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../core/services/firebase_services/firestore_user_info_services.dart';

class GlobalLogoutButtonWidget extends StatelessWidget {
  const GlobalLogoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      onTap: () async {
        await signOut(context);
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
    await Hive.deleteFromDisk();
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.onBoardingRoute,
          (Route<dynamic> route) => false, // Removes all routes
    );
  }
}

class LogoutDialogContent extends StatelessWidget {
  const LogoutDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.s20.h,
        ),
        Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.hintColor,
              ),
        ),
        SizedBox(
          height: AppSize.s20.h,
        ),
      ],
    );
  }
}
