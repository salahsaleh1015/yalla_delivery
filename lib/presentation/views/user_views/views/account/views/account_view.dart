import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/domain/usecases/cache_user_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_caching_cubit/user_caching_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_section_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_logout_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../injection.dart';

class AccountView extends StatefulWidget {
  const AccountView({
    super.key,
  });

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCachingCubit>(
      create: (context) => UserCachingCubit(sl.get<CacheUserUseCase>(),
          sl.get<GetCachedUserUseCase>(), sl<UpdateCachedUserUseCase>())
        ..loadCachedUser(),
      child: BlocBuilder<UserCachingCubit, UserCachingStates>(
        builder: (context, state) {
          var cubit = UserCachingCubit.get(context);
          if (state is UserCachingLoadingState) {
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          } else if (state is UserCachingLoadedState) {
            var cachedUserModel = state.cachedUserModel;
            return GlobalPaddingWidget(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "الحساب",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                    GlobalAccountInfoSectionWidget(
                      joinDate: "انضم منذ 12 اكتوبر 2024",
                      userName: cubit.cachedUserModel.userName,
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    Divider(
                      color: ColorManager.socialButtonColor,
                      height: AppSize.s1.h,
                    ),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                    GlobalAccountInfoBarWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.editAccountRoute);
                      },
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    GlobalProfileCardWidget(
                      fieldName: "الاسم بالكامل",
                      fieldValue: cachedUserModel.userName,
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    GlobalProfileCardWidget(
                      fieldName: "رقم الهاتف",
                      fieldValue:cachedUserModel.phoneNumber,
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    GlobalProfileCardWidget(
                      height: AppSize.s70.h,
                      fieldName: "العنوان",
                      fieldValue: cachedUserModel.userLocation,
                    ),
                    // GlobalAdsBarWidget(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, AdsPartnerView.id);
                    //   },
                    // ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                     GlobalLogoutButtonWidget(
                      actionButtonCall: (){},
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "هناك خطأ ما حاول مره اخرى لاحقا",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
        },
      ),
    );
  }
}
