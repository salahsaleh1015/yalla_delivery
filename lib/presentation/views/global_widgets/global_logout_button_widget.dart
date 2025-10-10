import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/global_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_dialogs/logout_dialog.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_light_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalLogoutButtonWidget extends StatelessWidget {
  const GlobalLogoutButtonWidget({super.key, required this.actionButtonCall});

 final  void Function() actionButtonCall;
  @override
  Widget build(BuildContext context) {
    return GlobalLightButtonWidget(
      onTap: () {
        // logoutDialog(context);
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => CustomDialog(
                dialogTitle: "تسجيل الخروج",
                actionButtonColor: ColorManager.error,
                actionButtonHint: "تسجيل الخروج",
                actionButtonCallBack: actionButtonCall,
                content: const LogoutDialogContent()));
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
