import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/constants_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:delivery_app/data/models/verification_args_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/mail_auth_cubit/mail_auth_cubit.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/utils/popup_toast_helper.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        _mailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkIfFieldAreFilled);
    _mailController.addListener(_checkIfFieldAreFilled);
  }

  @override
  void dispose() {
    _mailController.dispose();
    _passwordController.dispose();
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
                    style: Theme.of(context).textTheme.displayMedium),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "قم بتسجيل الدخول إلى حسابك للوصول إلى طلباتك وإدارة تفضيلاتك.",
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(
                  height: AppSize.s50.h,
                ),

                Text("الريد الايكتروني",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  validator: AppConstant.emailValidation,
                  controller: _mailController,
                  hintText: "الريد الالكتروني",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                Text("كلمه السر",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  letterSpacing: 3.0,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return "ادخل كلمه السر";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  hintText: "كلمه السر",
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                // Text("رقم الهاتف",
                //     style: Theme.of(context).textTheme.headlineMedium),
                // SizedBox(
                //   height: AppSize.s10.h,
                // ),
                // GlobalTextFieldWidget(
                //   validator: (value) {
                //     if (value != null && value.isNotEmpty) {
                //       final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
                //       if (!regex.hasMatch(value.trim())) {
                //         return "أدخل رقم هاتف مصري صحيح مثل 01012345678";
                //       }
                //     }
                //     return null;
                //   },
                //   onSaved: (value) => phoneNumber = value!,
                //   controller: _phoneNumberController,
                //   hintText: "رقم الهاتف",
                //   textInputType: TextInputType.phone,
                // ),
                // SizedBox(
                //   height: AppSize.s30.h,
                // ),
                BlocProvider<MailAuthCubit>(
                  create: (context) => MailAuthCubit(),
                  child: BlocConsumer<MailAuthCubit, MailAuthStates>(
                    listener: (context, state) {
                      if (state is MailAuthSignInSuccessState) {
                        Navigator.pushNamed(
                          context,
                          Routes.successAuthRoute,
                          arguments: VerificationArgs(
                            isSignUpFlow: false,
                            userModel: UserModel(
                              userPassword: _passwordController.text,
                              userMail: _mailController.text,
                                userLocation: 'existed user',
                                userName: 'existed user',
                                phoneNumber: 'existed user'),
                          ),
                        );
                      }

                      if (state is MailAuthSignUpErrorState) {
                        showCustomToast(context, "حدث خطا ما حاول في وقت لاحق");
                      }
                    },
                    builder: (context, state) {
                      var cubit = MailAuthCubit.get(context);
                      return GlobalButtonWidget(
                        isButtonEnabled: isButtonEnabled,
                        width: double.infinity,
                        text: "متابعة",
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            cubit.signInWithEmailAndPassword(
                                email: _mailController.text,
                                password: _passwordController.text);
                          }
                        },
                      );
                    },
                  ),
                ),
                //   _buildPhoneNumberSubmittedBloc()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildPhoneNumberSubmittedBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthStates>(
  //     listenWhen: (previous, current) => previous != current,
  //     listener: (context, state) {
  //       if (state is PhoneAuthLoading) {
  //         showProgressIndicator(context);
  //       }
  //
  //       if (state is PhoneAuthNumberSubmitted) {
  //         Navigator.pop(context);
  //         Navigator.pushNamed(context, Routes.verificationRoute,
  //             arguments: VerificationArgs(
  //                 isSignUpFlow: false, userModel: UserModel(
  //               phoneNumber: _phoneNumberController.text,
  //               userLocation: "existed user",
  //               userName: "existed user",
  //             ),));
  //       }
  //
  //       if (state is PhoneAuthError) {
  //
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               duration: const Duration(seconds: 3),
  //               backgroundColor: ColorManager.black,
  //               content: const Text('هناك خطا ما تاكد من اتصالك بالانترنت')),
  //         );
  //       }
  //     },
  //     child: Container(),
  //   );
  // }
  //
  // Future<void> _loginUser(BuildContext context) async {
  //   if (!_formKey.currentState!.validate()) {
  //     Navigator.pop(context);
  //     return;
  //   } else {
  //     Navigator.pop(context);
  //     _formKey.currentState!.save();
  //     BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
  //   }
  // }
}
