
import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../resources/constants_manager.dart';
import '../authentication_widgets/otpTextField.dart';
import '../authentication_widgets/resend_verification_text.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

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
             /// otp text field
              const OtpTextField(),
               SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                isButtonEnabled: true,
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



