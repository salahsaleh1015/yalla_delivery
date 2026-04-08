import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/constants_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:delivery_app/data/models/verification_args_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/mail_auth_cubit/mail_auth_cubit.dart';

import 'package:delivery_app/presentation/view_models/user_view_models/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/authentication/authentication_widgets/mail_auth_register_and_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/popup_toast_helper.dart';
import '../authentication_widgets/auth_dialog.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});
//
//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }
//
// class _SignUpViewState extends State<SignUpView> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   bool isButtonEnabled = false;
//
//   late String name, phoneNumber, location;
//
//   void _checkIfFieldsAreFilled() {
//     final isFilled = _nameController.text.isNotEmpty &&
//         _phoneController.text.isNotEmpty &&
//         _locationController.text.isNotEmpty;
//
//     setState(() {
//       isButtonEnabled = isFilled;
//     });
//   }
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//     _nameController.addListener(_checkIfFieldsAreFilled);
//     _phoneController.addListener(_checkIfFieldsAreFilled);
//     _locationController.addListener(_checkIfFieldsAreFilled);
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _locationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: GlobalPaddingWidget(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GlobalCircularButtonWidget(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   iconColor: ColorManager.black,
//                   icon: Icons.arrow_back,
//                 ),
//                 SizedBox(
//                   height: AppSize.s20.h,
//                 ),
//                 Text("أنشئ حسابًا",
//                     style: Theme.of(context).textTheme.displayMedium),
//                 SizedBox(
//                   height: AppSize.s20.h,
//                 ),
//                 Text(
//                     "انضم إلينا اليوم لفتح الميزات، إدارة الطلبات، والبقاء على اتصال باحتياجاتك من التوصيل!",
//                     style: Theme.of(context).textTheme.labelSmall),
//                 SizedBox(
//                   height: AppSize.s20.h,
//                 ),
//                 Text("الاسم بالكامل",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 SizedBox(
//                   height: AppSize.s10.h,
//                 ),
//                 GlobalTextFieldWidget(
//                   validator: (val) {
//                     if (val!.length < 10) {
//                       return "ادخل الاسم بالكامل";
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => name = value!,
//                   controller: _nameController,
//                   hintText: "الاسم بالكامل",
//                   textInputType: TextInputType.text,
//                 ),
//                 SizedBox(
//                   height: AppSize.s30.h,
//                 ),
//                 Text("رقم الهاتف",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 SizedBox(
//                   height: AppSize.s10.h,
//                 ),
//                 GlobalTextFieldWidget(
//                   letterSpacing: 3.0,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
//                       if (!regex.hasMatch(value.trim())) {
//                         return "أدخل رقم هاتف مصري صحيح مثل 01012345678";
//                       }
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => phoneNumber = value!,
//                   controller: _phoneController,
//                   hintText: "رقم الهاتف",
//                   textInputType: TextInputType.phone,
//                 ),
//                 SizedBox(
//                   height: AppSize.s30.h,
//                 ),
//                 Text("العنوان بالتفصيل",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 SizedBox(
//                   height: AppSize.s10.h,
//                 ),
//                 GlobalTextFieldWidget(
//                   validator: (val) {
//                     if (val!.length < 30) {
//                       return "ادخل عنوانك بالتفصيل";
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => location = value!,
//                   controller: _locationController,
//                   height: AppSize.s80.h,
//                   hintText: "أدخل عنوانك",
//                   textInputType: TextInputType.multiline,
//                 ),
//                 SizedBox(
//                   height: AppSize.s30.h,
//                 ),
//                 GlobalButtonWidget(
//                     isButtonEnabled: isButtonEnabled,
//                     width: double.infinity,
//                     text: "متابعة",
//                     onTap: () {
//                       _registerUser(context);
//                     }),
//                 _buildPhoneNumberSubmittedBloc(),
//                 SizedBox(
//                   height: AppSize.s100.h,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberSubmittedBloc() {
//     return BlocListener<PhoneAuthCubit, PhoneAuthStates>(
//       listenWhen: (previous, current) => previous != current,
//       listener: (context, state) {
//         if (state is PhoneAuthLoading) {
//           showProgressIndicator(context);
//         }
//
//         if (state is PhoneAuthNumberSubmitted) {
//           Navigator.pushNamed(
//             context,
//             Routes.verificationRoute,
//             arguments: VerificationArgs(
//               isSignUpFlow: true,
//               userModel: UserModel(
//                 phoneNumber: _phoneController.text,
//                 userLocation: _locationController.text,
//                 userName: _nameController.text,
//               ),
//             ),
//           );
//         }
//
//         if (state is PhoneAuthError) {
//
//
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 duration: const Duration(seconds: 3),
//                 backgroundColor: ColorManager.black,
//                 content: const Text('هناك خطا ما تاكد من اتصالك بالانترنت')),
//           );
//         }
//       },
//       child: Container(),
//     );
//   }
//
//   Future<void> _registerUser(BuildContext context) async {
//     if (!_formKey.currentState!.validate()) {
//       Navigator.pop(context);
//       return;
//     } else {
//       Navigator.pop(context);
//       _formKey.currentState!.save();
//       BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
//     }
//   }
// }

class FirstSignUpView extends StatefulWidget {
  const FirstSignUpView({super.key});

  @override
  State<FirstSignUpView> createState() => _FirstSignUpViewState();
}

class _FirstSignUpViewState extends State<FirstSignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isButtonEnabled = false;

  late String name, phoneNumber, location;

  void _checkIfFieldsAreFilled() {
    final isFilled = _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _locationController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfFieldsAreFilled);
    _phoneController.addListener(_checkIfFieldsAreFilled);
    _locationController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
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
                Text("أنشئ حسابًا",
                    style: Theme.of(context).textTheme.displayMedium),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "انضم إلينا اليوم لفتح الميزات، إدارة الطلبات، والبقاء على اتصال باحتياجاتك من التوصيل!",
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text("الاسم بالكامل",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  validator: (val) {
                    if (val!.length < 10) {
                      return "ادخل الاسم بالكامل";
                    }
                    return null;
                  },
                  onSaved: (value) => name = value!,
                  controller: _nameController,
                  hintText: "الاسم بالكامل",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                Text("رقم الهاتف",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  letterSpacing: 3.0,
                  validator: AppConstant.phoneValidation,
                  onSaved: (value) => phoneNumber = value!,
                  controller: _phoneController,
                  hintText: "رقم الهاتف",
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                Text("العنوان بالتفصيل",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  validator: (val) {
                    if (val!.length < 30) {
                      return "ادخل عنوانك بالتفصيل";
                    }
                    return null;
                  },
                  onSaved: (value) => location = value!,
                  controller: _locationController,
                  height: AppSize.s80.h,
                  hintText: "أدخل عنوانك",
                  textInputType: TextInputType.multiline,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                GlobalButtonWidget(
                    isButtonEnabled: isButtonEnabled,
                    width: double.infinity,
                    text: "متابعة",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, Routes.secondSignUpRoute,
                            arguments: FirstSignUpInfoModel(
                                location: location,
                                name: name,
                                phoneNumber: phoneNumber));
                      }
                    }),
                SizedBox(
                  height: AppSize.s100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondSignUpView extends StatefulWidget {
  const SecondSignUpView({super.key, required this.firstSignUpInfoModel});

  final FirstSignUpInfoModel firstSignUpInfoModel;
  @override
  State<SecondSignUpView> createState() => _SecondSignUpViewState();
}

class _SecondSignUpViewState extends State<SecondSignUpView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isButtonEnabled = false;

  void _checkIfFieldsAreFilled() {
    final isFilled =
        _mailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _mailController.addListener(_checkIfFieldsAreFilled);
    _passwordController.addListener(_checkIfFieldsAreFilled);
    print("//////////////////////////////////////");
    print(widget.firstSignUpInfoModel.phoneNumber);
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
                Text("أنشئ حسابًا",
                    style: Theme.of(context).textTheme.displayMedium),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "تهانينا, لقد قمت بادخال بياناتك بنجاح الان سجل بريدك الاليكتروني و سيتم استخدلمه مستقبلا للتحقق",
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(
                  height: AppSize.s20.h,
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
                SizedBox(
                  height: AppSize.s30.h,
                ),
                BlocProvider<MailAuthCubit>(
                  create: (context) => MailAuthCubit(),
                  child: BlocConsumer<MailAuthCubit, MailAuthStates>(
                    listener: (context, state) {
                      if (state is MailAuthSignUpSuccessState) {
                        Navigator.pushNamed(
                          context,
                          Routes.successAuthRoute,
                          arguments: VerificationArgs(
                            isSignUpFlow: true,
                            userModel: UserModel(
                                userLocation:
                                    widget.firstSignUpInfoModel.location,
                                userName: widget.firstSignUpInfoModel.name,
                                phoneNumber:
                                    widget.firstSignUpInfoModel.phoneNumber,
                                userMail: _mailController.text,
                                userPassword: _passwordController.text),
                          ),
                        );
                        showCustomToast(context, "تم تسجيل الدخول بنجاح",type: ToastType.success);
                      }

                      if (state is MailAuthSignUpErrorState) {
                        print("////////////////////////");
                        print("// ${state.errorMessage} /// ");
                        if (state.errorMessage == '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
                          showCustomToast(context, "هذا البريد موجود بالفعل",type: ToastType.error);
                        } else {
                          showCustomToast(
                              context, "حدث خطا ما حاول في وقت لاحق",type: ToastType.error);
                        }
                      }
                    },
                    builder: (context, state) {
                      var cubit = MailAuthCubit.get(context);
                      // Logic fix: Show loader IF state is loading, otherwise show button
                      if (state is MailAuthSignUpLoadingState) {
                        return Center(child: const GlobalLoadingIndicator());
                      }

                      return GlobalButtonWidget(
                        isButtonEnabled: isButtonEnabled,
                        width: double.infinity,
                        text: "متابعة",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            cubit.registerWithEmailAndPassword(
                                email: _mailController.text,
                                password: _passwordController.text);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstSignUpInfoModel {
  final String location, name, phoneNumber;

  FirstSignUpInfoModel(
      {required this.location, required this.name, required this.phoneNumber});
}
