import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/mail_auth_cubit/mail_auth_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/popup_toast_helper.dart';
import '../../../../../../data/models/verification_args_model.dart';

class MailAuthRegisterButton extends StatelessWidget {
  final bool isButtonEnabled;
  final UserModel
      userModel; // Replace 'dynamic' with your actual UserModel type
  final GlobalKey<FormState> formKey;
  final UserFormData userFormData;

  const MailAuthRegisterButton({
    super.key,
    required this.isButtonEnabled,
    required this.userModel,
    required this.formKey,
    required this.userFormData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MailAuthCubit, MailAuthStates>(
      listener: (context, state) {
        if (state is MailAuthSignUpSuccessState) {
          Navigator.pushNamed(
            context,
            Routes.successAuthRoute,
            arguments: VerificationArgs(
              isSignUpFlow: true,
              userModel: userModel,
            ),
          );

        }

        if (state is MailAuthSignUpErrorState) {
          showCustomToast(context, "حدث خطا ما حاول في وقت لاحق",type: ToastType.error);
        }
      },
      builder: (context, state) {
        var cubit = MailAuthCubit.get(context);
        // Logic fix: Show loader IF state is loading, otherwise show button
        if (state is MailAuthSignUpLoadingState) {
          return const GlobalLoadingIndicator();
        }

        return GlobalButtonWidget(
          isButtonEnabled: isButtonEnabled,
          width: double.infinity,
          text: "متابعة",
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              cubit.registerWithEmailAndPassword(
                  email: userFormData.email, password: userFormData.password);
            }
          },
        );
      },
    );
  }
}


class MailAuthSignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController mailController;
  final TextEditingController passwordController;
  final bool isButtonEnabled;

  const MailAuthSignInButton({
    super.key,
    required this.formKey,
    required this.mailController,
    required this.passwordController,
    required this.isButtonEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MailAuthCubit, MailAuthStates>(
      listener: (context, state) {
        if (state is MailAuthSignInSuccessState) {
          Navigator.pushNamed(
            context,
            Routes.successAuthRoute,
            arguments: VerificationArgs(
              isSignUpFlow: false,
              userModel: UserModel(
                userPassword: passwordController.text,
                userMail: mailController.text,
                userLocation: 'existed user',
                userName: 'existed user',
                phoneNumber: 'existed user',
              ),
            ),
          );
        }

        if (state is MailAuthSignUpErrorState) {
          showCustomToast(context, "حدث خطا ما حاول في وقت لاحق",type: ToastType.error);
        }
      },
      builder: (context, state) {
        // Handle loading state inside the builder
        if (state is MailAuthSignInLoadingState) {
          return const GlobalLoadingIndicator();
        }

        return GlobalButtonWidget(
          isButtonEnabled: isButtonEnabled,
          width: double.infinity,
          text: "متابعة",
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<MailAuthCubit>().signInWithEmailAndPassword(
                email: mailController.text,
                password: passwordController.text,
              );
            }
          },
        );
      },
    );
  }
}

class UserFormData {
  final String email, password;

  UserFormData({required this.email, required this.password});
}
