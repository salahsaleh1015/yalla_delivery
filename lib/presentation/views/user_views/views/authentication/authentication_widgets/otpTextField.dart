




import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/constants_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class OtpTextField extends StatelessWidget {


  final Function(String) onOtpCompleted;
   const OtpTextField({super.key, required this.onOtpCompleted});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: AppConstant.otpLength,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
          activeColor: ColorManager.primary,
          inactiveColor: ColorManager.primary,
          selectedColor: ColorManager.primary,
          fieldHeight: AppSize.s50.h,
          fieldWidth: AppSize.s40.w,
          activeFillColor: Colors.white,
          activeBorderWidth: AppSize.s1.w,
          inactiveFillColor: ColorManager.white,
          selectedFillColor: ColorManager.white,
        ),
        animationDuration:  const Duration(milliseconds: AppConstant.otpAnimationDuration),
        backgroundColor: ColorManager.scaffoldBackgroundColor,
        enableActiveFill: true,

        onCompleted: (otpCode) {
          onOtpCompleted(otpCode);
        },
        onChanged: (value) {
          print(value);

        },

      ),
    );
  }
}