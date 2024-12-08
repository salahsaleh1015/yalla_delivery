import 'package:delivery_app/features/authentication/authentication_widgets/auth_social_botton.dart';
import 'package:delivery_app/features/authentication/authentication_widgets/or_break_widget.dart';
import 'package:delivery_app/features/authentication/authentication_widgets/terms_text.dart';
import 'package:delivery_app/features/global_widgets/global_button_widget.dart';
import 'package:delivery_app/features/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../authentication_widgets/resend_verification_text.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static String id = 'VerificationView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: AppPadding.p20.w,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: AppSize.s50.h,
              ),
              GlobalCircularButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                iconColor: ColorManager.black,
                icon: Icons.arrow_back,
              ),
               SizedBox(
                height: AppSize.s20.h,
              ),
              Text("تحقق من حسابك",
                  style: Theme.of(context).textTheme.displayMedium),
               SizedBox(
                height: AppSize.s20.h,
              ),
              Text(
                  "لقد أرسلنا رمز مكون من 6 أرقام إلى رقم هاتفك المسجل. يرجى إدخال الرمز أدناه لتأكيد حسابك.",
                  style: Theme.of(context).textTheme.labelSmall),
               SizedBox(
                height: AppSize.s50.h,
              ),
              OtpTextField(
                focusedBorderColor: ColorManager.hintColor,
                enabledBorderColor: ColorManager.primary,
                numberOfFields: 6,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
               SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                width: double.infinity,
                text: "إرسال الرمز",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainLayoutView.id,
                        (Route<dynamic> route) => false,
                  );
                },
              ),
              const ResendVerificationText(),

            ],
          ),
        ),
      ),
    );
  }
}
