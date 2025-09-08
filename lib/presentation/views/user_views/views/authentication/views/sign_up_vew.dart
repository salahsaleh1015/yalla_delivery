
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../authentication_widgets/auth_dialog.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                  validator: (value) {
                    if (value!.length != 11) {
                      return "ادخل رقم هاتف صحيح";
                    }
                    return null;
                  },
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
                  onTap:() {
                     _registerUser(context);
                  }
                ),
              _buildPhoneNumberSubmittedBloc(),
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

  Widget _buildPhoneNumberSubmittedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthStates>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneAuthNumberSubmitted) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.verificationRoute,
            arguments:  VerificationArgs(
              isSignUpFlow: true,

              userModel: UserModel(
                phoneNumber: _phoneController.text,
                userLocation: _locationController.text,
                userName: _nameController.text,
              ),
            ),);
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

  Future<void> _registerUser(BuildContext context) async {
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
