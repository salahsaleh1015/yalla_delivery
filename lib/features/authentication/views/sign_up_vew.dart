
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

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';
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
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium),
               SizedBox(
                height: AppSize.s10.h,
              ),
              const GlobalTextFieldWidget(
                hintText: "الاسم بالكامل",
                textInputType: TextInputType.text,
              ),
               SizedBox(
                height: AppSize.s30.h,
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
              Text("العنوان بالتفصيل",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium),
              SizedBox(
                height: AppSize.s10.h,
              ),
              GlobalTextFieldWidget(
                height: AppSize.s80.h,
                hintText: "أدخل عنوانك",
                textInputType: TextInputType.multiline,
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              GlobalButtonWidget(
                width: double.infinity,
                text: "متابعة",
                onTap: () {
                  Navigator.pushNamed(context, VerificationView.id);
                },
              ),
               SizedBox(
                height: AppSize.s100.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
