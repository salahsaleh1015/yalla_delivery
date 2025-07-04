
import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../global_widgets/global_button_widget.dart';



class FailureAuthView extends StatelessWidget {
  const FailureAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: GlobalPaddingWidget(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsManager.notFound,
                  height: AppSize.s150.h,
                  width: AppSize.s150.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                Text(
                  "مرحبًا، لقد سجلت الدخول ولكن!",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: ColorManager.primary),
                ),
                SizedBox(
                  height: AppSize.s15.h,
                ),
                Text(
                  "لا توجد بيانات خاصه بك لدينا عد و سيتم توجيهك إلى واجهتك الرئيسية...",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: ColorManager.secondaryTextColor,
                  ),
                ),
                SizedBox(
                  height: AppSize.s55.h,
                ),
                GlobalButtonWidget(
                    text: "عد",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
                    },
                    width: double.infinity,
                    isButtonEnabled: true)
              ],
            ),
          )),
    );
  }
}
