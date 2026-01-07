import 'package:delivery_app/core/resources/assets_manager.dart';
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/data/models/user_model.dart';
import 'package:delivery_app/data/models/verification_args_model.dart';

import 'package:delivery_app/presentation/view_models/user_view_models/user_info_cubit/user_info_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessAuthView extends StatelessWidget {
  const SuccessAuthView(
      {super.key, required this.userModel, required this.isSignUpFlow});

  final UserModel userModel;
  final bool isSignUpFlow;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoCubit>(
      create: (context) => UserInfoCubit()
        ..addUserToFirebaseStore(
            isSignUpFlow: isSignUpFlow, userModel: userModel),
      child: BlocListener<UserInfoCubit, UserInfoStates>(
        listener: (context, state) {
          if (state is UserInfoAddedSuccessFulState) {
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pushNamed(context, Routes.completeAuthRoute,
                  arguments: VerificationArgs(
                      isSignUpFlow: isSignUpFlow, userModel: userModel));
            });
          }

          if (state is UserInfoErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                backgroundColor: ColorManager.primary,
                content: Text(state.error),
              ),
            );
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
            });
          }

          if (state is UserInfoNotFoundedState) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 5),
                  backgroundColor: ColorManager.primary,
                  content: const Text(
                      "الرقم الذي ادخلته  ليس له بيانات عليك انت تسجل كمستخدم جديد"),
                ),
              );
            });
          }

          if (state is UserInfoFoundedState) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 5),
                  backgroundColor: ColorManager.primary,
                  content: const Text(
                      "الرقم الذي ادخلته موجود بالفعل سجل الدخول بطريقه صحيحه"),
                ),
              );
            });
          }
        },
        child: Scaffold(
          body: GlobalPaddingWidget(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsManager.checkBox,
                  height: AppSize.s150.h,
                  width: AppSize.s150.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                Text(
                  "مرحبًا، لقد سجلت الدخول بنجاح!",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: ColorManager.primary),
                ),
                SizedBox(
                  height: AppSize.s15.h,
                ),
                Text(
                  "مرحباً بك، لحظة وسيتم توجيهك إلى واجهتك الرئيسية...",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.secondaryTextColor,
                      ),
                ),
                SizedBox(
                  height: AppSize.s55.h,
                ),
                const GlobalLoadingIndicator(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
