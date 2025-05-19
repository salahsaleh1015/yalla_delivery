
import 'package:delivery_app/features/authentication/views/verification_view.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';

import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
              Text("رقم الهاتف",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium),
              SizedBox(
                height: AppSize.s10.h,
              ),
              const GlobalTextFieldWidget(
                hintText: "رقم الهاتف",
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                isButtonEnabled: true,
                width: double.infinity,
                text: "متابعة",
                onTap: () {
                  Navigator.pushNamed(context, Routes.verificationRoute);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
