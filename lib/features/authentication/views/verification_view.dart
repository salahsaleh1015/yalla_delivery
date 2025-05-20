import 'package:delivery_app/features/main_layout/views/main_layout_view.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../resources/constants_manager.dart';
import '../authentication_widgets/auth_dialog.dart';
import '../authentication_widgets/otpTextField.dart';
import '../authentication_widgets/resend_verification_text.dart';
import '../view_model/phone_auth_cubit.dart';

class VerificationView extends StatelessWidget {
  VerificationView({super.key, required this.phoneNumber});

  final String phoneNumber;
  late String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
        child: SingleChildScrollView(
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
              OtpTextField(
                otpCode: otp,
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                isButtonEnabled: true,
                width: double.infinity,
                text: "إرسال الرمز",
                onTap: () {
                  _verifyOTP(context, otp);
                },
              ),
              // const ResendVerificationText(),

              _buildPhoneNumberVerificationBloc(),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOTP(BuildContext context, String otp) async {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otp);
    Navigator.pushReplacementNamed(
      context,
      MainLayoutView.id,
    );
  }

  Widget _buildPhoneNumberVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneAuthOTPVerified) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            Routes.mainLayoutRoute,
          );
        }

        if (state is PhoneAuthError) {
          final error = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(seconds: 3),
                backgroundColor: ColorManager.black,
                content: Text(error)),
          );
        }
      },
      child: Container(),
    );
  }
}
