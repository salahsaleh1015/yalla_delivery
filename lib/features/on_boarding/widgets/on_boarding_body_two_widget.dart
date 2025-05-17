import 'package:delivery_app/features/authentication/views/sign_in_view.dart';
import 'package:delivery_app/features/authentication/views/sign_up_vew.dart';
import 'package:delivery_app/features/on_boarding/widgets/dot_widget.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/values_manager.dart';

class OnBoardingBodyTwoWidget extends StatelessWidget {
  const OnBoardingBodyTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: AppSize.s75.h,
        ),
        SizedBox(
            height: AppSize.s315.h,
            width: AppSize.s315.w,
            child: Image.asset("assets/images/on_boarding_two.png",fit: BoxFit.fill,)),

        Text(
          "مستعد للانضمام",
          style: Theme.of(context).textTheme.displayMedium,
        ),
         SizedBox(
          height: AppSize.s15.h,
        ),
        Container(

          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          height: AppSize.s70.h,
          child: Text(
            "قم بتسجيل الدخول أو إنشاء حسابك الآن لبدء إدارة تجربتك، متابعة طلباتك، تقديم الطلبات، أو توصيلها بكل سهولة وسلاسة.",
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
         SizedBox(
          height: AppSize.s20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotWidget(
              color: ColorManager.lightPrimary,
            ),
             SizedBox(
              width: AppSize.s15.w,
            ),
            DotWidget(
              color: ColorManager.primary,
            ),
          ],
        ),
         SizedBox(
          height: AppSize.s37.h,
        ),
        GlobalButtonWidget(
          isButtonEnabled: true,
          width: AppSize.s312.w,
          text: "إنشاء حساب",
          onTap: () {
            Navigator.pushNamed(context, SignUpView.id);
          },
        ),
         SizedBox(
          height: AppSize.s20.h,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignInView.id);
          },
          child: Text(
            "لدي حساب بالفعل",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
