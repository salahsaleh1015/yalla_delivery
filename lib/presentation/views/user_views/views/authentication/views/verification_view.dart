import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/user_model.dart';
import 'package:delivery_app/presentation/models/verification_args_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../authentication_widgets/auth_dialog.dart';
import '../authentication_widgets/otpTextField.dart';

class VerificationView extends StatefulWidget {
  VerificationView(
      {super.key, required this.userModel, required this.isSignUpFlow});

  final UserModel userModel;
  final bool isSignUpFlow;

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  String otp = '';

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
                onOtpCompleted: (code) {
                  setState(() {
                    otp = code;
                  });
                },
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
  }

  Widget _buildPhoneNumberVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthStates>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneAuthOTPVerified) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            Routes.successAuthRoute,
            arguments: VerificationArgs(
                isSignUpFlow: widget.isSignUpFlow, userModel: widget.userModel),
          );
        }

        if (state is PhoneAuthError) {
          final error = (state).errorMsg;
          print(error);
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
