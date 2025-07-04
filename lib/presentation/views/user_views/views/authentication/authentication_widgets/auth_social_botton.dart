
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.s48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.inputFillColor,
          borderRadius: BorderRadius.circular(AppSize.s48.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.googleIcon,
                width: AppSize.s30.w,
                height: AppSize.s30.h,
              ),
              SizedBox(
                width: AppSize.s10.w,
              ),
              Text(
                "متابعة باستخدام جوجل",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
