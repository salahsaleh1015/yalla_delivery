import 'package:delivery_app/features/global_widgets/global_dialog.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalLogoutButtonWidget extends StatelessWidget {
  const GlobalLogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){
        logoutDialog(context);
      },
      child: Container(
        width: double.infinity,
        height: AppSize.s40.h,
        decoration: BoxDecoration(
          color: ColorManager.lightRedColor,
          borderRadius: BorderRadius.circular(AppSize.s100.r),
        ),
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout,color: ColorManager.error,),
              SizedBox(width: AppSize.s10.w,),
              Text("تسجيل الخروج",style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: ColorManager.error
              ),),

            ],
          ),
        ),
      ),
    );
  }

  void logoutDialog(BuildContext context) {

    showCustomDialog(context,dialogTitle: "تسجيل الخروج",

        actionButtonColor: ColorManager.error,
        actionButtonHint: "تسجيل الخروج",actionButtonCallBack: (){},content:Column(
          children: [
            SizedBox(height: AppSize.s20.h,),
            Text("هل أنت متأكد أنك تريد تسجيل الخروج؟",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorManager.hintColor,

                ),),
            SizedBox(height: AppSize.s20.h,),
          ],
        ) );
  }
}
