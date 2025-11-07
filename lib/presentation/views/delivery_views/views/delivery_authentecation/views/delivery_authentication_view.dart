import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/view_models/delivery_view_models/delivery_authentication_cubit/delivery_authentication_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../global_widgets/global_loading_indicator.dart';

class DeliveryAuthenticationView extends StatefulWidget {
  const DeliveryAuthenticationView({super.key});

  @override
  State<DeliveryAuthenticationView> createState() =>
      _DeliveryAuthenticationViewState();
}

class _DeliveryAuthenticationViewState
    extends State<DeliveryAuthenticationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  void _checkIfFieldAreFilled() {
    final isFilled =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkIfFieldAreFilled);
    passwordController.addListener(_checkIfFieldAreFilled);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryAuthenticationCubit>(
      create: (context) => DeliveryAuthenticationCubit(),
      child: Scaffold(
        body: GlobalPaddingWidget(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Text("مرحباً بعودتك!",
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  Text(
                      "قم بتسجيل الدخول إلى حسابك لبدء رحله جديده و استقبال طلباتك.",
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Text("البريد الالكتروني",
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                  GlobalTextFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "ادخل البريد الخاص بك";
                      }

                      // Basic email pattern
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      // Check valid email format
                      if (!emailRegex.hasMatch(value)) {
                        return "من فضلك أدخل بريد إلكتروني صحيح";
                      }

                      // Check if it's Gmail specifically
                      if (!value.toLowerCase().endsWith('@gmail.com')) {
                        return "يجب أن يكون البريد من نوع Gmail فقط";
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "ادخل البريد الخاص بك",
                    textInputType: TextInputType.text,
                    onSaved: (val) => emailController.text = val!,
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  Text("كلمه المرور",
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                  GlobalTextFieldWidget(
                    controller: passwordController,
                    validator: (val) {
                      if (val!.length < 10) {
                        return "ادخل كلمه المرور بشكل صحيح";
                      }
                      return null;
                    },
                    hintText: "ادخل كلمه المرور",
                    textInputType: TextInputType.text,
                    onSaved: (val) {
                      passwordController.text = val!;
                    },
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),

                  ///todo: make admin add email and password to every delivery account
                  BlocConsumer<DeliveryAuthenticationCubit,
                      DeliveryAuthenticationStates>(
                    listener: (context, state) {
                      if (state is DeliveryAuthenticationErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            backgroundColor: ColorManager.black,
                            content: const Text('حدث خطا في الاتصال'),
                          ),
                        );
                      }

                      if (state is DeliveryAuthenticationSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.deliveryMainLayoutRoute,
                          arguments: emailController.text,
                        );
                      }
                    },
                    builder: (context, state) {
                      var cubit = DeliveryAuthenticationCubit.get(context);

                      if (state is DeliveryAuthenticationLoadingState) {
                        return const Center(child: GlobalLoadingIndicator());
                      }

                      // بعد ما يحصل Error أو Success بنرجع الزرار تاني
                      return GlobalButtonWidget(
                        isButtonEnabled: isButtonEnabled,
                        width: double.infinity,
                        text: "متابعة",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            cubit.deliverySignInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
