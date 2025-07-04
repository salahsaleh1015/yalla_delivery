


import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/user_model.dart';
import 'package:delivery_app/presentation/models/verification_args_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/authentication_widgets/auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late String phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled = _phoneNumberController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_checkIfFieldAreFilled);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: GlobalPaddingWidget(
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
                Text("مرحباً بعودتك!",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "قم بتسجيل الدخول إلى حسابك للوصول إلى طلباتك وإدارة تفضيلاتك.",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                Text("رقم الهاتف",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  validator: (value) {
                    if (value!.length != 11) {
                      return "ادخل رقم هاتف صحيح";
                    }
                    return null;
                  },
                  onSaved: (value) => phoneNumber = value!,
                  controller: _phoneNumberController,
                  hintText: "رقم الهاتف",
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                GlobalButtonWidget(
                  isButtonEnabled: isButtonEnabled,
                  width: double.infinity,
                  text: "متابعة",
                  onTap:() {


                    Navigator.pushNamed(
                      context,
                      Routes.verificationRoute,
                      arguments:  VerificationArgs(
                        isSignUpFlow: false,
                        phoneNumber: '123',

                        userModel: UserModel(
                          phoneNumber: _phoneNumberController.text,
                          userLocation:"existed user",
                          userName: "existed user",
                        ),
                      ),
                    );
                    //  _loginUser(context);
                  },
                ),
              //  _buildPhoneNumberSubmittedBloc()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberSubmittedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneAuthNumberSubmitted) {
          Navigator.pop(context);
          Navigator.pushNamed(
              context, Routes.verificationRoute, arguments: phoneNumber);
        }

        if (state is PhoneAuthError) {
          Navigator.pop(context);
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

  Future<void> _loginUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _formKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }


}