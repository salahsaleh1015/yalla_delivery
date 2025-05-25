
import 'package:delivery_app/presentation/features/views/account/views/ads_partner_view.dart';
import 'package:delivery_app/presentation/features/views/account/views/edit_account_view.dart';
import 'package:delivery_app/presentation/global_widgets/global_account_widgets/global_account_info_bar_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_account_widgets/global_account_info_section_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_account_widgets/global_ads_bar_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_account_widgets/global_profile_card_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_logout_button_widget.dart';
import 'package:delivery_app/presentation/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AccountView extends StatelessWidget {
  const AccountView({super.key});
  static String id = "AccountView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalPaddingWidget(
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
            const GlobalAccountInfoSectionWidget(
              joinDate: "انضم منذ 12 اكتوبر 2024",

              userName: "محمود الفيشاوي",
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
              onPressed: (){
                Navigator.pushNamed(context, EditAccountView.id);
              },
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            const GlobalProfileCardWidget(
              fieldName: "الاسم بالكامل",
              fieldValue: "محمود احمد الفيشاوي",
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            const GlobalProfileCardWidget(
              fieldName: "رقم الهاتف",
              fieldValue: "+20 000 111 2222",
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
             GlobalProfileCardWidget(
              height: AppSize.s70.h,
              fieldName: "العنوان",
              fieldValue: "محافظة الجيزة , السادس من اكتوبر , الشيخ زايد",
            ),
             GlobalAdsBarWidget(
              onPressed: (){
                Navigator.pushNamed(context, AdsPartnerView.id);
              },
            ),
            SizedBox(
              height: AppSize.s50.h,
            ),
            const GlobalLogoutButtonWidget(),
          ],
        ),
      ),
    );
  }
}
