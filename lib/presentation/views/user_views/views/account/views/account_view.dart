
import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/resources/routes_manager.dart';
import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/models/user_model.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/user_info_cubit/user_info_cubit.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_account_info_section_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_ads_bar_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_account_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_loading_indicator.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_logout_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/presentation/views/user_views/views/account/views/ads_partner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key, required this.userModel});

  static String id = "AccountView";

  final UserModel userModel;

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit()..getUserByPhoneNumber(widget.userModel.phoneNumber),
      child: BlocBuilder<UserInfoCubit, UserInfoStates>(

        builder: (context, state) {

          if(state is UserInfoLoadingState){
            return const Center(
              child: GlobalLoadingIndicator(),
            );
          }else if(state is UserInfoLoadedState){
            return GlobalPaddingWidget(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "الحساب",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s30.h,
                    ),
                     GlobalAccountInfoSectionWidget(
                      joinDate: "انضم منذ 12 اكتوبر 2024",
                      userName: state.userModel.userName,
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
                        Navigator.pushNamed(context, Routes.editAccountRoute).then((value){
                          if (value == 'refresh') {
                            // Trigger rebuild or reload data
                            setState(() {});
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                     GlobalProfileCardWidget(
                      fieldName: "الاسم بالكامل",
                      fieldValue: state.userModel.userName,
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                     GlobalProfileCardWidget(
                      fieldName: "رقم الهاتف",
                      fieldValue: state.userModel.phoneNumber,
                    ),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                    GlobalProfileCardWidget(
                      height: AppSize.s70.h,
                      fieldName: "العنوان",
                      fieldValue: state.userModel.userLocation,
                    ),
                    GlobalAdsBarWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, AdsPartnerView.id);
                      },
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    const GlobalLogoutButtonWidget(),
                    SizedBox(
                      height: AppSize.s10.h,
                    ),
                  ],
                ),
              ),
            );
          }else{
            return  Center(
              child: Text("حدث خطاء اعد المحاولة في وقت لاحق....! ", style: Theme.of(context).textTheme.titleLarge,),
            );
          }

        },
      ),
    );
  }
}
